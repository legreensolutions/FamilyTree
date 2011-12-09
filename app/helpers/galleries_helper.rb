module GalleriesHelper

  def tag_list(galleries)
    @tag_list = ""
    galleries.each do |tag|
      @tag_list =  @tag_list + link_to(tag.tags,:controller=>'galleries',:action=>'index',:tag_id=>tag.tags) + ", "
    end
    @tag_list = @tag_list.chop![0..-2] if @tag_list

  end

end

