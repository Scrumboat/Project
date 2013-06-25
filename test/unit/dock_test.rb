#encoding: utf-8

require 'test_helper'

class DockTest < ActiveSupport::TestCase

	test "Dock is not created if length is not given" do
		dock = Dock.new
		assert !dock.save, "Length must be given"
	end

	test "If there is no Berths in the dock space left should be same as the length" do
		dock = Dock.new
		dock.length = 20
		dock.save
		puts dock.spaceLeft
		assert dock.length == dock.spaceLeft, "Space is same as full length"
		assert dock.currentWidthUsed == 0, "Space used is 0 m"
	end

	test "If Dock's length is 20 m and there is a Berth with width of 5 m" do 
		dock = Dock.new
		dock.length = 20
		dock.save

		dock.berths << berths(:berth_1)

		assert dock.spaceLeft == 15, "Space left is 15 m"
		assert dock.hasSpaceForNewWidth(20, berths(:berth_1) ), "There is a 20 m space for Berth's new width"
		assert dock.currentWidthUsed == 5, "Space used is 5 m"
	end

	test "If Dock's length is 10 m and there is 2 Berths with width of 5 m" do 
		dock = Dock.new
		dock.length = 10
		dock.save

		dock.berths << berths(:berth_1)
		dock.berths << berths(:berth_2)

		assert dock.spaceLeft == 0, "Space left is 0 m"
		assert !dock.hasSpaceForNewWidth(6, berths(:berth_1) ), "there is no more space for berth_1's new width"
		assert !dock.hasSpaceForNewWidth(6, berths(:berth_2) ), "there is no more space for berth_2's new width"
		assert dock.currentWidthUsed == dock.length, "Space used is same as Dock's length"
	end

	test "If Dock's length is 10 m and there is one Berth with width of 10 m then there is no space" do 
		dock = Dock.new
		dock.length = 10
		dock.save

		dock.berths << berths(:berth_3)
		assert dock.spaceLeft == 0, "Space left is 0"
	end


end