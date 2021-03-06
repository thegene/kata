require './change_maker/first_pass'

RSpec.describe ChangeMaker::FirstPass do
  context 'Given a ChangeMaker' do
    subject { described_class.new.make_change_for(number) }

    context 'when making change for 1 cent' do
      let(:number) { 1 }

      it 'finds one way to make change' do
        expect(subject.count).to eq(1)
      end

      it 'is only a penny' do
        expect(subject).to match_array([[1]])
      end
    end

    context 'when making change for 5 cents' do
      let(:number) { 5 }

      it 'finds two ways to make change' do
        expect(subject.count).to eq(2)
      end

      it 'returns a nickel or five pennies' do
        expect(subject).to match_array([[5], [1, 1, 1, 1, 1]])
      end
    end

    context 'when making change for 11 cents' do
      let(:number) { 11 }

      it 'finds four ways to make change' do
        expect(subject.count).to eq(4)
      end

      it 'will report what these four ways are' do
        expect(subject).to match_array([
          [10, 1],
          [5, 5, 1],
          [5, 1, 1, 1, 1, 1, 1],
          [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        ])
      end
    end

    context 'when making change for 200 cents' do
      let(:number) { 50 }

      it 'finds a lot of ways to make change' do
        expect(subject.count).to eq(49)
      end
    end

    context 'when making change for 1000 cents' do
      let(:number) { 1000 }

      it 'finds a lot of ways to make change' do
        expect(subject.count).to eq(142511)
      end

    end
  end
end
