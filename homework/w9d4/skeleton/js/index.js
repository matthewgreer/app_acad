console.log("Hello from the JavaScript console!");

$.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("Here's yooooour weathah!");
    console.log(data);
  },
  error() {
    console.error("No weathah fo yoo!!!");
  },
});
console.log("AJAX can jax deez nutz.");




// Make sure you can answer the following questions:

// When does the request get sent ?
  // Who knows? Probably when the document finishes loading.
// When does the response come back ?
  // When the server gets around to it. Truly it all happens so
  //  quickly with a request this small, it all seems to
  //  occur simultaneously. Plus it's logging in the console
  //  which, though it probably could tell me a bunch about
  //  the transaction, is boring as fuck. tl;dr
// What's the current weather in New York?
  // Well, according to the nearly illegible mass of key/value
  //  pairs the server returned, I surmise that the humidity is
  //  a sticky 83%, with winds from the NNE at 2.1mph. Skies
  //  are reported to be clear. However, I strongly doubt the 
  //  veracity of this data, since the current temperature in
  //  New York is reported to be 298.22 (feels like 301.44 --
  //  it's the humidity, right?). My intuition tells me that
  //  this week has literally gone to hell and we are all to be
  //  summarily braised at 300 degrees for the rest of eternity
  //  whilst learning JavaScript, Canvas, jQuery, and AJAX.
  //  ...Yup it's hell alright.
// Did the page refresh ?
  // I'd guess not. Too busy screaming to really pay attention.
// How could we use different HTTP methods in our request ?
  // Um, writing them? I suppose we could send a POST that
  //  passed in the correct NY temperature for their back end?
  //  I wish my back end were at the correct temperature, but
  //  whaddya expect when you're in actual hell?