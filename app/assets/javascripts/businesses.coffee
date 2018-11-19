# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  fetchBusinesses: (name) =>
    return $.ajax
      url: "/business/search/q=#{name}"
      type: 'GET'
      success: (response) ->
        return response
      error: (error) ->
        return error

  $('#business_name_search').keyup (event) ->
    name = event.currentTarget.value
    fetchBusinesses(name).then (data) ->
      console.log(data)



