class AddTunnusToSummary < ActiveRecord::Migration
  def change
    add_column :summaries, :tunnus, :string
  end
end
