class ContactUsController < ApplicationController

  def contact_us

     @committee_members = Member.find(:all,:include=>'posts',:conditions=>['committee_members.post_id != ? AND year = ? AND show_in_contact_us = ? ',"",Date.today.year,true],:order=>'posts.level')
  @admin = Member.find(:first,:include=>'user',:conditions=>['users.is_admin = ?',ADMIN])

    if params[:send]
        flash[:notice] = ""
        if params[:msg].blank?
          flash[:notice] += 'You have to enter message <br />'
        end
        if params[:member_id].nil?
         flash[:notice] += "Please select at least one member" + '<br />'
        end
        if params[:email].blank?
         flash[:notice] += "Please enter Email" + '<br />'
        end
        if !simple_captcha_valid?
          flash[:notice] += 'Captcha is not valid <br />'
        end
        if flash[:notice].blank?
            params[:member_id].each do |member_id|
            @member = Member.find(member_id)
            Notifier.deliver_send_contact_us_msg(@member,params[:msg],params[:email])
            flash[:notice] = 'Message send to selected members successfully'
            redirect_to "/"
          end
        end
    end

  end
end

