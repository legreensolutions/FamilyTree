module GalleriesHelper

  def tag_list(galleries)
    @tag_list = ""
    galleries.each do |gallery|
        @tag_list =  @tag_list + link_to(gallery.tags,:controller=>'galleries',:action=>'index',:tag_id=>gallery.tags) + ", "
      end
    @tag_list = @tag_list.chop![0..-2]
  end

end

