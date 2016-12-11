require './fibonacci/fibonacci'

RSpec.describe Fibonacci do
  subject { described_class.new.find(number) }

  context 'Given we want the zero-eth fibonacci number' do
    let(:number) { 0 }

    it 'returns 0' do
      expect(subject).to be(0)
    end
  end

  context 'Given we want the first fibonacci number' do
    let(:number) { 1 }

    it 'returns 1' do
      expect(subject).to be(1)
    end
  end
end
