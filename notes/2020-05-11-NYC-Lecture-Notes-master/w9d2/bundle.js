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
/******/ 	return __webpack_require__(__webpack_require__.s = "./entry.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./currying.js":
/*!*********************!*\
  !*** ./currying.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function boringAddThreeNumbers(num1, num2, num3) {\n    return num1 + num2 + num3;\n}\n\n// currying saves arguments and invokes function when args have been collected\nfunction addThreeNumbers(firstNum) {\n    return function (secondNum) {\n        return function (thirdNum) {\n            return firstNum + secondNum + thirdNum;\n        };\n    };\n}\n\nconst addThreeNumbersAgain = num1 => {\n    return num2 => {\n        return num3 => {\n            return num1 + num2 + num3;\n        };\n    };\n};\n\nfunction continuousAdd() { \n    const args = []; \n    return function _curriedAdd(num) { \n        args.push(num);\n        console.log(args.reduce((acc, el) => {\n            return acc + el;\n        }));\n        return _curriedAdd; \n    };\n}\n\nmodule.exports = {\n    continuousAdd,\n    addThreeNumbers\n}\n\n//# sourceURL=webpack:///./currying.js?");

/***/ }),

/***/ "./entry.js":
/*!******************!*\
  !*** ./entry.js ***!
  \******************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const PI = __webpack_require__(/*! ./prototypal_inheritance */ \"./prototypal_inheritance.js\");\nconst Curry = __webpack_require__(/*! ./currying */ \"./currying.js\");\n// command used to generate webpack bundle file:\n// `webpack entry.js -o bundle.js` creates `bundle.js` at top level\n// `webpack entry.js` will create a `dist/main.js` bundle file\n// webpack makes all code function-scoped and doesn't allow users to interact with our code\n// production mode IGNORES debugger, add `--mode=development` to make it development mode\n// to not have to run webpack to bundle every time while working, add `--watch`\n// one-line command of all above: `webpack entry.js -o bundle.js --mode=development --watch`\n// how to stop webpack from running? `ctrl + c`\nconst Cat = PI.Cat;\n\n// FOR TESTING ONLY, EXTREMELY IMPORTANT!\nwindow.Cat = Cat; // manually and intentionally set things on the window to be able to test on the chrome console\n// DEBUGGING: think logically/rationally about what/how/why my data is what it is\n// drop debuggers in EVERY STEP involved and inspect all values that are involved\n\nconst garfield = new Cat('garfield');\nconsole.log(garfield.name);\n\n//# sourceURL=webpack:///./entry.js?");

/***/ }),

/***/ "./prototypal_inheritance.js":
/*!***********************************!*\
  !*** ./prototypal_inheritance.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function Animal(name) {\n    // debugger;\n    this.name = name;\n};\n\nAnimal.prototype.eat = function () {\n    console.log(this.name + ' is eating.');\n};\n\nfunction Cat(name) {\n    this.name = name;\n    // debugger;\n    Animal.call(this, name);\n}\n\nfunction Surrogate() { }\nSurrogate.prototype = Animal.prototype;\nCat.prototype = new Surrogate();\nCat.prototype.constructor = Cat;\n\nmodule.exports = {\n    Animal, // same as Animal: Animal,\n    Cat\n}\n\n//# sourceURL=webpack:///./prototypal_inheritance.js?");

/***/ })

/******/ });