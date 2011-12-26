module NewsItemsHelper
  def news_items_tag_list(galleries)
    @tag_list = ""

    galleries.each do |gallery|
      unless gallery.tags.blank?
        @tag_list =  @tag_list + link_to(gallery.tags,:controller=>'news_items',:action=>'index',:tag_id=>gallery.tags) + ", "
      end
      end

    @tag_list = @tag_list.chop![0..-2] if !@tag_list.empty?
  end
end
