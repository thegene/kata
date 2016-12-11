require './fibonacci/fibonacci'

RSpec.describe Fibonacci do
  subject { described_class.new.find(number) }

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

  context 'Given we want the seventh number' do
    let(:number) { 7 }

    it 'returns lucky ol thirteen' do
      expect(subject).to eq(13)
    end
  end

  context 'Given we want the tenth number' do
    let(:number) { 10 }

    it 'returns 55' do
      expect(subject).to eq(55)
    end
  end
end
