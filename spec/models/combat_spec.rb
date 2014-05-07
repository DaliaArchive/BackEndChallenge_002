require 'spec_helper'

describe Combat do
  let(:uuid) { 'sdfasdfasdfasdfasdfasdf'}
  describe ".new" do
    let(:game) { Game.new }
    let(:moves) { double(:moves) }
    subject { Combat.new(game, uuid, moves) }
    it do
      expect(game).to receive(:adversary_uuid=).with(uuid).once
      expect(game).to receive(:adversary_moves=).with(moves).once
      expect(subject.game).to eql(game)
    end
  end

  describe "#start!" do
    let(:other_uuid) { 'asdfasdfasgggasdf' }
    let(:moves) { ['a']*10 }
    let(:other_moves) { ['b']*10 }
    let(:game) { Game.new(uuid: uuid, moves: moves) }
    let(:combat) { Combat.new(game, other_uuid, other_moves) }

    subject { combat.start! }
    before do
      allow_any_instance_of(Move).to receive(:<=>){ 0 }
      expect(game).to receive(:state=).with(:finished).once
      expect(game).to receive(:owner_result=).with([false]*10).once
      expect(game).to receive(:adversary_result=).with([false]*10).once
    end
    it do
      expect(game).to receive(:save!).once
      subject
    end
  end

end
