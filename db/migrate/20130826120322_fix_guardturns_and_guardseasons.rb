class FixGuardturnsAndGuardseasons < ActiveRecord::Migration
  def change
    remove_column :guardseasons, :guardturn_id
    add_column :guardturns, :guardseason_id, :integer
  end
end
