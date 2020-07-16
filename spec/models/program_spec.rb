require 'rails_helper'

RSpec.describe Program, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end

  describe 'associations' do
    it { should belong_to(:author)}
    it { should belong_to(:group).optional(true)}
  end

  describe 'class methods' do

    describe '::total_hours' do
      subject { build(:program, amount: 45) }
      it 'should returns the sum of hours of a list of programs' do
        expect(FactoryBot.build(:program, amount: 45).total_hours).to eq(45)
      end
    end

    # describe '::no_group' do
    #   it 'returns the grouped programs' do
    #     expect(Program.no_group).to include(naruto)
    #   end

    #   it 'does not return the grouped programs' do
    #     expect(Program.no_group).not_to include(naruto)
    #   end
    #end

  end
end
