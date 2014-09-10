require 'spec_helper'

describe Move do
  describe ".new" do
    subject { Move.new('rock') }
    it { expect(subject.title).to eql('rock') }
  end

  describe "<=>" do
    let(:move) { Move.new('lizard') }
    subject { move <=> other}
    context "when == other" do
      let(:other) { Move.new('lizard') }
      it { expect(subject).to eql(0) }
    end
    context "when > other" do
      let(:other) { Move.new('spock') }
      it { expect(subject).to eql(1) }
    end
    context "when < other" do
      let(:other) { Move.new('rock') }
      it { expect(subject).to eql(-1) }
    end
  end

  describe "index" do
    let(:move) { Move.new('lizard') }
    subject { move.index }
    it { expect(subject).to eql(3) }
  end
end
