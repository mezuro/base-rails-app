require 'spec_helper'

describe ReadingGroup, :type => :model do
  describe 'methods' do
    describe 'persisted?' do
      before :each do
        @subject = FactoryGirl.build(:reading_group)
        ReadingGroup.expects(:exists?).with(@subject.id).returns(false)
      end

      it 'should return false' do
        expect(@subject.persisted?).to eq(false)
      end
    end
    
    describe 'update' do
      before :each do
        @qt = FactoryGirl.build(:reading_group)
        @qt_params = Hash[FactoryGirl.attributes_for(:reading_group).map { |k,v| [k.to_s, v.to_s] }] #FIXME: Mocha is creating the expectations with strings, but FactoryGirl returns everything with sybols and integers
      end

      context 'with valid attributes' do
        before :each do
          @qt.expects(:save).returns(true)
        end

        it 'should return true' do
          expect(@qt.update(@qt_params)).to eq(true)
        end
      end

      context 'with invalid attributes' do
        before :each do
          @qt.expects(:save).returns(false)
        end

        it 'should return false' do
          expect(@qt.update(@qt_params)).to eq(false)
        end
      end
    end

    describe 'fork' do
      subject { FactoryGirl.create(:reading_group) }
      before :each do
        params = subject.to_hash.clone
        params.delete(:id)
        params.delete(:errors)
        expected_fork = FactoryGirl.create(:forked_reading_group)
        ReadingGroup.expects(:create).with(params).returns(expected_fork)
      end
      it 'should create a new Reading Group instance with different id' do
        forked = subject.fork()
        expect(forked.id).not_to eq(subject.id)
        expect(forked.name).to eq(subject.name)
        expect(forked.description).to eq(subject.description)
      end
    end

    describe 'readings' do
      subject { FactoryGirl.build(:reading_group) }
      let(:reading) { FactoryGirl.build(:reading) }

      it 'should call readings_of on the Reading model' do
        Reading.expects(:readings_of).with(subject.id).returns([reading])

        expect(subject.readings).to include(reading)
      end
    end
  end

  describe 'validations' do
    subject {FactoryGirl.build(:reading_group)}
    context 'active model validations' do  
      before :each do
        ReadingGroup.expects(:all).at_least_once.returns([])
      end
      it { is_expected.to validate_presence_of(:name) }
    end

    context 'kalibro validations' do
      before :each do
        ReadingGroup.expects(:request).returns(42)
      end

      it 'should validate uniqueness' do
        KalibroUniquenessValidator.any_instance.expects(:validate_each).with(subject, :name, subject.name)
        subject.save
      end
    end
  end
end
