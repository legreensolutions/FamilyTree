class MembersController < ApplicationController
 #  before_filter :require_user, :only => [:index, :edit, :update,:new,:create]
  # GET /members
  # GET /members.xml
  def index

     if params[:search]
       @members = Member.find(:all,:include => [:family],:conditions=>['members.name LIKE ? OR email LIKE ? OR families.name LIKE ? OR house_name LIKE ? ',"%#{params[:search_text]}%","%#{params[:search_text]}%","%#{params[:search_text]}%","%#{params[:search_text]}%"],:order => "members.id DESC")
    else
      @members = Member.all
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

  end

  # POST /members
  # POST /members.xml
  def create
    @member = Member.new(params[:member])
    respond_to do |format|

     if @member.save
       #relation ship saving
         unless params[:relation][:user_id].blank?
          Relation.create(:user_id=>params[:relation][:user_id],:related_user_id=>@member.id,:relation_id=>params[:relation][:relation_id])
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
    session[:relation_id] = params[:relation_id]
session[:member_id] = params[:user_id]
session[:relation_name] = params[:relation_name]
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

          Relation.create(:user_id=>params[:relation][:user_id],:related_user_id=>@member.id,:relation_id=>params[:relation][:relation_id]) if Relation.find_by_user_id_and_relation_id(params[:relation][:user_id],params[:relation][:relation_id]).blank?

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
    session[:relation_id] = params[:relation_id]
session[:member_id] = params[:user_id]
session[:relation_name] = params[:relation_name]
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    unless @member.user.nil?
      @member.user.destroy
    end
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end

  def tree
  end

  def family_tree
  end

end

