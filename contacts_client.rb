require 'http'

response = HTTP.get("http://localhost:3000/api/first_contact_url")

p response.parse