class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|

      t.timestamps
    end
  end
end
