$(document).ready(function() {
  $('#note').on('submit', function(e) {
    e.preventDefault();

    $.ajax({
      type: 'post',
      url: '/create',
      data: $(this).serialize()
    }).done(function(response) {
      window.abcd = response;
      console.log(response);
      console.log("Yo");
      $('#nav').append(response.note.title);
    // }).fail(function(data) {
    //   console.log(data);
    //   $('#note').append('<p>Oops! Something went wrong');
    });
  });
});
