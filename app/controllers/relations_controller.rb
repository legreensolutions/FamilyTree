class RelationsController < ApplicationController
  def index
    session[:return_url] = request.request_uri
    @member = Member.find(params[:id])
    session[:relation_id] = ""
    session[:member_id] = ""
  end

  def add_relation
    @member = Member.new
  end


  def find

    if params[:member_id].to_i == 0
      @member = Member.new
      render 'relations/member_new',:layout=>false

    else
      session[:relation_name] = params[:relation_name]

      @member = Member.find(params[:member_id])
      session[:member_id] = @member.id          # sujith  - session variable seems to dye in rails 3 ! .. so reassigned
      @gender_of_new_member = MALE
      render 'relations/member_edit',:layout=>false
    end

  end

end

