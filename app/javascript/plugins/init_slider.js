import 'nouislider';
import 'nouislider/distribute/nouislider.css';

const slider = () => {
  var snapSlider = document.getElementById('range');

  noUiSlider.create(snapSlider, {
      start: [0, 1000],
      snap: true,
      connect: true,
      tooltips: true,
      range: {
          'min': 0,
          '10%': 100,
          '20%': 200,
          '30%': 300,
          '40%': 400,
          '50%': 500,
          '60%': 600,
          '70%': 700,
          '80%': 800,
          '90%': 900,
          'max': 1000
      }
  });

  // var snapValues = [
  //   document.getElementById('slider-snap-value-lower'),
  //   document.getElementById('slider-snap-value-upper')
  // ];

  // snapSlider.noUiSlider.on('update', function (values, handle) {
  //     snapValues[handle].innerHTML = values[handle];
  // });

}

export { slider };


