const GifAPIUtil = require("./gif_api_util.js");

// const newGifAJAX = queryString => {
//   //actual func that fires ajax request
//   return $.ajax({
//     method: 'GET',
//     url: `https://api.giphy.com/v1/gifs/random?tag=${queryString}&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G`,
//     success: (res) => appendGif(res.data.image_url)
//   });
//   //in this demo, this url is from the external resource gifi. 
//   //you need to look at their docs in which part to put queryString
//   // the minimum requirement for ajax request is url 
// };

const appendGif = gifUrl => {
  $(".gif-display").empty();
  $(".gif-display").append($(`<img class="gif" src=${gifUrl} />`));
};

// const saveGifAJAX = gif => {
//   //similar structure but with different arg, takes in gif object
//   //url here is our rails api
//   // since it's post we need data key
//   // the minimum requirement for ajax request is url. 
//   debugger
//   return $.ajax({
//     method: 'POST',
//     url:'/gifs',
//     data: {
//       gif: gif
//     }, //this will be in params in the backend.
//     success: (gif) => {
//       //gif here will have an id because successfully saved
//       debugger
//       //invoking a callback
//       postMessage("successfully saved")}
//   });
//   // why we need $ here? :ajax here is specifically from jQuery library.
//   // request is a string. By the time this string hits controller it's not a js code anymore(Rack is resonsible for this process)

// }

const postMessage = message => {
  //message: "successfully saved"
  debugger
  $('.messages').text(message);
};

// const fetchSavedGifAJAX = (queryString) => {
//   //queryString is title
//   return $.ajax({
//     method: "GET",
//     url: `/gifs/${queryString}`,
//     success: (gif) => {
//       //gif is a part of our response
//       appendGif(gif.url)
//       //^ it's a func defined at top 
//     },
//     error: (errors) => {
//       // debugger //is recommended to investigate the error messages
//       postMessage(errors.responseJSON[0])
//       //postMessage requires strong so we are grabbing acutal message string from errors
//       //.responseJSON is to call a property from errors object(it's not a function)
//     }
//   });
// };

const setEventHandlers = () => {
  //event 1 for form
  $('#new-gif-form').on('submit', e => {
    e.preventDefault();
    fetchNewGif();
  });
  //event 2 for button.clear
  $(".clear").on("click", () => {
    $(".gif-display").empty();
    $(".messages").empty();
  });
  //event 3 for saving functionality
  $("#save-gif-form").on("submit", e => {
    // debugger
    e.preventDefault();
    saveGif(); //we don't need to pass anything like e here
    //^invoking a callback(defined down below) for this submit event
  });
  //event 4 fetching gif from db
  $("#old-gif-form").on("submit", e => {
    e.preventDefault();
    fetchSavedGif();
  });
  //
  $("#callback-hell-form").on("submit", e => {
    e.preventDefault();
    callbackHell();
  })
};

$(() => {
  setEventHandlers();
});
//^ jQuery ready style: making sure the page is loaded before invoking
//the callback `setEventHandlers()` which contains all the events attached on htmlElements by using jQuery for the user's interaction with the webpage. 
//without this users wouldn't be able to interact with the webpage

// ------------- GIF ACTIONS - fetchNew, save, and fetchSaved ---------------

const fetchNewGif = () => {
  // this is a func we will use as a callback for the event
  const $input = $('#new-gif-query'); //turn itto jquery object
  const queryString = $input.val(); //grab the value from jquery input
  $input.val('');

  // TODO: Initiate AJAX call to GIPHY API, take response and put on the DOM
  const successCB = (res) => appendGif(res.data.image_url);
  GifAPIUtil.newGifAJAX(queryString).then(successCB).then(() => postMessage("here is your gif"));

};

const saveGif = () => {
  //this is a callback for submit event in setEventHandlers. 
  //you can put e as an arg here
  //right now e is undefined but sometimes we have an access to e
  debugger
  //similar above
  const $input = $("#save-gif-title");
  const title = $input.val(); //grabbing the user's input of the gif title
  $input.val("");
  const gif = {
    //makeing an object of gifpgif
    title: title,
    url: $(".gif-display > img").attr('src')
  };

  //TODO: Initiate AJAX request to Rails backend, give a message if successful
  const successCB = (gif) => postMessage(`${gif.title} successfully saved`);
  GifAPIUtil.saveGifAJAX(gif).then(successCB);
  
};
//
const fetchSavedGif = () => {
  const $input = $("#old-gif-query");
  const title = $input.val(); //extracting the user's text from the input
  $input.val("");

  // TODO: Initate AJAX request to Rails backend, add gif to the DOM if successful
  const successCB = (gif) => appendGif(gif.url);
  const errorCB = (errors) => {
    debugger
    postMessage(errors.responseJSON[0])};
  const errorCB2 = () => {
    debugger
    alert("yes, you failed")};
    //^ you don't need to put return 
  
  //way 1 
  GifAPIUtil.fetchSavedGifAJAX(title).then(successCB).fail(errorCB).fail(errorCB2);
  //way 2:
  // GifAPIUtil.fetchSavedGifAJAX(title).then(successCB, errorCB);
  //^ they both are functionally the same 
};

// $.ajax promise-like vs browser ajax regular promise
// browser ajax will use .catch() while jquery ajax will use .fail()
// jquery ajax fail will return original promise






// ------------- CALLBACK HELL ---------------
//you can refactor this code if you want (this way is not recommended)
const callbackHell = () => {
  const $input = $('#callback-hell-query');
  const title = $input.val();
  $input.val('');
  return $.ajax({
    method: 'GET',
    url: `/gifs/${title}`,
    dataType: 'json',
    success: gif => {
      // gif exists in DB
      appendGif(gif.url);
    },
    error: response => {
      // gif doesn't exist
      postMessage(`${response.responseJSON[0]} Fetching new gif...`);
      //chaining another ajax request when error occurs from the first request. 
      return $.ajax({
        method: 'GET',
        url: `https://api.giphy.com/v1/gifs/random?tag=${title}&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G`,
        success: (
          gif // giphy call is successful
        ) => {
          const url = gif.data.image_url;
          appendGif(url);
          gif = { title: title, url: url };
          //chaining AGAIN on the success call of the second AJAX request. 
          return $.ajax({
            // save gif to db
            method: 'POST',
            url: '/gifs',
            data: {
              gif: gif,
            },
            success: savedGif => {
              postMessage('Successfully saved!');
            },
          });
        },
      });
    },
  });
};







