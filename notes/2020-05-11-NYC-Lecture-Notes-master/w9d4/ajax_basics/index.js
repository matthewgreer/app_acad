const newGifAJAX = queryString => {
  //invoking ajax function
  return $.ajax({
    method: "GET",
    url: `https://api.giphy.com/v1/gifs/random?tag=${queryString}&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G`,
    success: gif => appendGifToUL(gif.data.image_url),
    errors: errors => console.log(errors)
  });
  //ajax only requires two keys(method, url) to make a request
  //default method is GET
  //you will get errors when the success call status is other than 200. 
  //method: POST, PATCH, GET..
};

// const res = newGifAJAX("dog");
// console.log(res.responseJSON.data.image_url);

//^this wouldn't work because console.log excutes before we get response.
//we need a success call (such as `success: response => { console.log(response.data.image_url); }`) inside the AJAX requeset
//we need a success cal when we only need immediate response. 
// newGifAJAX("dog") "dog" here is a queryString argument we pass in newGifAJAX. 



const setupGifFormListener = () => {
  $(".gif-search-form").submit((e) => {
    e.preventDefault(); //preventing the default action (in this case, refresh)
    const $input = $(".gif-search-input");
    const queryString = $input.val();
    newGifAJAX(queryString);
  });
};

const appendGifToUL = gifURL => {
  const $ul = $(".gif-index");
  const $li = $(`<li> <img src=${gifURL} /> </>`);
  $ul.append($li);
}; // when we get a success call we append it to the ul. 

$(() => {
  setupGifFormListener();
}); //why in $()? :wait for the page to load before invoke the even(jquery ready style invocation)

// success: response => { console.log(response.data.image_url); }
// success: gif => appendGifToUL(gif.data.image_url),
// errors: errors => console.log(errors),