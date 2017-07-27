require "../src/controllers/*"

include Kemalyst::Handler

get "/", HomeController, :index

get "/login", SessionController, :new
post "/session", SessionController, :create
get "/logout", SessionController, :delete

resources Post
resources User


