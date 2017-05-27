class HTTP::Server::Context
  property current_user : User?
end

class SessionController < Kemalyst::Controller
  action Authenticate do

    user_id = context.session["user_id"]?
    if user = User.find(user_id.to_s)
      context.current_user = user
      call_next(context)
    else
      return call_next(context) if ["/","/login","/session"].includes?(context.request.path)
      context.flash["warning"] = "Please login"
      redirect "/login"
    end
  end

  action New do
    html render("session/new.slang", "main.slang")
  end

  action Create do
    email = context.params["email"]
    password = context.params["password"]
    user = User.find_by :email,  email
    if user && user.authenticate(password)
        context.session["user_id"] = user.id.to_s
        context.flash["info"] = "Successfully logged in"
        redirect "/"
      else
        context.flash["danger"] = "Invalid email or password"
        html render("session/new.slang", "main.slang")
      end
  end

  action Delete do
    context.clear_session
    context.flash["info"] = "Logged out.  See ya later!"
    redirect "/"
  end
end
