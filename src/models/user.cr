require "kemalyst-model/adapter/mysql"
require "crypto/bcrypt/password"

class User < Kemalyst::Model
  adapter mysql

  # id : Int64 primary key is created for you
  field name : String
  field email : String
  field encrypted_password : String
  timestamps

  def password=(password)
    @encrypted_password = Crypto::Bcrypt::Password.create(password, cost: 10).to_s
  end

  def authenticate(password : String)
    if enc = @encrypted_password
      bcrypt_password = Crypto::Bcrypt::Password.new(enc)
      return bcrypt_password == password
    else
      return false
    end
  end
end
