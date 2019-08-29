require 'mechanize'

agent = Mechanize.new
page = agent.get("https://hikyou.jp")
elements = page.search(".wrap.blm h1")
elements.each do |ele|
  puts ele.inner_text
end