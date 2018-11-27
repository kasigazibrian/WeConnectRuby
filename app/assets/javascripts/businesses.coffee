# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $("h4#total-results").hide()
  $("span#business-links").hide()

  $('#business_name_search').keyup (event) ->
    name = event.currentTarget.value
    category = if $(".form-control.category-input").val() is null then "" else $(".form-control.category-input").val()
    location = if $(".form-control.location-input").val() is null then "" else $(".form-control.location-input").val()
    fetchBusinesses(name, location, category).then (data) ->
      setText(data)
      resetView(name)

  fetchBusinesses = (name, location, category) ->
    return $.ajax
      url: "/business/search_results?q=#{name}&location=#{location}&category=#{category}"
      type: 'GET'
      success: (response) ->
        return response
      error: (error) ->
        return error

  resetView = (name) ->
    if name is ""
      $("h4#total-results").hide()
      $("span#business-links").hide()

  setText = (data) ->
    if data.length is 0
      $("h4.font-italic.text-light").text("No search results found")
      $("h4#total-results").show()
      $("span#business-links").hide()
    else
      totalResults = data.length
      $("h4.font-italic.text-light").text("#{totalResults} search #{checkLength(data)} found")
      $("h4#total-results").show()
      links = $.map(data, (business, index) =>
        $("<a></a>").attr("href", "/businesses/#{business.id}").text("#{business.business_name}").addClass("business-link")
      )
      setLinks(links)

  setLinks = (links) ->
    if $(".business-link").length is 0
      $("span#business-links").append(links)
      $("span#business-links").show()
      links.pop()
    else
      $(".business-link").remove()
      $("span#business-links").append(links)
      $("span#business-links").show()
      links.pop()

  checkLength = (data) ->
    text = if data.length > 1 then "results" else "result"
    return text

  $(".confirmDeleteBusiness").click (event) ->
    event.preventDefault()
    businessId = $(event.currentTarget).attr('id')
    console.log(businessId)
    deleteBusiness(businessId)
    .then (data) ->
      console.log(data)
    .fail (error) ->
      if error.status is 401
        toastr.error('You are not authorised to perform this action')

  deleteBusiness = (businessId) ->
    return $.ajax
      url: "/businesses/#{businessId}"
      type: 'DELETE'
      done: (response) ->
        return response
      fail: (error) ->
        return error





