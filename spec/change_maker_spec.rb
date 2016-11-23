require './change_maker/change_maker'
RSpec.describe ChangeMaker do
  context 'Given a ChangeMaker' do
    subject { described_class.new }

    context 'when making change for 1 cent' do
      it 'finds one way to make change' do
        expect(subject.ways_to_make_change(1)).to eq(1)
      end
    end

    context 'when making change for 5 cents' do
      it 'finds two ways to make change' do
        expect(subject.ways_to_make_change(5)).to eq(2)
      end
    end

    context 'when making change for 11 cents' do
      it 'finds three ways to make change' do
        expect(subject.ways_to_make_change(11)).to eq(4)
      end
    end
  end
end
