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
     @$new_el.hide
     @$currently_editing_li = $(evt.currentTarget).closest('li')
     $hidden_details = @$currently_editing_li.find('.hidden_details')
     $hidden_details.remove()
     $edit_el = $("<li>").addClass('file_upload')
     $row = $("<div>").addClass('row')
    
     $edit_el.append $row
     $save_button = $("<a>").attr({'href':'#','id':'save_changes'}).addClass('btn success').text('Save Changes')
     $row.append $("<div>").addClass('upload_header').append($save_button)
     $span = $("<div>").addClass('span4').css('padding-left','4px')
     $row.append $span
     
     $span.append $hidden_details

     @$el.prepend $edit_el

     $hidden_details.show()

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

  handle_save_edit: (evt) ->
    $edit_li = @$el.find('li').first()
    $hidden_details = $edit_li.find('.hidden_details')
    name = $hidden_details.find('input').first().val()
    caption = $hidden_details.find('input').last().val()

    @$currently_editing_li.find('.name').html("<strong>Name:</strong> #{name}")
    @$currently_editing_li.find('.caption').html("<strong>Name:</strong> #{caption}")
    @$currently_editing_li.append $hidden_details
    $hidden_details.hide()
    $hidden_details.find('input').first().attr('value',name)
    $hidden_details.find('input').last().attr('value',caption)
    $edit_li.remove()

    @$currently_editing_li = null

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

    @$el.on 'click', '#save_changes', (evt) =>
      @handle_save_edit()
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
