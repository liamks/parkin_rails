class @FileUploads
  constructor: (@$el, @$new_upload, @klass_name) ->
    @$new_el = @$el.children().last()
    @$new_el.remove()
    @change_appearence_of_new()
    @$new_upload.click (evt) =>
      @$el.prepend @$new_el

    @add_handlers()
    @$currently_editing_li = null
    @make_sortable()


  handle_sort_finish: (event,ui) =>
    for li, i in @$el.children()
      $(li).find('[name$="order_num]"]').val(i)

  make_sortable: () ->
    options =
      containment: 'parent'
      handle: '.move'
      stop: @handle_sort_finish

    @$el.sortable(options)

  add_new_file: () ->
    $("#redirect_url").val location.href
    true
    

  edit_attachement: (evt) ->
    @$new_el.hide()
    @$currently_editing_li = $(evt.currentTarget).closest('li')
    @toggle_edit_mode()
    @$currently_editing_li.on 'click', '.save', (evt) =>
        @handle_save_edit()
        evt.preventDefault()

  handle_save_edit: (evt) ->
    @$currently_editing_li.off 'click', '.save'

    $hidden_details = @$currently_editing_li.find('.hidden_details')
    name = $hidden_details.find('input').first().val()
    caption = $hidden_details.find('input').last().val()

    @$currently_editing_li.find('.name').html("<strong>Name:</strong> #{name}")
    @$currently_editing_li.find('.caption').html("<strong>Caption:</strong> #{caption}")

    @toggle_edit_mode()

    @$currently_editing_li = null

  toggle_edit_mode: ->
    @$currently_editing_li.find('.hidden_details').toggle()
    @$currently_editing_li.find('.span1').toggle()
    @$currently_editing_li.find('.span5').toggle()
    @$currently_editing_li.find('.save').toggle()
    @$currently_editing_li.find('.delete').toggle()
    @$currently_editing_li.find('.edit').toggle()

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
      @edit_attachement(evt)
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
  $files = $("#files")
  item = $("#obj").val()
  if $files?
    new FileUploads $("#files"), $("#new_upload"),item
