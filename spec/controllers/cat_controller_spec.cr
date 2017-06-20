require "./spec_helper"

def create_subject
  subject = Cat.new
  subject.name = "test"
  subject.save
  subject
end

describe CatController do
  Spec.before_each do
    Cat.clear
  end

  describe CatController::Index do
    it "renders all the cats" do
      subject = create_subject
      get "/cats"
      response.body.should contain "test"
    end
  end

  describe CatController::Show do
    it "renders a single cat" do
      subject = create_subject
      get "/cats/#{subject.id}"
      response.body.should contain "test"
    end
  end

  describe CatController::New do
    it "render new template" do
      get "/cats/new"
      response.body.should contain "New Cat"
    end
  end

  describe CatController::Create do
    it "creates a cat" do
      post "/cats", body: "name=testing"
      subject_list = Cat.all
      subject_list.size.should eq 1
    end
  end

  describe CatController::Edit do
    it "renders edit template" do
      subject = create_subject
      get "/cats/#{subject.id}/edit"
      response.body.should contain "Edit Cat"
    end
  end

  describe CatController::Update do
    it "updates a cat" do
      subject = create_subject
      patch "/cats/#{subject.id}", body: "name=test2"
      result = Cat.find(subject.id).not_nil!
      result.name.should eq "test2"
    end
  end

  describe CatController::Delete do
    it "deletes a cat" do
      subject = create_subject
      delete "/cats/#{subject.id}"
      result = Cat.find subject.id
      result.should eq nil
    end
  end
end
