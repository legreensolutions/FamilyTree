class ContactUsController < ApplicationController
  before_filter :require_user
  def contact_us

     @committee_members = Member.find(:all,:include=>'posts',:conditions=>['committee_members.post_id != ? AND year = ? AND show_in_contact_us = ? ',"",Date.today.year,true],:order=>'posts.level')
  @admin = Member.find(:first,:include=>'user',:conditions=>['users.is_admin = 1'])

    if params[:send]
        if params[:msg].blank?
          flash[:notice] = "You have to enter message"
        end
        if params[:member_id].nil?
         flash[:notice] = "Please select at least one member"
        end
        if flash[:notice].nil?
          params[:member_id].each do |member_id|
            @member = Member.find(member_id)
            Notifier.deliver_send_contact_us_msg(@member,params[:msg],current_user)
          end
        end
    end
  end
end

