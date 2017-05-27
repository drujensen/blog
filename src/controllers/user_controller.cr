require "../models/user"

class UserController < Kemalyst::Controller
  action Index do
    users = User.all
    html render("user/index.slang", "main.slang")
  end

  action Show do
    if user = User.find params["id"]
      html render("user/show.slang", "main.slang")
    else
      context.flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect "/users"
    end
  end

  action New do
    user = User.new
    html render("user/new.slang", "main.slang")
  end

  action Create do
    user = User.new(params.to_h.select(["name", "email"]))
    user.password = params["password"]

    if user.valid? && user.save
      context.flash["success"] = "Created User successfully."
      redirect "/users"
    else
      context.flash["danger"] = "Could not create User!"
      html render("user/new.slang", "main.slang")
    end
  end

  action Edit do
    if user = User.find params["id"]
      html render("user/edit.slang", "main.slang")
    else
      context.flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect "/users"
    end
  end

  action Update do
    if user = User.find(params["id"])
      user.set_attributes(params.to_h.select(["name", "email"]))
      user.password = params["password"]
      if user.valid? && user.save
        context.flash["success"] = "Updated User successfully."
        redirect "/users"
      else
        context.flash["danger"] = "Could not update User!"
        html render("user/edit.slang", "main.slang")
      end
    else
      context.flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect "/users"
    end
  end

  action delete do
    if user = User.find params["id"]
      user.destroy
    else
      context.flash["warning"] = "User with ID #{params["id"]} Not Found"
    end
    redirect "/users"
  end
end
