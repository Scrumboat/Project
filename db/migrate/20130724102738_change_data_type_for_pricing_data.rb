class ChangeDataTypeForPricingData < ActiveRecord::Migration
  def change
    change_column :pricings, :data, :decimal
  end

end
