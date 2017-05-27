require "../src/controllers/*"

include Kemalyst::Handler

get "/", home, index

get "/login", session, new
post "/session", session, create
get "/logout", session, delete

resources Post
resources User


