import 'nouislider';

const slider = () => {
  var snapSlider = document.getElementById('range');

  noUiSlider.create(snapSlider, {
      start: [0, 500],
      snap: true,
      connect: true,
      range: {
          'min': 0,
          '10%': 50,
          '20%': 100,
          '30%': 150,
          '40%': 500,
          '50%': 800,
          'max': 1000
      }
  });
}

export { slider };

// var snapValues = [
//     document.getElementById('slider-snap-value-lower'),
//     document.getElementById('slider-snap-value-upper')
// ];

// snapSlider.noUiSlider.on('update', function (values, handle) {
//     snapValues[handle].innerHTML = values[handle];
// });
