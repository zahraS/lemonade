$ ->
  $("#calender-field").datepicker
    dateFormat: "yy-mm-dd"
    onSelect: (dateText, inst) ->
      window.location.href = window.location.href.replace(/(\d+-\d+-\d+)/, dateText); 
