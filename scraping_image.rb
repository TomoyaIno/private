 require 'mechanize'
 
 agent = Mechanize.new
 page = agent.get("https://hikyou.jp/report/dayuse/67724/")
 elements = page.search(".size-full.wp-image-67739")
 elements.each do |ele|
  puts ele.get_attribute('src')
 end