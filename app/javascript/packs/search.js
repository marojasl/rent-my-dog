const searchForm = document.getElementById("search-form");

const setValuesForFieldTags = (upperValue, lowerValue) => {
  const upperTag = document.getElementById('upper_price');
  const lowerTag = document.getElementById('lower_price');
  upperTag.value = upperValue;
  lowerTag.value = lowerValue;
};

searchForm.addEventListener('submit', (event) => {
  const sliderUpperHandle = document.querySelector(".noUi-handle.noUi-handle-upper");
  const upperValue = sliderUpperHandle.getAttribute('aria-valuenow');
  const sliderLowerHandle = document.querySelector(".noUi-handle.noUi-handle-lower");
  const lowerValue = sliderLowerHandle.getAttribute('aria-valuenow');

  setValuesForFieldTags(upperValue, lowerValue);

  // event.preventDefault();
});
