class AddMemberidToOwnership < ActiveRecord::Migration
  def change
    add_column :ownerships, :member_id, :integer
  end
end
