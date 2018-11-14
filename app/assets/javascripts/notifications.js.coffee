class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    @setup() if @notifications.length > 0

  setup: ->
    $("[data-behavior='notifications']").on "click", @handleClick
    $.ajax(
      url: "/notifications.json",
      dataType: "JSON",
      method: "GET",
      success: @handleSuccess
    )

  handleClick: (e) =>
    $.ajax(
      url: '/notifications/mark_as_read',
      method: 'POST',
      dataType: "JSON",
      success: ->
        $("[data-behavior='unread-count']").text('0')
    )

  handleSuccess: (data) =>
    if (data.length) != 0
      items = $.map data, (notification) ->
        "<a class='dropdown-item' href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable.type}</a>"
    else
      items = "<a class='dropdown-item' href='#'>No new notifications</a>"

    $("[data-behavior='unread-count']").text(length)
    $("[data-behavior='notification-items']").html(items)
jQuery ->
  new Notifications
