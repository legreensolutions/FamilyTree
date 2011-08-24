class RelationsController < ApplicationController
  def index
    session[:return_url] = request.request_uri
    @member = Member.find(params[:id])
  end

  def add_relation

    @member = Member.new
  end


def find
  if params[:member_id].to_i == 0
    @member = Member.new
    render 'relations/member_new',:layout=>false

  else
      @member = Member.find(params[:member_id])
    render 'relations/member_edit',:layout=>false
  end
end

end

