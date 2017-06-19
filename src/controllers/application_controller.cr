class ApplicationController < Amber::Controller::Base
  LAYOUT = "application.slang"

  def index
    render("index.slang")
  end
end

