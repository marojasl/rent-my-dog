import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
// import 'nouislider/distribute/nouislider.css';

// import { slider } from '../plugins/init_slider';
import { initMapbox } from '../plugins/init_mapbox';

// slider();
initMapbox();
