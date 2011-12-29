class MembersController < ApplicationController
 #  before_filter :require_user, :only => [:index, :edit, :update,:new,:create]
  # GET /members
  # GET /members.xml

#layout :resolve_layout


  def index

     if params[:search]
     #   @members = initialize_grid(Member,
      #  :conditions=>['members.name LIKE ? OR email LIKE ? OR families.name LIKE ? OR house_name LIKE ? ',"%#{params[:search_text]}%","%#{params[:search_text]}%","%#{params[:search_text]}%","%#{params[:search_text]}%"],
       # :include => [:post,:family],
        #:order => "members.id",
        #:per_page => 20)
        @members = Member.paginate(
        :conditions=>['members.name LIKE ? OR email LIKE ? OR families.name LIKE ? OR house_name LIKE ? ',"%#{params[:search_text]}%","%#{params[:search_text]}%","%#{params[:search_text]}%","%#{params[:search_text]}%"],
        :include => [:post,:family],
        :order => "members.id",
        :page => params[:page],
        :per_page => 50,
        :order=>'members.name'
        )

     #  @members = Member.find(:all,:include => [:family],:conditions=>['members.name LIKE ? OR email LIKE ? OR families.name LIKE ? OR house_name LIKE ? ',"%#{params[:search_text]}%","%#{params[:search_text]}%","%#{params[:search_text]}%","%#{params[:search_text]}%"],:order => "members.id DESC")
    else
     # @members = initialize_grid(Member,
    #:include => :post,
    #:order => "members.id",
    #:per_page => 20)
    @members = Member.paginate(
    :include => :post,
    :order => "members.id",
    :page => params[:page],
        :per_page => 50,
        :order=>'members.name'
   )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
    session[:return_url] = ""

  end

  # GET /members/1
  # GET /members/1.xml
  def show

    @member = Member.find(params[:id])

    respond_to do |format|

      format.html # show.html.erb

      format.xml  { render :xml => @member }
    end

  end

  # GET /members/new
  # GET /members/new.xml
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
    session[:relation_id] = ""
    session[:member_id] = ""
    session[:relation_name] = ""
  end

  # POST /members
  # POST /members.xml
  def create
    @member = Member.new(params[:member])
    respond_to do |format|

     if @member.save
       #relation ship saving
         unless params[:relation][:user_id].blank?
             create_relation(params[:relation][:user_id],@member.id)
        end

        #enable signning of a member by saving to users table also
        unless params[:enable_sign_in].blank?
         @user = User.new(params[:user])
         @user.password = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by{rand}.join)[0..10]
         @user.password_confirmation = @user.password
           if @user.save_without_session_maintenance
            @user.deliver_activation_instructions!
            @member.update_attribute('user_id',@user.id)
            unless params[:relation].nil?
              flash[:notice] = 'Relation added successfully.'
            # format.html { redirect_to(:controller=>'relations',:action=>'index',:id=>params[:relation][:user_id] ) }
            format.html{redirect_to(member_path(@member.id), :notice => 'Relation created.')}
            else

              format.html { redirect_to(members_path, :notice => 'Your account has been created. Please check your e-mail for your account  activation instructions!.') }
            end
            else


             flash[:notice] = "Please enter email"
              format.html { render :action => "edit" }

         end
          end
          # end of enable signning of a member by saving to users table also
          unless params[:relation][:user_id].blank?
          # format.html { redirect_to(:controller=>'relations',:action=>'index',:id=>params[:relation][:user_id]) }

          format.html{redirect_to(member_path(params[:relation][:user_id]), :notice => 'Relation created.')}
          else
          format.html { redirect_to(member_path(@member.id), :notice => 'Member was successfully created.') }
          format.xml  { render :xml => @member, :status => :created, :location => @member }
          end

      else

          format.html { render :action => "new" }
          format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }

      end
    end

  end

  # PUT /members/1
  # PUT /members/1.xml
  def update
    @member = Member.find(params[:id])
    respond_to do |format|
       unless params[:enable_sign_in].blank?
         if @member.user_id.blank?
         @user = User.new(params[:user])
         @user.password = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by{rand}.join)[0..10]
         @user.password_confirmation = @user.password
           if @user.save_without_session_maintenance
            @user.deliver_activation_instructions!
            @member.update_attribute('user_id',@user.id)
            flash[:notice] = "Your account has been created. Please check your e-mail for your account  activation instructions!"
            else
               unless params[:relation][:user_id].blank?
                 format.html{redirect_to(member_path(params[:relation][:user_id]))}
           # format.html { redirect_to(:controller=>'relations',:action=>'add_relation',:user_id=>params[:relation][:user_id],:relation_id=>params[:relation][:relation_id],:notice=>@user.errors) }
              else

              flash[:notice] = "Please enter email"
              format.html { render :action => "edit" }
              end
            end

        end
      end


      if @member.update_attributes(params[:member])
        unless params[:relation][:user_id].blank?
          create_relation(params[:relation][:user_id],@member.id)
        end
           unless params[:relation][:user_id].blank?
          #  format.html { redirect_to(session[:return_url], :notice => 'Member was successfully updated.') }
          format.html{redirect_to(member_path(params[:relation][:user_id]), :notice => 'Relation created.')}

          else
          format.html { redirect_to(members_path, :notice => 'Member was successfully updated.') }
          format.xml  { head :ok }

          end

      else

        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }

      end
    end

  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    if @member.parent_member_relations.find(:all,:conditions=>['relation_id = ?',PARENT]).blank?
      unless @member.user.nil?
        @member.user.destroy
      end
      #delelete parent and spouse relation
      @relations = @member.child_member_relations
      unless @relations.nil?
        @relations.each do |relation|
            relation.destroy
        end
      end
      @relation = Relation.find_by_related_user_id_and_relation_id(@member.id,SPOUSE)
      @relation.destroy unless @relation.blank?
      @member.destroy
      respond_to do |format|
        format.html { redirect_to(members_url) }
        format.xml  { head :ok }
      end
  else
    flash[:notice] = "You cannot delete this member without deleting this member's children"
    redirect_to(members_url)
  end
end

  def tree
    @member = Member.find(params[:id])
  end

  def family_tree
    @families = Family.all
  end

  def assign_post
     if  params[:post_id]
       @member = Member.find(params[:member_id])
       @posts = Post.all
      if params[:post_id].to_s == "no_post"
        flash[:notice] = 'Please select  post'

      else
        @member.update_attribute('post_id',params[:post_id])
        flash[:notice] = 'Success'
        redirect_to members_path
      end
    else
      @member = Member.find(params[:id])
      @posts = Post.all
  end
 end

 def committee_members
   @members = Member.find(:all,:include=>'post',:conditions=>['post_id != ?',""],:order=>'posts.level')
   @content_management = ContentManagement.find(:first,:conditions=>['UPPER(page) = ? AND UPPER(identification)= ?','COMMITTEE MEMBERS','PREV_MEMBERS'])
 end

private
#related_user_id => new member_id
#user_id => my id
  def create_relation(user_id,related_user_id)
    @me = Member.find_by_id(user_id)

    #add relationship parent
    if (session[:relation_name] == 'Father' || session[:relation_name] == 'Mother')
       Relation.add_parent_relationship(@me,user_id,related_user_id)
    end

  #add relationship children
     if (session[:relation_name] == 'Sons' || session[:relation_name] == 'Daughters')
      Relation.add_children_relationship(user_id,related_user_id)
     end


    #add relationship siblings
     if (session[:relation_name] == 'Brothers' || session[:relation_name] == "Sisters")
        Relation.add_sibling_relationship(@me,user_id,related_user_id)
     end

    # Add spouse
    if session[:relation_name] == 'Spouse'
       Relation.add_spouse_relationship(@me,user_id,related_user_id)
    end
    session[:relation_id] = ""
    session[:member_id] = ""
    session[:relation_name] = ""
  end

   def resolve_layout
    case action_name
    when "show"
      "application_alternate"
    else
      "application"
    end

  end

end

