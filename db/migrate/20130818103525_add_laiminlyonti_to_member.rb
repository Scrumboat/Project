class AddLaiminlyontiToMember < ActiveRecord::Migration
  def change
    add_column :members, :vartiolaiminlyonti, :int, default: 0
	add_column :members, :talkoolaiminlyonti, :int, default: 0
	add_column :members, :saunottu, :int, default: 0
  end
end
