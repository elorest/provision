require "./spec_helper"
require "../../src/models/cat.cr"

describe Cat do
  Spec.before_each do
    Cat.clear
  end
end
