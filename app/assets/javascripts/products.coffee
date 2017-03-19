App.products = App.cable.subscriptions.create "ProductsChanne;", 
    connected: ->
    disconnected: ->
    recieved: (data) ->
        $(".pages .content").html(data.html)

