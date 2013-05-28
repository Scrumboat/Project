require 'test_helper.rb'


# too much copypasta :D refactor them!

class Test_log_utility < ActiveSupport::TestCase

	def initialize x
		super x
		@log = Log_utility.new "testlog.log" 
	end

	test "log_utility.new creates log" do
		assert_not_nil @log
	end

	test "log_utility.member_created" do
		@log.member_created 'creator1', 'member1'
		assert File.exist? "testlog.log"
		lines = IO.readlines("testlog.log")
		found = false
		lines.each do |line|
			if line.include? 'User creator1 created member member1' then
				found = true
				break
			end
		end
		assert found
	end

	test "log_utility.member_modified" do
		@log.member_modified 'modifier', 'member2'
		lines = IO.readlines("testlog.log")
		found = false
		lines.each do |line|
			if line.include? 'User modifier edited member member2' then
				found = true
				break
			end
		end
		assert found
	end

	test "log_utility.member_deleted" do
		@log.member_deleted 'deleter', 'member3'
		lines = IO.readlines("testlog.log")
		found = false
		lines.each do |line|
			if line.include? 'User deleter deleted member member3' then
				found = true
				break
			end
		end
		assert found
	end

	test "log_utility.boat_created" do
		@log.boat_created 'boatcreator', 'boat1'
		lines = IO.readlines("testlog.log")
		found = false
		lines.each do |line|
			if line.include? 'User boatcreator created boat boat1' then
				found = true
				break
			end
		end
		assert found
	end

	test "log_utility.boat_modified" do
		@log.boat_modified 'boatmodifier', 'boat2'
		lines = IO.readlines("testlog.log")
		found = false
		lines.each do |line|
			if line.include? 'User boatmodifier edited boat boat2' then
				found = true
				break
			end
		end
		assert true
	end

	test "log_utility.boat_deleted" do
		@log.boat_deleted 'boatremover', 'boat3'
		lines = IO.readlines("testlog.log")
		found = false
		lines.each do |line|
			if line.include? 'User boatremover deleted boat boat3' then
				found = true
				break
			end
		end
		assert found
	end

	test "random stuff isn't there -> awesomeness" do
		lines = IO.readlines("testlog.log")

		lines.each do |line|
			assert (!line.include? 'this is not in logfile')
		end
	end

	# this isn't a nice way to do this, but couldn't find any finalizer/destructor for ruby classes
	# and begin/ensure didn't work as part of testsuite (ensure got called before tests :/)
	# lets pray to gods that this test get called after all the other tests 
	test "zzzdelete testlog" do
		@log = nil
		#make sure @log is deleted and file isn't locked anymore
		GC.start
		File.delete("testlog.log")
		assert !File.exist?("testlog.log")
	end

end
