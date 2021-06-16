# frozen_string_literal: true

require_relative '../../../app/formatter/phone_number/uk'

RSpec.describe Formatter::PhoneNumber::UK do
  subject { described_class.format(number) }

  describe '.format' do
    context 'when the number prefix is +44' do
      let(:number) { '+44 7234 567890' }

      it 'returns the number in the correct format' do
        expect(subject).to eq('+447234567890')
      end
    end

    context 'when the number prefix is 44' do
      let(:number) { '44 7234 567890' }

      it 'returns the number in the correct format' do
        expect(subject).to eq('+447234567890')
      end
    end

    context 'when the number prefix is 0' do
      let(:number) { '07234 567890' }

      it 'returns the number in the correct format' do
        expect(subject).to eq('+447234567890')
      end
    end

    context 'when the prefix is not valid' do
      let(:number) { '+4 7234 567890' }

      it 'raises an error' do
        expect { subject }.to raise_error(ValidationError, 'Phone number prefix is not valid.')
      end
    end

    context 'when the number is not long enough' do
      let(:number) { '07234 5678' }

      it 'raises an error' do
        expect { subject }.to raise_error(ValidationError, 'Phone number is not the correct length.')
      end
    end

    context 'when the prefix is not followed by a 7' do
      let(:number) { '01234 567890' }

      it 'raises an error' do
        expect { subject }.to raise_error(ValidationError, 'Phone number format is not valid.')
      end
    end
  end
end
