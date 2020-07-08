class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();

  }

  // bindEvents() {
  //   $('.square').on('click', function() {

  //   })
// }
  // https://github.com/appacademy/2020-05-11-NYC-Lecture-Notes
  makeMove($square,i,j) {
    $square.css("background-color", "white");
    this.game.playMove([i, j]);

  }

  setupBoard() {
    this.$el.append("<ul></ul>")
    let $ul = $('ul')

    for (let i = 0; i <= 2; i++) {
      for (let j = 0; j <= 2; j++) {
        let $square = $('<li>').addClass('square').attr("grid-pos", [i,j]);
        $ul.append($square);

        $square.on("click", (e) => {
          this.makeMove($(e.currentTarget),i,j);
          })
      }
    }
  } 
    
}
  // $ul.append('<li class="square"></li>')



module.exports = View;

// const $square = $("<li>").addClass("square").attr("data-pos", [rowIdx, colIdx]);
// $square.on("mouseenter", (e) => {
//   const $square = $(e.currentTarget);
//   $square.css("background-color", window._randomColorString());
// });
