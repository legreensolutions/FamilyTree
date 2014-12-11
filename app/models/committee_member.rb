class CommitteeMember < ActiveRecord::Base
  belongs_to :member
  belongs_to :post


attr_accessible  :member_id, :post_id, :year, :show_in_contact_us
end

