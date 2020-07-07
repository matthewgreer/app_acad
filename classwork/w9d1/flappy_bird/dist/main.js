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
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/bird.js":
/*!*********************!*\
  !*** ./src/bird.js ***!
  \*********************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"default\", function() { return Bird; });\nconst CONSTANTS = {\n  GRAVITY: 0.5,\n  FLAP_SPEED: 8,\n  TERMINAL_VEL: 12,\n  BIRD_WIDTH: 40,\n  BIRD_HEIGHT: 30,\n};\n\nclass Bird {\n\n  constructor(dimensions) {\n    this.dimensions = dimensions;\n    this.x = this.dimensions.width / 3;\n    this.y = this.dimensions.height /2;\n    this.vel = 0;\n  }\n\n  flap() {\n    this.vel = -1 * CONSTANTS.FLAP_SPEED;\n  }\n\n  moveBird() {\n    this.y += this.vel;\n    this.vel += CONSTANTS.GRAVITY;\n    // terminal velocity\n    if (Math.abs(this.vel) > CONSTANTS.TERMINAL_VEL) {\n      if (this.vel > 0) {\n        this.vel = CONSTANTS.TERMINAL_VEL;\n      } else {\n        this.vel = CONSTANTS.TERMINAL_VEL * -1;\n      }\n    }\n  }\n\n  animate(ctx) {\n    this.moveBird();\n    this.drawBird(ctx);\n  }\n\n  drawBird(ctx) {\n    ctx.fillStyle = 'orange';\n    ctx.fillRect(this.x, this.y, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT);\n  }\n\n  birdHitbox() {\n    return {\n      left: this.x,\n      right: this.x + CONSTANTS.BIRD_WIDTH,\n      top: this.y,\n      bottom: this.y + CONSTANTS.BIRD_HEIGHT\n    };\n  }\n\n  offBoard() {\n    const pastTop = this.y < 0;\n    const pastBottom = this.y + CONSTANTS.BIRD_HEIGHT > this.dimensions.height;\n    return pastTop || pastBottom;\n  }\n}\n\n//# sourceURL=webpack:///./src/bird.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"default\", function() { return FlappyBird; });\n/* harmony import */ var _bird__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./bird */ \"./src/bird.js\");\n/* harmony import */ var _level__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./level */ \"./src/level.js\");\n\n\n\nclass FlappyBird {\n  constructor(canvas) {\n    this.ctx = canvas.getContext(\"2d\");\n    this.dimensions = { width: canvas.width, height: canvas.height };\n    this.registerEvents();\n    this.restart();\n  }\n\n  play() {\n    this.running = true;\n    this.animate();\n  }\n\n  restart() {\n    this.running = false;\n    this.score = 0;\n    this.bird = new _bird__WEBPACK_IMPORTED_MODULE_0__[\"default\"](this.dimensions);\n    this.level = new _level__WEBPACK_IMPORTED_MODULE_1__[\"default\"](this.dimensions);\n   \n    this.animate();\n  }\n\n  registerEvents() {\n    this.boundClickHandler = this.click.bind(this);\n    this.ctx.canvas.addEventListener(\"mousedown\", this.boundClickHandler);\n  }\n\n  click(e) {\n    if (!this.running) {\n      this.play();\n    }\n    this.bird.flap();\n  }\n\n  gameOver() {\n    return (\n      this.level.collidesWith(this.bird.birdHitbox()) || this.bird.offBoard(this.height)\n    );\n  }\n\n  animate() {\n    this.level.animate(this.ctx);\n    this.bird.animate(this.ctx);\n\n    if (this.gameOver()) {\n      alert(this.score);\n      this.restart();\n    }\n\n    this.level.passedPipe(this.bird.birdHitbox(), () => {\n      this.score += 1;\n      console.log(this.score);\n    });\n\n    this.drawScore();\n\n    if (this.running) {\n      requestAnimationFrame(this.animate.bind(this));\n    }\n  }\n\n  drawScore() {\n    const scoreboard = {x: (this.dimensions.width / 2) - 10, y: this.dimensions.height / 4}\n    this.ctx.font = \"bold 40pt sans-serif\";\n    this.ctx.fillStyle = \"red\";\n    this.ctx.fillText(this.score, scoreboard.x, scoreboard.y);\n    this.ctx.strokeStyle='black';\n    this.ctx.lineWidth = 2;\n    this.ctx.strokeText(this.score, scoreboard.x, scoreboard.y);\n  }\n}\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _game__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\n\nconst canvas = document.getElementById('bird-game');\nnew _game__WEBPACK_IMPORTED_MODULE_0__[\"default\"](canvas);\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/level.js":
/*!**********************!*\
  !*** ./src/level.js ***!
  \**********************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"default\", function() { return Level; });\nconst CONSTANTS = {\n  PIPE_SPEED: 2,\n  GAP_SIZE: 150,\n  PIPE_THICKNESS: 40,\n  MARGIN: 50,\n  PIPE_DISTANCE: 220,\n  PIPE_1_DELAY: 1\n};\n\nclass Level {\n  constructor(dimensions) {\n    this.dimensions = dimensions;\n\n    const firstPipeDistance = \n      this.dimensions.width + \n      (CONSTANTS.PIPE_1_DELAY * 60 * CONSTANTS.PIPE_SPEED);\n\n    this.pipes = [\n      this.randomPipe(firstPipeDistance),\n      this.randomPipe(firstPipeDistance + CONSTANTS.PIPE_DISTANCE),\n      this.randomPipe(firstPipeDistance + (CONSTANTS.PIPE_DISTANCE * 2)),\n    ];\n  }\n\n  randomPipe(x) {\n    const possibleGapHeight = this.dimensions.height - (2 * CONSTANTS.MARGIN) - CONSTANTS.GAP_SIZE;\n    const topOfGap = (Math.random() * possibleGapHeight) + CONSTANTS.MARGIN;\n    const pipe = {\n      topPipe: {\n        left: x,\n        right: CONSTANTS.PIPE_THICKNESS + x,\n        top: 0,\n        bottom: topOfGap\n      },\n      bottomPipe: {\n        left: x,\n        right: CONSTANTS.PIPE_THICKNESS + x,\n        top: topOfGap + CONSTANTS.GAP_SIZE,\n        bottom: this.dimensions.height\n      },\n      passed: false\n    };\n    return pipe\n  }\n\n  animate(ctx) {\n    this.drawBackground(ctx);\n    this.movePipes();\n    this.drawPipes(ctx);\n  }\n\n  drawBackground(ctx) {\n    // ctx.fillStyle = \"skyblue\";\n    // ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);\n    const gradientSun = ctx.createRadialGradient(250, 150, 30, 250, 150, 90);\n    gradientSun.addColorStop(0, \"rgb(255, 218, 184)\");\n    gradientSun.addColorStop(.75, \"rgb(255, 245, 168)\");\n    gradientSun.addColorStop(1, \"rgb(255, 253, 184)\");\n\n    const gradientSky = ctx.createRadialGradient(250, 150, 130, 250, 150, 500);\n    gradientSky.addColorStop(0, \"rgb(143, 181, 235)\");\n    gradientSky.addColorStop(.5, \"rgb(21, 21, 214)\");\n    gradientSky.addColorStop(1, \"rgb(0, 0, 128)\");\n\n    ctx.fillStyle = gradientSky;\n    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);\n\n    ctx.beginPath();\n    ctx.arc(250, 150, 100, 0, 2 * Math.PI);\n    ctx.strokeStyle = \"rgb(245, 222, 159)\";\n    ctx.lineWidth = 9;\n    ctx.stroke();\n    ctx.fillStyle = gradientSun;\n    ctx.fill();\n  }\n\n  passedPipe(bird, callback) {\n    this.eachPipe((pipe) => {\n      if (pipe.topPipe.right < bird.left) {\n        if (!pipe.passed) {\n          pipe.passed = true;\n          callback();\n        }\n      }\n    });\n  }\n\n  movePipes() {\n    this.eachPipe(function(pipe) {\n      pipe.topPipe.left -= CONSTANTS.PIPE_SPEED;\n      pipe.topPipe.right -= CONSTANTS.PIPE_SPEED;\n      pipe.bottomPipe.left -= CONSTANTS.PIPE_SPEED;\n      pipe.bottomPipe.right -= CONSTANTS.PIPE_SPEED;\n    });\n\n    if (this.pipes[0].topPipe.right <= 0) {\n      this.pipes.shift();\n      const newX = this.pipes[1].topPipe.left + CONSTANTS.PIPE_DISTANCE;\n      this.pipes.push(this.randomPipe(newX));\n    }\n  }\n\n  drawPipes(ctx) {\n    this.eachPipe(function(pipe) {\n      ctx.fillStyle = \"white\";\n      ctx.fillRect(\n        pipe.topPipe.left,\n        pipe.topPipe.top,\n        CONSTANTS.PIPE_THICKNESS,\n        pipe.topPipe.bottom - pipe.topPipe.top\n      );\n      ctx.fillRect(\n        pipe.bottomPipe.left,\n        pipe.bottomPipe.top,\n        CONSTANTS.PIPE_THICKNESS,\n        pipe.bottomPipe.bottom - pipe.bottomPipe.top\n      );\n    });\n  }\n  \n  eachPipe(callback) {\n    this.pipes.forEach(callback.bind(this));\n  }\n\n  collidesWith(bird) {\n    const _overlap = (rect1, rect2) => {\n      if (rect1.left > rect2.right || rect1.right < rect2.left) {\n        return false;\n      }\n      if (rect1.top > rect2.bottom || rect1.bottom < rect2.top) {\n        return false;\n      }\n      return true;\n    };\n    let collision = false;\n    this.eachPipe((pipe) => {\n      if ( _overlap(pipe.topPipe, bird) || _overlap(pipe.bottomPipe, bird)) {\n        collision = true;\n      }\n    });\n    return collision;\n  }\n}\n\n//# sourceURL=webpack:///./src/level.js?");

/***/ })

/******/ });