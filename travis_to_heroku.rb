#! /usr/bin/env ruby

require 'heroku-headless'

HerokuHeadless::Deployer.deploy( 'Scrumboat' )
