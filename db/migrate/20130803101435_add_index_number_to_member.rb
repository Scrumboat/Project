class AddIndexNumberToMember < ActiveRecord::Migration
  def change
    add_column :members, :viitenumero, :string
  end
end
