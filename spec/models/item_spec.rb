require 'rails_helper'

RSpec.describe Item, type: :model do

  let(:user) {create(:user)}
  let(:condition) {create(:condition)}
  let(:shipping_burden) {create(:shipping_burden)}
  let(:shipping_style) {create(:shipping_style)}
  let(:date_of_shipment) {create(:date_of_shipment)}
  let(:status) {create(:status)}
  let(:category) {create(:category)}
  let(:item_size) {create(:item_size)}
  let(:item_image) {create(:item_image)}


  describe '#create' do
    context 'can save' do
      it 'is valid with brand_ids' do
        item = build(:item,user: user,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, item_size_ids: item_size.id , status: status, item_image_ids: item_image.id, brand_ids: nil)
        expect(item).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without name' do
        item = build(:item,user: user,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, item_size_ids: item_size.id , status: status,item_image_ids: item_image.id, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it 'is invalid without description' do
        item = build(:item,user: user,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, item_size_ids: item_size.id , status: status,item_image_ids: item_image.id, description: nil)
        item.valid?
        expect(item.errors[:description]).to include('を入力してください')
      end

      it 'is invalid without user_id' do
        item = build(:item,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, item_size_ids: item_size.id , status: status,item_image_ids: item_image.id, user_id: nil)
        item.valid?
        expect(item.errors[:user_id]).to include('を入力してください')
      end

      it 'is invalid without shipping_burden_id' do
        item = build(:item,user: user,condition: condition, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, item_size_ids: item_size.id , status: status,item_image_ids: item_image.id, shipping_burden_id: nil)
        item.valid?
        expect(item.errors[:shipping_burden_id]).to include('を入力してください')
      end

      it 'is invalid without prefecture_id' do
        item = build(:item,user: user,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, item_size_ids: item_size.id , status: status,item_image_ids: item_image.id, prefecture_id: nil)
        item.valid?
        expect(item.errors[:prefecture_id]).to include('を入力してください')
      end

      it 'is invalid without date_of_shipment_id' do
        item = build(:item,user: user,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, category_ids: category.id, item_size_ids: item_size.id , status: status,item_image_ids: item_image.id, date_of_shipment_id: nil)
        item.valid?
        expect(item.errors[:date_of_shipment_id]).to include('を入力してください')
      end

      it 'is invalid without price' do
        item = build(:item,user: user,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, item_size_ids: item_size.id , status: status,item_image_ids: item_image.id, price: nil)
        item.valid?
        expect(item.errors[:price]).to include('を入力してください')
      end

      it 'is invalid withou status_id' do
        item = build(:item,user: user,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, item_size_ids: item_size.id ,item_image_ids: item_image.id, status_id: nil)
        item.valid?
        expect(item.errors[:status_id]).to include('を入力してください')
      end

      it 'is invalid without category_ids' do
        item = build(:item,user: user,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment, item_size_ids: item_size.id , status: status,item_image_ids: item_image.id, category_ids: nil)
        item.valid?
        expect(item.errors[:category_ids]).to include('を入力してください')
      end

      it 'is invalid without condition_id' do
        item = build(:item,user: user,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, item_size_ids: item_size.id , status: status,item_image_ids: item_image.id, condition_id: nil)
        item.valid?
        expect(item.errors[:condition_id]).to include('を入力してください')
      end

      it 'is invalid without item_size_ids' do
        item = build(:item,user: user,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, status: status, item_image_ids: item_image.id,item_size_ids: nil)
        item.valid?
        expect(item.errors[:item_size_ids]).to include('を入力してください')
      end

      it 'is invalid without item_image_ids' do
        item = build(:item,user: user,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, item_size_ids: item_size.id , status: status, item_image_ids: nil)
        item.valid?
        expect(item.errors[:item_image_ids]).to include('を入力してください')
      end
    end
  end


  describe "scope" do
    describe "open" do
        let!(:applecable_item) { create(:item,user: user,condition: condition,shipping_burden: shipping_burden, shipping_style: shipping_style, date_of_shipment: date_of_shipment,category_ids: category.id, item_size_ids: item_size.id , status: status, item_image_ids: item_image.id) }
        subject { Item.all }
        it { is_expected.to include applecable_item }
    end
  end
end
