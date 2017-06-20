class DogController < ApplicationController 
  def index
    dogs = Dog.all
    render("index.slang")
  end

  def show
    if dog = Dog.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Dog with ID #{params["id"]} Not Found"
      redirect_to "/dogs"
    end
  end

  def new
    dog = Dog.new
    render("new.slang")
  end

  def create
  dog = Dog.new(params.to_h.select(["name", "color"]))

    if dog.valid? && dog.save
      flash["success"] = "Created Dog successfully."
      redirect_to "/dogs"
    else
      flash["danger"] = "Could not create Dog!"
      render("new.slang")
    end
  end

  def edit
    if dog = Dog.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Dog with ID #{params["id"]} Not Found"
      redirect_to "/dogs"
    end
  end

  def update
    if dog = Dog.find(params["id"])
      dog.set_attributes(params.to_h.select(["name", "color"]))
      if dog.valid? && dog.save
        flash["success"] = "Updated Dog successfully."
        redirect_to "/dogs"
      else
        flash["danger"] = "Could not update Dog!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Dog with ID #{params["id"]} Not Found"
      redirect_to "/dogs"
    end
  end

  def destroy
    if dog = Dog.find params["id"]
      dog.destroy
    else
      flash["warning"] = "Dog with ID #{params["id"]} Not Found"
    end
    redirect_to "/dogs"
  end
end
