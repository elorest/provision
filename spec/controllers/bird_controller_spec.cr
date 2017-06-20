require "./spec_helper"

def create_subject
  subject = Bird.new
  subject.name = "test"
  subject.save
  subject
end

describe BirdController do
  Spec.before_each do
    Bird.clear
  end

  describe BirdController::Index do
    it "renders all the birds" do
      subject = create_subject
      get "/birds"
      response.body.should contain "test"
    end
  end

  describe BirdController::Show do
    it "renders a single bird" do
      subject = create_subject
      get "/birds/#{subject.id}"
      response.body.should contain "test"
    end
  end

  describe BirdController::New do
    it "render new template" do
      get "/birds/new"
      response.body.should contain "New Bird"
    end
  end

  describe BirdController::Create do
    it "creates a bird" do
      post "/birds", body: "name=testing"
      subject_list = Bird.all
      subject_list.size.should eq 1
    end
  end

  describe BirdController::Edit do
    it "renders edit template" do
      subject = create_subject
      get "/birds/#{subject.id}/edit"
      response.body.should contain "Edit Bird"
    end
  end

  describe BirdController::Update do
    it "updates a bird" do
      subject = create_subject
      patch "/birds/#{subject.id}", body: "name=test2"
      result = Bird.find(subject.id).not_nil!
      result.name.should eq "test2"
    end
  end

  describe BirdController::Delete do
    it "deletes a bird" do
      subject = create_subject
      delete "/birds/#{subject.id}"
      result = Bird.find subject.id
      result.should eq nil
    end
  end
end
