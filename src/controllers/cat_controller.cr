class CatController < ApplicationController 
  def index
    cats = Cat.all
    render("index.slang")
  end

  def show
    if cat = Cat.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Cat with ID #{params["id"]} Not Found"
      redirect_to "/cats"
    end
  end

  def new
    cat = Cat.new
    render("new.slang")
  end

  def create
  cat = Cat.new(params.to_h.select(["name", "age"]))

    if cat.valid? && cat.save
      flash["success"] = "Created Cat successfully."
      redirect_to "/cats"
    else
      flash["danger"] = "Could not create Cat!"
      render("new.slang")
    end
  end

  def edit
    if cat = Cat.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Cat with ID #{params["id"]} Not Found"
      redirect_to "/cats"
    end
  end

  def update
    if cat = Cat.find(params["id"])
      cat.set_attributes(params.to_h.select(["name", "age"]))
      if cat.valid? && cat.save
        flash["success"] = "Updated Cat successfully."
        redirect_to "/cats"
      else
        flash["danger"] = "Could not update Cat!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Cat with ID #{params["id"]} Not Found"
      redirect_to "/cats"
    end
  end

  def destroy
    if cat = Cat.find params["id"]
      cat.destroy
    else
      flash["warning"] = "Cat with ID #{params["id"]} Not Found"
    end
    redirect_to "/cats"
  end
end
