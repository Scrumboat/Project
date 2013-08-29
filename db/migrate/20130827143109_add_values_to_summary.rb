class AddValuesToSummary < ActiveRecord::Migration
  def change
    add_column :summaries, :saatavat, :decimal
	add_column :summaries, :maksetut, :decimal
  end
end
