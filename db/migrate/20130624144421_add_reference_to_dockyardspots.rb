class AddReferenceToDockyardspots < ActiveRecord::Migration
  def change
    add_column :dockyard_spots, :dockyard_id, :integer
  end
end
