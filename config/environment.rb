# Load the rails application
require File.expand_path('../application', __FILE__)
require Rails.root.join('lib', 'assets') + 'log_utility.rb'

$loggeri = Log_utility.new

# Initialize the rails application
Venerekisteri::Application.initialize!
