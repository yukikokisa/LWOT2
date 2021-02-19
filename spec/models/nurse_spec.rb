require 'rails_helper'

RSpec.describe Nurse, type: :model do
  before do
    @nurse = FactoryBot.build(:nurse)
  end

  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      @nurse.name =  ''
      @nurse.valid?
      expect(nurse.errors.full_messages).to include("Name can't be blank")
    end
    it 'employee_numberが空では登録できない' do
      @nurse.employee_number = ''
      @nurse.valid?
      expect(nurse.errors.full_messages).to include("Employee number can't be blank")
    end
    it 'employee_numberが8桁でなければ登録できない' do
      @nurse.employee_number = '0000000'
      @nurse.valid?
      expect(nurse.errors.full_messages).to include("Employee number is the wrong length (should be 8 characters)")
    end
  end
end
