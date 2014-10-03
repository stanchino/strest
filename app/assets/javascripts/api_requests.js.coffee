$ ->
  host = window.document.location.host
  requests = []
  responses = []

  dispatcher = new WebSocketRails("#{host}/websocket")
  channel = dispatcher.subscribe("requests")

  channel.bind "exec", (req) ->
    jqXHR = $.ajax
      url: req.uri
      method: req.method
      dataType: "json"
    jqXHR.always () ->
      if arguments[1] == "success"
        response = arguments[2]
      else
        response = arguments[0]
      dispatcher.trigger "api_request.respond",
        request_id: req.id
        status: "#{response.status} #{response.statusText}"
        headers: response.getAllResponseHeaders()
        responseText: response.responseText
        responseJSON: response.responseJSON || {}

  channel.bind "update", (req) ->
    $request_element = $(".request[data-request-id=#{req.request_id}]")
    next_request_id = $request_element.next('.request').data?('request-id')
    dispatcher.trigger "api_request.initialize", {id: next_request_id}

  $(document).on 'click', 'a[data-trigger-suite]', (event) ->
    event.preventDefault()
    $target = $(event.currentTarget)
    suite_selector = $target.data?('trigger-suite')
    $suite = $(suite_selector)
    if $suite.length > 0
      requests = $suite.find('.request')
      request_id = $(requests[0]).data?('requestId')
      dispatcher.trigger "api_request.initialize", {id: request_id}
