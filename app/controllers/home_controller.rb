class HomeController < ApplicationController
  def index
    @content_management = ContentManagement.find(:first,:conditions=>['UPPER(page) = ? AND UPPER(identification) = ?','HOME','DESCRIPTION'])
    @news = NewsItem.find(:first,:conditions=>['display_on_home_page = ? AND obsolete = ?',true,false],:order=>'id desc')
  end

  def detailed_content
    @content_management = ContentManagement.find(:first,:conditions=>['UPPER(page) = ? AND UPPER(identification) = ?','HOME','DESCRIPTION'])
  end


  def contact_us
    @content_management = ContentManagement.find(:first,:conditions=>['UPPER(page) = ? AND upper(identification) = ?','CONTACT US','DESCRIPTION'])
  end

  def guidelines
    @content_management = ContentManagement.find(:first,:conditions=>['UPPER(page) = ? AND upper(identification) = ?','GUIDELINES','DESCRIPTION'])

  end



end

