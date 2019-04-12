require "csv"

CSV.foreach('db/data_reading_files/shipping_burdens.csv') do |row|
  ShippingBurden.create(:name => row[0])
end
CSV.foreach('db/data_reading_files/date_of_shipments.csv') do |row|
  DateOfShipment.create(:name => row[0])
end
CSV.foreach('db/data_reading_files/shipping_styles.csv') do |row|
  ShippingStyle.create(:name => row[0])
end
CSV.foreach('db/data_reading_files/conditions.csv') do |row|
  Condition.create(:name => row[0])
end
CSV.foreach('db/data_reading_files/statuses.csv') do |row|
  Status.create(:name => row[0])
end
CSV.foreach('db/data_reading_files/users.csv') do |row|
  User.create(:email => row[0],:password => row[1],:password_confirmation => row[1])
end
CSV.foreach('db/data_reading_files/category.csv') do |row|
  Category.create(:name => row[0])
end
CSV.foreach('db/data_reading_files/item_size.csv') do |row|
  ItemSize.create(:name => row[0])
end
CSV.foreach('db/data_reading_files/brand.csv') do |row|
  Brand.create(:name => row[0])
end

#item
# CSV.foreach('db/item_data_reading_files/brand_items.csv') do |row|
#   BrandItem.create(:id => row[0],:brand_id => row[1],:item_id => row[2],:created_at => row[3],:updated_at => row[4])
# end
# CSV.foreach('db/item_data_reading_files/category_items.csv') do |row|
#   CategoryItem.create(:category_id => row[0])
# end
# CSV.foreach('db/item_data_reading_files/item_image_items.csv') do |row|
#   ItemImageItem.create(:item_image_id => row[0])
# end
# CSV.foreach('db/item_data_reading_files/item_images.csv') do |row|
#   ItemImage.create(:image => row[0])
# end
# CSV.foreach('db/item_data_reading_files/item_size_items.csv') do |row|
#   ItemSizeItem.create(:item_size_id => row[0])
# end
# CSV.foreach('db/data_reading_files/items.csv') do |row|
#   Item.create(id: row[0],name: row[1],description: row[2],user_id: row[3],condition_id: row[4],shipping_burden_id: row[5],shipping_style_id: row[6],prefecture_id: row[7],date_of_shipment_id: row[8],price: row[9],status_id: row[10])
# end


# :status_id ,{:item_image_ids => []},:category_ids, :item_size_ids, :brand_ids ,:name,:description,:condition_id,:shipping_burden_id, :shipping_style_id ,:prefecture_id,:date_of_shipment_id ,:price).merge(user_id: current_user.id

# :image
