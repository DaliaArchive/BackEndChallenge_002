require 'spec_helper'

describe Game do
  describe "factory" do
    subject { FactoryGirl.build(:game) }
    it { expect(subject).to be_valid }
  end
  describe ".search"
  describe "Validations"
end
