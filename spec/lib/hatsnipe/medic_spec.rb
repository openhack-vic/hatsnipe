require 'spec_helper'

RSpec.describe Hatsnipe::Medic do
  let(:medic) { Hatsnipe::Medic.new }

  describe '#add_hat' do
    let(:hat_name) { 3 }
    let(:price) { 10 }

    subject { medic.add_hat hat_name, price }

    it 'changes the number of hats' do
      expect { subject }.to change { medic.hat_watches.count }.by(1)
    end
  end
end
