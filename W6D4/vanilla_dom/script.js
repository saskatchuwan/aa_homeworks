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

  const handleAddSubmit = (e) => {
    e.preventDefault();

    //get text input
    const input = document.querySelector('.favorite-input');
    const inputValue = input.value;

    //create new li element to append & set value
    const newLi = document.createElement('li');
    newLi.textContent = inputValue;

    //get sf places element by id
    const sfPlaces = document.getElementById('sf-places');
    sfPlaces.appendChild(newLi);
  }

  const submitButton = document.querySelector(".favorite-submit");
  submitButton.addEventListener("click", handleAddSubmit);


  // adding new photos

  


});
