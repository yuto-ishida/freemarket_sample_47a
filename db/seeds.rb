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
