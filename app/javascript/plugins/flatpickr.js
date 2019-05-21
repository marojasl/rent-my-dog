import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin.js"

flatpickr(".datepicker", {
  "plugins": [new rangePlugin({ input: "#booking_start_date"})]
  // "disable": {
  //   dateFormat: "Y-m-d",
  //   disable: [
  //       {
  //           from: @start_date,
  //           to: @end_date
  //       }]
  // }
})
