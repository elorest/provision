require "./spec_helper"

def create_subject
  subject = Dog.new
  subject.name = "test"
  subject.save
  subject
end

describe DogController do
  Spec.before_each do
    Dog.clear
  end

  describe DogController::Index do
    it "renders all the dogs" do
      subject = create_subject
      get "/dogs"
      response.body.should contain "test"
    end
  end

  describe DogController::Show do
    it "renders a single dog" do
      subject = create_subject
      get "/dogs/#{subject.id}"
      response.body.should contain "test"
    end
  end

  describe DogController::New do
    it "render new template" do
      get "/dogs/new"
      response.body.should contain "New Dog"
    end
  end

  describe DogController::Create do
    it "creates a dog" do
      post "/dogs", body: "name=testing"
      subject_list = Dog.all
      subject_list.size.should eq 1
    end
  end

  describe DogController::Edit do
    it "renders edit template" do
      subject = create_subject
      get "/dogs/#{subject.id}/edit"
      response.body.should contain "Edit Dog"
    end
  end

  describe DogController::Update do
    it "updates a dog" do
      subject = create_subject
      patch "/dogs/#{subject.id}", body: "name=test2"
      result = Dog.find(subject.id).not_nil!
      result.name.should eq "test2"
    end
  end

  describe DogController::Delete do
    it "deletes a dog" do
      subject = create_subject
      delete "/dogs/#{subject.id}"
      result = Dog.find subject.id
      result.should eq nil
    end
  end
end
