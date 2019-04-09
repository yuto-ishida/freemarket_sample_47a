FactoryBot.define do
  factory :item_image do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/1.jpg'), 'image/jpeg') }
    main {"1"}
  end
end
