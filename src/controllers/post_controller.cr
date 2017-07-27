require "../models/post"

class PostController < Kemalyst::Controller
  def index
    posts = Post.all("ORDER BY created_at DESC")
    html render("post/index.slang", "main.slang")
  end

  def show
    if post = Post.find params["id"]
      html render("post/show.slang", "main.slang")
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect "/posts"
    end
  end

  def new
    post = Post.new
    html render("post/new.slang", "main.slang")
  end

  def create
    post = Post.new(params.to_h.select(["title", "body", "published"]))

    if post.valid? && post.save
      flash["success"] = "Created Post successfully."
      redirect "/posts"
    else
      flash["danger"] = "Could not create Post!"
      html render("post/new.slang", "main.slang")
    end
  end

  def edit
    if post = Post.find params["id"]
      html render("post/edit.slang", "main.slang")
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect "/posts"
    end
  end

  def update
    if post = Post.find(params["id"])
      post.set_attributes(params.to_h.select(["title", "body", "published"]))
      if post.valid? && post.save
        flash["success"] = "Updated Post successfully."
        redirect "/posts"
      else
        flash["danger"] = "Could not update Post!"
        html render("post/edit.slang", "main.slang")
      end
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect "/posts"
    end
  end

  def delete
    if post = Post.find params["id"]
      post.destroy
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
    end
    redirect "/posts"
  end
end
