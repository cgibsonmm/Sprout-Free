document.addEventListener 'turbolinks:load', ->
  trixEditor = $('[data-behavior="autocomplete"]')

  $.ajax(
    url: '/users.json',
    success: (data) ->
      setData(data)
  )

  setData = (data) ->
    tribute = new Tribute({
      values: data
      })

    tribute.attach $(trixEditor);
