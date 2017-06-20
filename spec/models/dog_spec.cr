require "./spec_helper"
require "../../src/models/dog.cr"

describe Dog do
  Spec.before_each do
    Dog.clear
  end
end
