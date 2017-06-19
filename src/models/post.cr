require "granite_orm/adapter/pg"

class Post < Granite::ORM 
  adapter pg

  # id : Int64 primary key is created for you
  field title : String
  field content : String
  timestamps
end
