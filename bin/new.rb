post_ids = `ls ./posts`.split("\n").map(&:to_i)
post_id = (post_ids.empty? ? 1 : post_ids.max + 1).to_s.rjust(3, '0')
`mkdir ./posts/#{post_id}`
`cd ./posts/#{post_id} && git init && touch content.md meta.yml && git add -A && git commit -m 'Initialized'`
puts "created ##{post_id}"
