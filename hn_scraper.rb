require 'nokogiri'
require 'open-uri'

@url = ARGV[0]

html_file = open(@url)

doc = Nokogiri::HTML(html_file)
