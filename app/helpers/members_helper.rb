module MembersHelper

  def display_family_tree(member)

    tmp = [[]]
    index = 0
    tmp[index][0] = member
    index = index + 1
    family_structure(member,index,tmp)
    tmp

  end


  def family_structure(member,index,tmp)
    father = member.father
    mother = member.mother

    if father and include_in_origin_family(member.origin_family_id,father.origin_family_id)
      tmp << [[]]
      tmp[index][0] = member.father
    #end

    elsif (mother and include_in_origin_family(member.origin_family_id,mother.origin_family_id) )

      tmp << [[]]
      tmp[index][0] = member.mother
    end

    if father and !include_in_origin_family(member.origin_family_id,father.origin_family_id)
      if mother and include_in_origin_family(member.origin_family_id,mother.origin_family_id)
          tmp[index][1] = member.father

      end
    end
    if mother and !include_in_origin_family(member.origin_family_id,mother.origin_family_id)
      if father and  include_in_origin_family(member.origin_family_id,father.origin_family_id)
        tmp[index][1] = member.mother
      end
    end
    index = index + 1

     if (father and include_in_origin_family(member.origin_family_id,father.origin_family_id) and father.father  and include_in_origin_family(father.father.origin_family_id,father.origin_family_id))
     family_structure(father,index,tmp)
    end
    if (mother and include_in_origin_family(member.origin_family_id,mother.origin_family_id) and  mother.mother and include_in_origin_family( mother.mother.origin_family_id,mother.origin_family_id))
       family_structure(mother,index,tmp)
    end
  tmp
end

  def include_in_origin_family(member_origin_family_id,father_origin_family_id)
    if member_origin_family_id == father_origin_family_id

      true
    else

      false
    end
  end

  def display_photo_of_member(member,title="",height="30px;")
    unless member.nil?
      if member.has_photo?
        content_tag(:div,link_to (image_tag(member.photo(:small), :height=>height,:title=>title), member_path(member.id)))
      else
        content_tag(:div,link_to (image_tag('default_big.jpg', :height=>height,:title=>title) , member_path(member.id)))
      end
    end
  end
end

