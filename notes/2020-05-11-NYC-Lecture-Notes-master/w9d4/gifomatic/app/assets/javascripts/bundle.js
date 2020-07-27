/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/gifomatic.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/gif_api_util.js":
/*!**********************************!*\
  !*** ./frontend/gif_api_util.js ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("//utility file for AJAX calls\nconst GifAPIUtil = {\n  newGifAJAX: queryString => {\n    return $.ajax({\n      method: 'GET',\n      url: `https://api.giphy.com/v1/gifs/random?tag=${queryString}&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G`,\n    });\n  },\n\n  saveGifAJAX: gif => {\n    return $.ajax({\n      method: 'POST',\n      url:'/gifs',\n      data: {\n        gif: gif\n      }\n    });\n    \n  },\n\n  fetchSavedGifAJAX: (queryString) => {\n    return $.ajax({\n      method: \"GET\",\n      url: `/gifs/${queryString}`\n    });\n  }\n};\n\nmodule.exports = GifAPIUtil;\n\n//# sourceURL=webpack:///./frontend/gif_api_util.js?");

/***/ }),

/***/ "./frontend/gifomatic.js":
/*!*******************************!*\
  !*** ./frontend/gifomatic.js ***!
  \*******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const GifAPIUtil = __webpack_require__(/*! ./gif_api_util.js */ \"./frontend/gif_api_util.js\");\n\n// const newGifAJAX = queryString => {\n//   //actual func that fires ajax request\n//   return $.ajax({\n//     method: 'GET',\n//     url: `https://api.giphy.com/v1/gifs/random?tag=${queryString}&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G`,\n//     success: (res) => appendGif(res.data.image_url)\n//   });\n//   //in this demo, this url is from the external resource gifi. \n//   //you need to look at their docs in which part to put queryString\n//   // the minimum requirement for ajax request is url \n// };\n\nconst appendGif = gifUrl => {\n  $(\".gif-display\").empty();\n  $(\".gif-display\").append($(`<img class=\"gif\" src=${gifUrl} />`));\n};\n\n// const saveGifAJAX = gif => {\n//   //similar structure but with different arg, takes in gif object\n//   //url here is our rails api\n//   // since it's post we need data key\n//   // the minimum requirement for ajax request is url. \n//   debugger\n//   return $.ajax({\n//     method: 'POST',\n//     url:'/gifs',\n//     data: {\n//       gif: gif\n//     }, //this will be in params in the backend.\n//     success: (gif) => {\n//       //gif here will have an id because successfully saved\n//       debugger\n//       //invoking a callback\n//       postMessage(\"successfully saved\")}\n//   });\n//   // why we need $ here? :ajax here is specifically from jQuery library.\n//   // two places where rails are concerned with js are application.js, application.html.erb \n//   // request is a string. By the time this string hits controller it's not a js code anymore(Rack is resonsible for this process)\n\n// }\n\nconst postMessage = message => {\n  //message: \"successfully saved\"\n  debugger\n  $('.messages').text(message);\n};\n\n// const fetchSavedGifAJAX = (queryString) => {\n//   //queryString is title\n//   return $.ajax({\n//     method: \"GET\",\n//     url: `/gifs/${queryString}`,\n//     success: (gif) => {\n//       //gif is a part of our response\n//       appendGif(gif.url)\n//       //^ it's a func defined at top \n//     },\n//     error: (errors) => {\n//       // debugger //is recommended to investigate the error messages\n//       postMessage(errors.responseJSON[0])\n//       //postMessage requires strong so we are grabbing acutal message string from errors\n//       //.responseJSON is to call a property from errors object(it's not a function)\n//     }\n//   });\n// };\n\nconst setEventHandlers = () => {\n  //event 1 for form\n  $('#new-gif-form').on('submit', e => {\n    e.preventDefault();\n    fetchNewGif();\n  });\n  //event 2 for button.clear\n  $(\".clear\").on(\"click\", () => {\n    $(\".gif-display\").empty();\n    $(\".messages\").empty();\n  });\n  //event 3 for saving functionality\n  $(\"#save-gif-form\").on(\"submit\", e => {\n    // debugger\n    e.preventDefault();\n    saveGif(); //we don't need to pass anything like e here\n    //^invoking a callback(defined down below) for this submit event\n  });\n  //event 4 fetching gif from db\n  $(\"#old-gif-form\").on(\"submit\", e => {\n    e.preventDefault();\n    fetchSavedGif();\n  });\n  //\n  $(\"#callback-hell-form\").on(\"submit\", e => {\n    e.preventDefault();\n    callbackHell();\n  })\n};\n\n$(() => {\n  setEventHandlers();\n});\n//^ jQuery ready style: making sure the page is loaded before invoking\n//the callback `setEventHandlers()` which contains all the events attached on htmlElements by using jQuery for the user's interaction with the webpage. \n//without this users wouldn't be able to interact with the webpage\n\n// ------------- GIF ACTIONS - fetchNew, save, and fetchSaved ---------------\n\nconst fetchNewGif = () => {\n  // this is a func we will use as a callback for the event\n  const $input = $('#new-gif-query'); //turn itto jquery object\n  const queryString = $input.val(); //grab the value from jquery input\n  $input.val('');\n\n  // TODO: Initiate AJAX call to GIPHY API, take response and put on the DOM\n  const successCB = (res) => appendGif(res.data.image_url);\n  GifAPIUtil.newGifAJAX(queryString).then(successCB).then(() => postMessage(\"here is your gif\"));\n\n};\n\nconst saveGif = () => {\n  //this is a callback for submit event in setEventHandlers. \n  //you can put e as an arg here\n  //right now e is undefined but sometimes we have an access to e\n  debugger\n  //similar above\n  const $input = $(\"#save-gif-title\");\n  const title = $input.val(); //grabbing the user's input of the gif title\n  $input.val(\"\");\n  const gif = {\n    //makeing an object of gifpgif\n    title: title,\n    url: $(\".gif-display > img\").attr('src')\n  };\n\n  //TODO: Initiate AJAX request to Rails backend, give a message if successful\n  const successCB = (gif) => postMessage(`${gif.title} successfully saved`);\n  GifAPIUtil.saveGifAJAX(gif).then(successCB);\n  \n};\n//\nconst fetchSavedGif = () => {\n  const $input = $(\"#old-gif-query\");\n  const title = $input.val(); //extracting the user's text from the input\n  $input.val(\"\");\n\n  // TODO: Initate AJAX request to Rails backend, add gif to the DOM if successful\n  const successCB = (gif) => appendGif(gif.url);\n  const errorCB = (errors) => {\n    debugger\n    postMessage(errors.responseJSON[0])};\n  const errorCB2 = () => {\n    debugger\n    alert(\"yes, you failed\")};\n    //^ you don't need to put return \n  \n  //way 1 \n  GifAPIUtil.fetchSavedGifAJAX(title).then(successCB).fail(errorCB).fail(errorCB2);\n  //way 2:\n  // GifAPIUtil.fetchSavedGifAJAX(title).then(successCB, errorCB);\n  //^ they both are functionally the same \n};\n\n// $.ajax promise-like vs browser ajax regular promise\n// browser ajax will use .catch() while jquery ajax will use .fail()\n// jquery ajax fail will return original promise\n\n\n\n\n\n\n// ------------- CALLBACK HELL ---------------\n//you can refactor this code if you want (this way is not recommended)\nconst callbackHell = () => {\n  const $input = $('#callback-hell-query');\n  const title = $input.val();\n  $input.val('');\n  return $.ajax({\n    method: 'GET',\n    url: `/gifs/${title}`,\n    dataType: 'json',\n    success: gif => {\n      // gif exists in DB\n      appendGif(gif.url);\n    },\n    error: response => {\n      // gif doesn't exist\n      postMessage(`${response.responseJSON[0]} Fetching new gif...`);\n      //chaining another ajax request when error occurs from the first request. \n      return $.ajax({\n        method: 'GET',\n        url: `https://api.giphy.com/v1/gifs/random?tag=${title}&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G`,\n        success: (\n          gif // giphy call is successful\n        ) => {\n          const url = gif.data.image_url;\n          appendGif(url);\n          gif = { title: title, url: url };\n          //chaining AGAIN on the success call of the second AJAX request. \n          return $.ajax({\n            // save gif to db\n            method: 'POST',\n            url: '/gifs',\n            data: {\n              gif: gif,\n            },\n            success: savedGif => {\n              postMessage('Successfully saved!');\n            },\n          });\n        },\n      });\n    },\n  });\n};\n\n\n\n\n\n\n\n\n\n//# sourceURL=webpack:///./frontend/gifomatic.js?");

/***/ })

/******/ });