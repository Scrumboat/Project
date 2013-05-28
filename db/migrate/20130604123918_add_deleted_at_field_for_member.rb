class AddDeletedAtFieldForMember < ActiveRecord::Migration
  def up
    add_column :members, :deleted_at, :date, :default => :null
  end

  def down
  end
end
