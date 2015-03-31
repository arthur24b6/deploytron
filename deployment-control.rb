require 'daemons'
require 'bundler/setup'
require 'dream_cheeky'

Daemons.run('deployment.rb')
