document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  const favoriteForm = document.getElementsByClassName("favorite-submit");
  favoriteForm.addEventListener("submit", event => {
    event.preventDefault();
    const favoriteInputEl = document.getElementsByClassName("favorite-input");
    const favorite = favoriteInputEl.value;
    favoriteInputEl.value = "";
    const ul = document.getElementsByClassName("sf-places");
    const li = document.createElement("li");
    li.textContent = favorite;
    ul.appendChild(li);
  });


  // adding new photos

  const dumbAss = document.getElementsByClassName('photo-show-button');
  dumbAss.addEventListener('submit', e => {
    event.preventDefault();
    const stupidShit = document.getElementsByClassName("photo-form-container");
    if (stupidShit.className === 'photo-form-container hidden') {
      stupidShit.className = 'photo-form-container';
    } else {
      stupidShit.className = "photo-form-container hidden";
    }
  })

// I probably could get the above to work if fucking appAcademy only
// had a clue about how to teach. Ugh!


});
