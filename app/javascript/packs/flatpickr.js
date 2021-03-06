import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin.js"

const form = document.getElementById('new_booking');
const dates = JSON.parse(form.dataset['dates']);

flatpickr(".datepicker", {
  "plugins": [new rangePlugin({ input: "#booking_end_date"})],
  dateFormat: "Y-m-d",
  disable: dates,
  minDate: 'today'
})
