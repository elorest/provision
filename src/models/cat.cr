require "granite_orm/adapter/pg"

class Cat < Granite::ORM 
  adapter pg

  # id : Int64 primary key is created for you
  field name : String
  field age : Int32
  timestamps
end
