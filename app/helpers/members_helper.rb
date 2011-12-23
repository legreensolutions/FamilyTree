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
    end

    if (mother and include_in_origin_family(member.origin_family_id,mother.origin_family_id) )
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
  if (father and father.father  and include_in_origin_family(father.father.origin_family_id,father.origin_family_id))
     family_structure(father,index,tmp)
    end
    if (mother and mother.mother and include_in_origin_family( mother.mother.origin_family_id,mother.origin_family_id))
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
end

