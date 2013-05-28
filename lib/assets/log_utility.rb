

# Is logging to file enough or do we need database for that? 

class Log_utility
	def initialize (out = "log/userlog.log")
		@log = Logger.new(out, 'daily')
	end


	def member_deleted (userid, member)
		@log.add(Logger::INFO, "User #{userid} deleted member #{member}")
	end

	def member_modified (userid, member)
		@log.add(Logger::INFO, "User #{userid} edited member #{member}")
	end

	def member_created (userid, member)
		@log.add(Logger::INFO, "User #{userid} created member #{member}")
	end

	def boat_deleted (userid, boat)
		@log.add(Logger::INFO, "User #{userid} deleted boat #{boat}")
	end

	def boat_created (userid, boat)
		@log.add(Logger::INFO, "User #{userid} created boat #{boat}")
	end

	def boat_modified (userid, boat)
		@log.add(Logger::INFO, "User #{userid} edited boat #{boat}")
	end

end
