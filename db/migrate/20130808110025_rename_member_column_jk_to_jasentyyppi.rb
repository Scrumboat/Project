class RenameMemberColumnJkToJasentyyppi < ActiveRecord::Migration
  def change
     rename_column :members, :JK, :jasentyyppi
  end
end
