require './fibonacci/fibonacci'

RSpec.describe Fibonacci do
  let(:instance) { described_class.new }
  subject { instance.find(number) }

  context 'Given we want the zero-eth fibonacci number' do
    let(:number) { 0 }

    it 'returns 0' do
      expect(subject).to eq(0)
    end
  end

  context 'Given we want the first fibonacci number' do
    let(:number) { 1 }

    it 'returns 1' do
      expect(subject).to eq(1)
    end
  end

  context 'Given we want the second' do
    let(:number) { 2 }

    it 'returns 1' do
      expect(subject).to eq(1)
    end
  end
end
