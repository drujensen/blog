require "kemalyst"
require "../config/*"

user = User.new
user.name = "Admin"
user.email = "admin@example.com"
user.password = "password"
user.save
