#encoding: utf-8

require 'test_helper'

class BerthTest < ActiveSupport::TestCase

	test "Berth is not created if number is not given" do
		berth = Berth.new
		berth.length = 5
		berth.width = 3
		berth.depth = 1.6
		berth.dock_id = 1
		berth.exists = true
		assert !berth.save, "Berth not saved without a number."
	end

	test "Berth is not created if width is not given" do
		berth = Berth.new
		berth.number = 2
		berth.length = 3
		berth.depth = 1.6
		berth.dock_id = 1
		berth.exists = true
		assert !berth.save, "Berth not saved without a width."
	end

	test "Berth is not created if length is not given" do
		berth = Berth.new
		berth.number = 2
		berth.width = 3
		berth.depth = 1.6
		berth.dock_id = 1
		berth.exists = true
		assert !berth.save, "Berth not saved without a length."
	end

	test "Berth is not created if depth is not given" do
		berth = Berth.new
		berth.number = 2
		berth.width = 3
		berth.length = 5
		berth.dock_id = 1
		berth.exists = true
		assert !berth.save, "Berth not saved without a depth."
	end

	test "Berth.exists is false by default if exists is not set true" do
		berth = Berth.new
		berth.number = 2
		berth.width = 3
		berth.length = 5
		berth.depth = 1.6
		berth.dock_id = 1
		berth.save
		assert !berth.exists, "Exists is false by default"
	end

	test "Berth.exists is true if set so" do
		berth = Berth.new
		berth.number = 2
		berth.width = 3
		berth.length = 5
		berth.depth = 1.6
		berth.exists = true
		berth.dock_id = 1
		berth.save
		assert berth.exists, "Exists is true if set so"
	end

	test "Berth is not created if number is not integer" do
		berth = Berth.new
		berth.number = 2.5
		berth.width = 3
		berth.length = 5
		berth.depth = 1.6
		berth.exists = true
		berth.dock_id = 1
		assert !berth.save, "Number must be a integer"
	end

	test "Berth is not created if some berth with a given number already is saved to database" do
		berth1 = Berth.new
		berth1.number = 2
		berth1.width = 3
		berth1.length = 5
		berth1.depth = 1.6
		berth1.exists = true
		berth1.dock_id = 1
		berth1.save

		berth2 = Berth.new
		berth2.number = 2
		berth2.width = 3
		berth2.length = 5
		berth2.depth = 1.6
		berth2.exists = true
		berth2.dock_id = 1
		assert !berth2.save, "Number must be unique"
	end

	test "Berth is not created if there is no Dock where to put it" do 
		berth = Berth.new
		berth.number = 2.5
		berth.width = 3
		berth.length = 5
		berth.depth = 1.6
		berth.exists = true
		assert !berth.save, "There must be a Dock"
	end
end