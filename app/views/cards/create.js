
$("#card_english").val("");
$("#card_chinese").val("");
$("#card_pinyin").val("");
$("#card_breakdown_html").val("");
$("#card_notes").val("");
updateCharacterFormPreview()
$("#cards_container").html("<%= escape_javascript render(:partial => 'cards/cards', :locals => {:cards => @cards}) %>")
setAccordion();

