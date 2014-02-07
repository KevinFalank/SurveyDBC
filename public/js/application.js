$(document).ready(function() {
  var startingNo = 3;
  var $node = "";
  for(varCount=0;varCount<=startingNo;varCount++){
    var displayCount = varCount+1;
    $node += '<p><label for="var'+displayCount+'">Answer: </label><input type="text" name="var'+displayCount+'" id="var'+displayCount+'"><span class="removeVar">Remove Answer</span></p>';
  }
  $('.answers').prepend($node);

  $('form').on('click', '.removeVar', function(){
    $(this).parent().remove();
    //varCount--;
  });

  $('#addVar').on('click', function(){
    //new node
    varCount++;
    $node = '<p><label for="var'+varCount+'">Answer : </label><input type="text" name="var'+varCount+'" id="var'+varCount+'"><span class="removeVar">Remove Answer</span></p>';
    $(this).parent().before($node);
  });

  $('#create_survey').submit(function(event){
    event.preventDefault();
    var data = $(this).serialize();
    $.post('/create', data, function(request){
      $('#create_survey').each(function(){
        this.reset();
      })
      $('#survey_name').html('Add another question to survey')
    })
  })
});

// Need to clear out the form when 'submitted' and also get rid of the survey name
// Accept multiple questions
// Reset button?
