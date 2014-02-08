$(document).ready(function() {

  var startingNo = 1;
  var $node = "";
  for(varCount=0;varCount<=startingNo;varCount++){
    var displayCount = varCount+1;
    $node += '<p><label for="var'+displayCount+'">Answer: </label><input type="text" name="var'+displayCount+'" id="var'+displayCount+'"><span class="removeVar">Remove Answer</span></p>';
  }
  $('.answers').prepend($node);

  $('form').on('click', '.removeVar', function(){
    $(this).parent().remove();
  });

  $('#addVar').on('click', function(){
    varCount++;
    $node = '<p><label for="var'+varCount+'">Answer : </label><input type="text" name="var'+varCount+'" id="var'+varCount+'"><span class="removeVar">Remove Answer</span></p>';
    $(this).parent().before($node);
  });

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () {
      window.location = "/";
    });
  });

  $('#create_survey').submit(function(event){
    event.preventDefault();
    var data = $(this).serialize();
    var title = $("#survey").val()
    console.log(title)
    $.post('/create', data, function(request){
      $('#create_survey').each(function(){
        this.reset();
      })
      if(title !== undefined) $('#survey_name').html('Add another question to survey named: ' + title)
    })
  })
});


