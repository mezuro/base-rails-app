require 'rails_helper'

describe MetricConfiguration, :type => :model do
  subject {FactoryGirl.build(:metric_configuration)}

  describe 'methods' do
    describe 'mezuro_ranges' do
      let(:mezuro_range) { FactoryGirl.build(:mezuro_range) }
      before :each do
        MezuroRange.expects(:ranges_of).with(subject.id).returns([mezuro_range])
      end

      it 'should returns a list with its ranges' do
        expect(subject.mezuro_ranges).to eq([mezuro_range])
      end
    end
  end

  describe 'validations' do

    context 'active model validations' do
      before :each do
        MetricConfiguration.expects(:metric_configurations_of).at_least_once.returns([])
      end

      it { is_expected.to validate_presence_of(:code) }
      it { is_expected.to validate_presence_of(:weight) }
      it { is_expected.to validate_numericality_of(:weight) }
      it { is_expected.to validate_presence_of(:aggregation_form) }
    end

    context 'code validations' do
      before :each do
        MetricConfiguration.expects(:request).returns(42)
      end

      it 'should validate uniqueness' do
        CodeUniquenessValidator.any_instance.expects(:validate_each).with(subject, :code, subject.code)
        subject.save
      end
    end
  end
end
