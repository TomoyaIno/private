 require 'mechanize'
 
 def scraping_image(link)
  agent = Mechanize.new
  page = agent.get(link)
  image_url = page.at('.size-full.wp-image-67739').get_attribute('src')
  return image_url
 end
 
 links = []
 agent = Mechanize.new
 current_page = agent.get("https://hikyou.jp")
 elements = current_page.search('.wrap.blm h1')
 elements.each do |ele|
  links << ele.get_attribute('href')
 end
 
 links.each do |link|
  puts scraping_image('https://hikyou.jp' + link)
end
