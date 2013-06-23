class AddJnoToBerths < ActiveRecord::Migration
  def change
    add_column :berths, :jno, :integer
  end
end
