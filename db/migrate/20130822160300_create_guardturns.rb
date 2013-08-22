class CreateGuardturns < ActiveRecord::Migration
  def change
    create_table :guardturns do |t|
      t.date :vartiointi_pvm
      t.integer :jno

      t.timestamps
    end
  end
end
