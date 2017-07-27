require "../models/user"

class UserController < Kemalyst::Controller
  def index
    users = User.all
    html render("user/index.slang", "main.slang")
  end

  def show
    if user = User.find params["id"]
      html render("user/show.slang", "main.slang")
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect "/users"
    end
  end

  def new
    user = User.new
    html render("user/new.slang", "main.slang")
  end

  def create
    user = User.new(params.to_h.select(["name", "email"]))
    user.password = params["password"]

    if user.valid? && user.save
      flash["success"] = "Created User successfully."
      redirect "/users"
    else
      flash["danger"] = "Could not create User!"
      html render("user/new.slang", "main.slang")
    end
  end

  def edit
    if user = User.find params["id"]
      html render("user/edit.slang", "main.slang")
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect "/users"
    end
  end

  def update
    if user = User.find(params["id"])
      user.set_attributes(params.to_h.select(["name", "email"]))
      user.password = params["password"]
      if user.valid? && user.save
        flash["success"] = "Updated User successfully."
        redirect "/users"
      else
        flash["danger"] = "Could not update User!"
        html render("user/edit.slang", "main.slang")
      end
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect "/users"
    end
  end

  def delete
    if user = User.find params["id"]
      user.destroy
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
    end
    redirect "/users"
  end
end
