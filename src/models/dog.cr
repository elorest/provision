require "granite_orm/adapter/pg"

class Dog < Granite::ORM 
  adapter pg

  # id : Int64 primary key is created for you
  field name : String
  field color : String
  timestamps
end
