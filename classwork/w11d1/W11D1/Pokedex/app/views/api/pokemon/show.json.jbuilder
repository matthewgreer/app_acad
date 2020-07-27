json.pokemon do
# normalize state by nesting the pokemon data under a key of id
  json.extract! @pokemon, :id, :name, :attack, :defense, 
    :moves, :poke_type, :item_ids
    json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}") # the data we want to extract
end


json.items do
  @pokemon.items.each do |item|
    json.set! item.id do
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness
      json.image_url asset_path("#{item.image_url}")
    end
  end
end

# this gives us the right structure, but it's not normalized - information is repeated unnecessarily