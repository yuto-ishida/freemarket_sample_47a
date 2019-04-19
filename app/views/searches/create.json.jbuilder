json.array! @items do |item|
  json.name item.name
  json.url  item.item_images.first.image.url
  json.price item.price
  json.id   item.id
end
