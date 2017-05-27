require "../models/post"

class PostController < Kemalyst::Controller
  action Index do
    posts = Post.all("ORDER BY created_at DESC")
    html render("post/index.slang", "main.slang")
  end

  action Show do
    if post = Post.find params["id"]
      html render("post/show.slang", "main.slang")
    else
      context.flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect "/posts"
    end
  end

  action New do
    post = Post.new
    html render("post/new.slang", "main.slang")
  end

  action Create do
    post = Post.new(params.to_h.select(["title", "body", "published"]))

    if post.valid? && post.save
      context.flash["success"] = "Created Post successfully."
      redirect "/posts"
    else
      context.flash["danger"] = "Could not create Post!"
      html render("post/new.slang", "main.slang")
    end
  end

  action Edit do
    if post = Post.find params["id"]
      html render("post/edit.slang", "main.slang")
    else
      context.flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect "/posts"
    end
  end

  action Update do
    if post = Post.find(params["id"])
      post.set_attributes(params.to_h.select(["title", "body", "published"]))
      if post.valid? && post.save
        context.flash["success"] = "Updated Post successfully."
        redirect "/posts"
      else
        context.flash["danger"] = "Could not update Post!"
        html render("post/edit.slang", "main.slang")
      end
    else
      context.flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect "/posts"
    end
  end

  action Delete do
    if post = Post.find params["id"]
      post.destroy
    else
      context.flash["warning"] = "Post with ID #{params["id"]} Not Found"
    end
    redirect "/posts"
  end
end
