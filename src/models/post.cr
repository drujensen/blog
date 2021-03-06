require "kemalyst-model/adapter/mysql"

class Post < Kemalyst::Model
  adapter mysql

  # id : Int64 primary key is created for you
  field title : String
  field body : String
  field published : Bool
  timestamps
end
