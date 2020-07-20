const { $CombinedState } = require("redux");
const YOUR_GIPHY_API_KEY = "xCiZQCOqVed094kTUGxAFalvNqF5nXRb";

export const fetchSearchGiphys = (searchTerm) => (
  $.ajax({
    method: 'GET',
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${YOUR_GIPHY_API_KEY}&limit=2`
  })
);