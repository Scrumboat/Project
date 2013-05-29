class CreateBoatsMembers < ActiveRecord::Migration
  def change
    create_table :boats_members do |t|
      t.integer :boat_id
      t.integer :member_id

      t.timestamps
    end
  end
end
