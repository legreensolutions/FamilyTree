class HomeController < ApplicationController
  def index
    @content_management = ContentManagement.find(:first,:conditions=>['UPPER(page) = ?','HOME'])
  end

  def detailed_content
     @content_management = ContentManagement.find(:first,:conditions=>['UPPER(page) = ?','HOME'])
  end

end

