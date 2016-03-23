# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $btnSets = $('#responsive')
  $btnLinks = $btnSets.find('a')
  $btnLinks.click (e) ->
    e.preventDefault()
    $(this).siblings('a.active').removeClass 'active'
    $(this).addClass 'active'
    index = $(this).index()
    $('div.user-menu>div.user-menu-content').removeClass 'active'
    $('div.user-menu>div.user-menu-content').eq(index).addClass 'active'
    return
  return
$(document).ready ->
  $('[rel=\'tooltip\']').tooltip()
  $('.view').hover (->
    $(this).find('.caption').slideDown 250
    #.fadeIn(250)
    return
  ), ->
    $(this).find('.caption').slideUp 250
    #.fadeOut(205)
    return
  return

