- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- if context.current_user
  a class="nav-item pull-right" href="/logout" Logout
  - active = context.request.path == "/posts" ? "active" : ""
  a class="nav-item #{active}" href="/posts" Posts
  - active = context.request.path == "/users" ? "active" : ""
  a class="nav-item #{active}" href="/users" Users
- else
  - active = context.request.path == "/login" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/login" Login
