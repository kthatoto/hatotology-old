post_id = ARGV[0]
(puts '[error] post id required'; exit) unless post_id
content = File.read("./posts/#{post_id.rjust(3, '0')}/content.md")
require 'yaml'
meta = YAML.load_file("./posts/#{post_id.rjust(3, '0')}/meta.yml")
title = meta["title"]

require 'net/http'
require 'uri'

url = URI.parse('http://0.0.0.0:3000/api/posts')
request = Net::HTTP::Post.new(url.path)
request.set_form_data({
  id: post_id,
  content: content,
  title: title,
})
response = Net::HTTP.new(url.host, url.port).start do |http|
  http.request(request)
end

puts response.code
puts response.body
