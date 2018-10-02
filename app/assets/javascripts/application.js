// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.


//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

// Google Places autocomplete (Search Bar)
var autocomplete;

function initAutocomplete() {
	// Create the autocomplete object
	autocomplete = new google.maps.places.Autocomplete(
	    /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
	    {types: ['geocode']});
	autocomplete.addListener('place_changed',  function() {
	// var place = autocomplete.getPlace();
  });
}

function myFunction() {
 var activeSystemClass = $('.list-group-item.active');
    //something is entered in search form
    $('#myInput').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-list-search tbody');
        var tableRowsClass = $('.table-list-search tbody tr');
        $('.search-sf').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
            }
            else
            {
                $('.search-sf').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
        }
    });
}

// Search with filters

$(document).ready(function(){
  $(window).load(function(){
    
  var search_input = document.getElementById("search")
  
  if (search_input){
    search_input.addEventListener("keyup", function(event){
      autocomplete(event)
    })
  }
  
  window.globalXHR = new XMLHttpRequest()
  
  function autocomplete(event) {
    //retrieve input
    var input = event.target
  
    //get datalist element for results
    var list = document.getElementById("list")
  
    //set minimum num of chars
    var min_chars = 0
  
    if (input.value.length > min_chars) {
      //abort pending requests
      //ensure that our XHR object is not working on any pending request before we tell it to do new work
      window.globalXHR.abort()
  
      // Callback to be applied once the XMLHttpRequest() internal state has been changed after
      // sending a request
      // We check to see whether the request is done and that the return status of the request is ok
      window.globalXHR.onreadystatechange = function(){
        if (this.readyState == 4 && this.status == 200) {
          
          console.log(this.responseText)
  
          //convert json response to an object
          var response = JSON.parse(this.responseText)
  
          //clear previous results
          list.innerHTML = ""
  
          response.forEach(function(element){
            //create new option element
            var option = document.createElement("option")
            option.value = element
  
            //append option to list
            list.appendChild(option)
          })
        }
      }
  
      // authentication is required whenever our client wishes to make a request to our server
      // this is to prevent csrf attacks on our servers
      // more info can be found at the link below
      // https://www.checkmarx.com/2016/01/22/ultimate-guide-understanding-preventing-csrf/
      var auth_token = document.querySelector("[name='csrf-token']").content
      window.globalXHR.open("POST", "/search?query=" + input.value, true)
      //allow js to make request to rails server
      window.globalXHR.setRequestHeader("X-CSRF-TOKEN", auth_token)
      window.globalXHR.send()
      }
    }
  })
})


// otrosssss

// function myMap() {
//     var mapOptions = {
//         center: new google.maps.LatLng(51.5, -0.12),
//         zoom: 10,
//         mapTypeId: 'roadmap'
//     }
// var map = new google.maps.Map(document.getElementById("map"), mapOptions);
// }


// // Boooking validations
// $(document).on("turbolinks:load", function(){
//     var calendarButton = document.getElementById('booking-button')
//     calendarButton.addEventListener("click", function(evt){
//       var startdate = new Date($('#start_date').val().replace(/\-/g,'/')),
//           enddate = new Date($('#end_date').val().replace(/\-/g,'/')),
//           today = new Date();
        
//       if (startdate === "" || enddate === "") {
//         addBookingErrorNotice(evt, "Please pick dates to continue")
//       } else if (startdate < today ) {
//         addBookingErrorNotice(evt, "Check-in cannot be in the past")
//       } else if (enddate < startdate) {
//         addBookingErrorNotice(evt, "Please pick a valid date range")
//       }
//     })
    
//     $('.bottom-left').click(function(e){
//       var result = confirm("Are you sure you want to delete this image?")
//       if (result) {
//         $.ajax({
//           url: `/listings/${params.id}/delete_photo`,
//           method: "POST",
//           data: $(this).index,
//           success: function(){
//             $(this).parent().remove()
//           }
//         })
//       }
//     })

// })

// function addBookingErrorNotice(evt, message) {
//   $('#booking-dates-error-notice').html(message)
//   evt.preventDefault();
// }



