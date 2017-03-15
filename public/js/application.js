$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#addNewForm').click(function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    
    $.ajax({
      url: url,
      method: 'get'
    }).done(function(res){
      $('.book-index').append(res);
    })
  })
  
  $('.book-index').on('submit','#newBookForm',function(event){
    event.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.ajax({
      url: url,
      method: 'post',
      data: data
    }).done(function(res){
      $('.book-index ul').append(res)
    })
    
  })
});
