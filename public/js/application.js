$(document).ready(function() {
  $(document).on('submit', '#note', function(e) {
    e.preventDefault();

    $.ajax({
      type: 'post',
      url: '/create',
      data: $(this).serialize()
    }).done(function(response) {
      // console.log(response);
      // console.log("Yo");
      var link = "<a href='/read/" + response.note.id + "'>" +
                    response.note.title + '</a>';
      $('#nav').append(link);
    // }).fail(function(data) {
    //   console.log(data);
    //   $('#note').append('<p>Oops! Something went wrong');
    });
  });
});
