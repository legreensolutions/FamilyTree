module MembersHelper

  def display_family_tree(member)

    out = "<table>"
    out += "<tr>"
    out += "<td>" + link_to (member.name,member_path(member.id))+ "</td>"
    out += family_structure(member)
    out += "</tr>"
    out += "</table>"
    out
  end


  def family_structure(member)
    father = member.father
    mother = member.mother
    out = "<tr>"
    if father and include_in_origin_family(member.origin_family_id,father.origin_family_id)
      out += "<td>" + link_to (member.father.name ,member_path(member.father.id)) + "</td>"
    end
    if mother and include_in_origin_family(member.origin_family_id,mother.origin_family_id)
      out += "<td>" +  link_to (member.mother.name,member_path(member.mother.id)) + "</td>"
    end
    if father and !include_in_origin_family(member.origin_family_id,father.origin_family_id)
      if mother and include_in_origin_family(member.origin_family_id,mother.origin_family_id)
        out += "<td>" + link_to (member.father.name,member_path(member.father.id)) + "</td>"
      end
    end
    if mother and !include_in_origin_family(member.origin_family_id,mother.origin_family_id)
      if father and  include_in_origin_family(member.origin_family_id,father.origin_family_id)
        out += "<td>" + link_to (member.mother.name,member_path(member.mother.id)) + "</td>"
      end
    end
    out += "</tr>"
    if father
      out += family_structure(father)
    end
    if mother
      out += family_structure(mother)
    end

    out
  end

  def include_in_origin_family(member_origin_family_id,father_origin_family_id)
    if member_origin_family_id == father_origin_family_id
      true
    else
      false
    end
  end
end

