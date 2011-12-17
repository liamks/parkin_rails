# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


class ImagesEditor
  constructor: (@selector) ->
    @ul = $(@selector)

    f1 = $.proxy this.selectStop, this
    options =
      handle: '.handle'
      stop: f1
      containment: 'parent'
    @ul.sortable(options);
    
    $("#new_image").append($("#new_image_remove").html())
    $("#new_image_remove").remove()
    this.addHandlers()


  selectStop: () ->
    for image,index in $(@selector + " li")
      $(image).children('input[name*=order_num]').first().val(index)

  addHandlers: () ->
    that = this
    $(@selector + ' li').click ->
      $(this).addClass("ui-selected").siblings().removeClass("ui-selected")
      $('.edit_image_wrapper').show();

      forms = $(this).children('input')
      $('input[name=name]').val(forms.first().val())
      $('input[name=caption]').val(forms.last().val())
    
    $("#img_update").click (evt) ->
      
      forms = $("li.ui-selected").children('input')
      name = $('input[name=name]').val()
      caption = $('input[name=caption]').val()
      forms.first().val(name)
      forms.last().val(caption)
      $('.edit_image_wrapper').fadeOut();
      evt.preventDefault()

    $('#remove_image').click (evt) ->
      if window.confirm('Are you sure?')
        img = $("li.ui-selected")
        id = img.attr('data-id')
    
        fun= () =>
          img.remove();
          that.selectStop()
          $('.edit_image_wrapper').fadeOut();

        $.ajax({
          type: 'delete',
          url: '/file_uploads/destroy/' + id,
          statusCode: {200: fun}
        })

      evt.preventDefault();





    
###
todo:

1. when user selects image
  a. text fields appear in .edit_image
  b. as text field changes, so should content
  in hidden text fields
  c. delete button appears in .edit_image
2. when user deletes item, it should be remove from list
3. creating a new item should work



###




$ ->
  ie = new ImagesEditor 'ul#sortable_images'
