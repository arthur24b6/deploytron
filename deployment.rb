require 'bundler/setup'
require 'dream_cheeky'

command = "sh #{File.expand_path File.dirname(__FILE__)}/deployment-script.sh"

DreamCheeky::BigRedButton.run do
  open do
    `#{command} open`
  end

  close do
    `#{command} close`
  end

  push do
    `#{command} push`
  end
end
