class @FileUploads
  constructor: (@$el, @$new_upload, @klass_name) ->
    @$new_el = @$el.children().last()
    @$new_el.remove()
    @change_appearence_of_new()
    @$new_upload.click (evt) =>
      @$el.prepend @$new_el

    @add_handlers()


  add_new_file: () ->
    $("#redirect_url").val location.href
    true


  delete_element: (evt) ->
    $button = $(evt.currentTarget)
    $li = $button.closest '.file_upload'
    index = $li.find('input[type=text]').attr('id').match(/\d+/)[0]

    $input = $("##{@klass_name}_file_uploads_attributes_#{index}_id")
    id = $input.val()

    $.ajax({
      type: 'delete',
      url: '/file_uploads/destroy/' + id,
      statusCode: {200: () ->
        $li.remove()
        $input.remove()
      }
    })

  add_handlers: ->
    @$el.on 'click', '#add_attachment', (evt) =>
      @add_new_file()

    @$el.on "click",".delete", (evt) =>
      if confirm 'Are you sure?'
        @delete_element(evt)
      else
        console.log 'not deleting'
      evt.preventDefault()

    @$el.on 'click', '.edit', (evt) =>
      console.log 'Editing.'
      evt.preventDefault()

  change_appearence_of_new: ->
    $header = @$new_el.find '.upload_header'
    $header.empty()
    $header.append(
      $("<h2>").text 'New Attachment'
      )
    $button = @$new_el.find '.btn.primary'
    $header.append $button




$ ->
  new FileUploads $("#files"), $("#new_upload"),'news_item'
