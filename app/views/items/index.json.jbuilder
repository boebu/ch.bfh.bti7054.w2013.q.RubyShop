json.array!(@items) do |item|
  json.id item.id
  json.title item.translations.find_by_language_id(session[:language_id]).title
  json.imgSrc item.imgSrc
end
