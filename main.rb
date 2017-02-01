require 'rubygems'
require 'mechanize'
require 'pry'

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

a.get('http://realt.by') do |page|
 # ikit = IMGKit.new(page.body)	
 # file = ikit.to_file('image.png')
  binding.pry
end
