require 'rails_helper'

RSpec.describe ItemImage, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with main' do
        expect(build(:item_image,main: nil)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without image' do
        item_image = build(:item_image,image: nil)
        item_image.valid?
        expect(item_image.errors[:image]).to include("を入力してください")
      end
    end
  end
end
