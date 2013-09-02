class AddPayingMemberToBoatsMembers < ActiveRecord::Migration
  def change
    add_column :boats_members, :paying_member, :boolean
  end
end
