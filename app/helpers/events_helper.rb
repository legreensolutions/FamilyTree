module EventsHelper
  def event_tag_list(galleries)
    @tag_list = ""
    prev_tag = ""
    galleries.each do |gallery|
      unless gallery.tags.blank?
        if prev_tag.to_s != gallery.tags.to_s
          #@tag_list =  @tag_list + link_to(gallery.tags,:controller=>'events',:action=>'index',:tag_id=>gallery.tags) + ", "
          @tag_list =  @tag_list + link_to(gallery.tags,:controller=>'events',:action=>'index',:tag_id=>gallery.tags) + "  "
        end
        prev_tag = gallery.tags
      end
    end

    @tag_list = @tag_list.chop![0..-2] if !@tag_list.empty?
  end
end

