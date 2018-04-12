require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rest-client'

doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/9*/'))
doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
  puts node.text
end
