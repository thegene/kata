require './change_maker/change_maker'
RSpec.describe ChangeMaker do
  context 'Given a ChangeMaker' do
    subject { described_class.new }

    context 'when making change for 1 cent' do
      it 'finds one way to make change' do
        expect(subject.change_ways(1)).to eq(1)
      end
    end
  end
end
