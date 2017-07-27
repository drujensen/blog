require "../models/post"
require "markdown"

class HomeController < Kemalyst::Controller
  def index
    posts = Post.all("WHERE posts.published = true
                      ORDER BY created_at DESC")
    html render("home/index.slang", "main.slang")
  end
end
