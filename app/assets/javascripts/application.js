// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require bootstrap
//= require_tree .



$(function() {
  $("#card_chinese").on("blur", function() {
    fetchCharacter();
    fetchPinyin();
  });

  $("#fetch_character_button").on("click", function() {
    fetchCharacter();
  });

  $("#card_breakdown_html").on("input", function() {
    updateCharacterFormPreview()
  });

  $("body").on("click","#show_answer_button_container", function(e) {
    $(e.target).hide();
    $("#answer_buttons").show();
    $(".card_hidden_info").show();
  });

  $("body").on("click", "#edit_guessing_card_info", function() {
    $("#guess_card_info").toggle();
    $("#guessing_card_edit_form").toggle();
  });

  setAccordion();

});

function setAccordion() {
  $(".accordion" ).accordion({
    collapsible: true,
    active: false
  });  
}


function fetchPinyin() {
  if ($("#card_pinyin").val() === "") {
    $.ajax({
      url: "/cards/hanzi_to_piyin",
      method: "get",
      data: {
        hanzi: $("#card_chinese").val()
      }
    }).
    done(function(data) {
      $("#card_pinyin").val(data.pinyin);
    });
  }
}


function updateCharacterFormPreview() {
  $("#character_form_preview").html($("#card_breakdown_html").val())  
}

function fetchCharacter() {
  var search_query_value = $("#card_chinese").val();
  if (search_query_value === "" || $("#card_breakdown_html").val() !== "") {
    console.log("No search");
  } else {
    $("#character_form_preview").html("Searching....");
    $.ajax({
      url: "/cards/fetch_character_breakdown",
      method: "POST",
      data: {
        search_query: search_query_value
      }
    })
    .done(function(data) {
      console.log("Completed request");
      console.log(data);
      $("#card_breakdown_html").val(data["tree"]);
      updateCharacterFormPreview()
    });

  }  
}