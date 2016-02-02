json.array!(@decks) do |deck|
  json.extract! deck, :id, :title, :author, :category
  json.url deck_url(deck, format: :json)
end
