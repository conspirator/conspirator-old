shuffle = (a) ->
  for i in [a.length-1..1]
    j = Math.floor Math.random() * (i + 1)
    [a[i], a[j]] = [a[j], a[i]]
  a

class AllDeals
  constructor: (@template) ->
    @getData()


  getData: ->
    $.ajax(
      url: "//api.groupon.com/v2/deals.json?division_id=chicago&amp;client_id=295b6f65e00df9c7afba168a25f701ffb71609d2"
      context: @
      dataType: 'jsonp'
      success: @onResponse
    )


  onResponse: (data) ->
    html = ""

    for deal in shuffle(data.deals)[0..63]
      present = @presenter deal
      # console.log deal, present
      html += Mustache.to_html @template, present

    $('#wrapper').html html
    @bindEvents()


  presenter: (data) ->
    imageUrl: data.grid4ImageUrl
    multiOption: if data.options.length > 1 then true else false
    price: data.options[0].price.formattedAmount.split('.')[0]
    value: data.options[0].value.formattedAmount.split('.')[0]
    discount: "#{data.options[0].discountPercent}%"
    savings: data.options[0].discount.formattedAmount.split('.')[0]
    location: data.redemptionLocation
    merchant: data.merchant.name


  bindEvents: ->
    $('a[href=#]').bind 'click', (e) ->
      e.preventDefault()

    $('.p13n').bind 'click', (e) ->
      $(@).toggleClass 'active'

    $('.p13n').bind 'mouseenter', (e) ->
      heart = $(@)
      if heart.hasClass 'active'
        heart.addClass 'close'

    $('.p13n').bind 'mouseleave', (e) ->
      $(@).removeClass 'close'

$ ->
  template = $('#template').html()
  new AllDeals template