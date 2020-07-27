//utility file for AJAX calls
const GifAPIUtil = {
  newGifAJAX: queryString => {
    return $.ajax({
      method: 'GET',
      url: `https://api.giphy.com/v1/gifs/random?tag=${queryString}&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G`,
    });
  },

  saveGifAJAX: gif => {
    return $.ajax({
      method: 'POST',
      url:'/gifs',
      data: {
        gif: gif
      }
    });
    
  },

  fetchSavedGifAJAX: (queryString) => {
    return $.ajax({
      method: "GET",
      url: `/gifs/${queryString}`
    });
  }
};

module.exports = GifAPIUtil;