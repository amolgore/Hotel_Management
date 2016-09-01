homeReady = ->

#Added the bootstrap datepicker and set the date format and restrict
#Start_date and End_date selection

 $('.datepicker').datepicker
   format: 'yyyy-mm-dd',
   autoclose: true,
   startDate: '0d',
   endDate: '+6m'


$(document).ready(homeReady)
