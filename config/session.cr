Kemalyst::Handler::Session.config do |config|
  # The cookie name to hold the session data
  config.key = "_blog.session"
  
  # The secret is used to avoid the session data being changed.  The session
  # data is stored in a cookie.  To avoid changes being made, a security token
  # is generated using this secret.  To generate a secret, you can use the
  # following command:
  # crystal eval "require \"secure_random\"; puts SecureRandom.hex(64)"
  #
  config.secret = "f49068c59f01cee8ff61d97627f2e24dae93b01dc57f50510417febd15206057531544eb6aaa6c21bd0a504009970fc69b44508017b83f095a30fd983a37d468"
end
