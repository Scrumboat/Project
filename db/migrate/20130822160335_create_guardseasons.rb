class CreateGuardseasons < ActiveRecord::Migration
  def change
    create_table :guardseasons do |t|
      t.string :nimi
      t.integer :guardturn_id
      t.date :alku_pvm
      t.date :loppu_pvm

      t.timestamps
    end
  end
end
