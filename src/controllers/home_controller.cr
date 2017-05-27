require "../models/post"

class HomeController < Kemalyst::Controller
  action Index do
    posts = Post.all("WHERE posts.published = true
                      ORDER BY created_at DESC")
    html render("home/index.slang", "main.slang")
  end
end
