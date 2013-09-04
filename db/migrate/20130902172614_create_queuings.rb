class CreateQueuings < ActiveRecord::Migration
  def change
    create_table :queuings do |t|
      t.string :tyyppi
      t.integer :jno
      t.date :pvm

      t.timestamps
    end
  end
end
