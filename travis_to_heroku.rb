#! /usr/bin/env ruby

require 'heroku-headless'

HerokuHeadless.configure do |conf|
  conf.mock_mode = false
end
HerokuHeadless::Deployer.deploy( 'scrumboat' )
