class SessionController < Kemalyst::Controller
  def new
    html render("session/new.slang", "main.slang")
  end

  def create
    email = params["email"]
    password = params["password"]
    user = User.find_by :email,  email
    if user && user.authenticate(password)
        session["user_id"] = user.id.to_s
        flash["info"] = "Successfully logged in"
        redirect "/"
      else
        flash["danger"] = "Invalid email or password"
        html render("session/new.slang", "main.slang")
      end
  end

  def delete
    context.clear_session
    flash["info"] = "Logged out.  See ya later!"
    redirect "/"
  end
end
