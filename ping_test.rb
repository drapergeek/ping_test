#!/usr/bin/ruby
require "rubygems"
require 'net/ping'

tcp = Net::Ping::ICMP.new
#Read in the ips
IP_LIST = "ips.txt"
ips = Array.new
File.open(IP_LIST, "r") do |infile|
  while (line = infile.gets)
    unless line.index('#') == 0
    puts "Adding ip #{line}"
    ips << line.chomp
  end
  end
end


ips.each do |ip|
   if tcp.ping?(ip)
     ips.delete(ip)
     puts "Remove #{ip} from list because it was found"
   end
end



File.open(IP_LIST, 'w') do |outfile|  
  ips.each do |ip|
    puts ip
    outfile.puts ip
  end
end




