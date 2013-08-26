class FixGuardseason < ActiveRecord::Migration
  def change
    add_column :guardseasons, :guardturn_id, :integer
  end
end
