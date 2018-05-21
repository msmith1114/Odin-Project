require 'rest-client'
arg = ARGV.join("+")
puts arg
response = RestClient.get 'https://www.bing.com/search?q=arg'

puts response.code
puts response.cookies
puts response.headers
puts response.body
