$(document).ready(function() {
  var startingNo = 3;
  var $node = "";
  for(varCount=0;varCount<=startingNo;varCount++){
    var displayCount = varCount+1;
    $node += '<p><label for="var'+displayCount+'">Answer '+displayCount+': </label><input type="text" name="var'+displayCount+'" id="var'+displayCount+'"><span class="removeVar">Remove Answer</span></p>';
  }
  $('.answers').prepend($node);

  $('form').on('click', '.removeVar', function(){
    $(this).parent().remove();
    //varCount--;
  });

  $('#addVar').on('click', function(){
    //new node
    varCount++;
    $node = '<p><label for="var'+varCount+'">Answer '+varCount+': </label><input type="text" name="var'+varCount+'" id="var'+varCount+'"><span class="removeVar">Remove Answer</span></p>';
    $(this).parent().before($node);
  });

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

});


