# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#class Home.UI
#  sampleFlash: =>
#    $(".view-registered-businesses").click(event) ->
#      console.log("clicked")

$(document).on 'turbolinks:load', ->
  $('#upload-image-btn').hide()
  $("#avatar").change (event) ->
    if $(event.currentTarget).val()
      $('#upload-image-btn').show()
    else
      $('#upload-image-btn').hide()


