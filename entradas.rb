require 'net/http'
require 'json'

url = 'http://publico1.alternativateatral.com/api/formulario-localidades.asp?callback=jQuery3110942112396885171_1555333461496&id=64395&o=14&m=&c=&_=1555333461497"offers?radius=10&postal_code=30305'
uri = URI(url)
response = Net::HTTP.get(uri)
JSON.parse(response)