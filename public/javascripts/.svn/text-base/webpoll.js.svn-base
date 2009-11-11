function showHideChoices (thisIndex, currentNode){
    if(thisIndex == 2){
        currentNode.parentNode.parentNode.getElementsByTagName("textarea")[0].value = "yes|no"
    }
    var choiceDiv = currentNode.parentNode.parentNode.getElementsByTagName("div")[0];
    if(thisIndex > 2){
        if(choiceDiv.style.display == "none"){
            Effect.BlindDown(choiceDiv);
        }
        return false;
    }else{
        Effect.BlindUp(choiceDiv);
        return false;
    }
}


function nextPosition(selector){
    //given a string that selects elements with numerical values
    //returns the largest value plus 1
    //used by setPositionValues
    var a = [];
    $$(selector).each(function(elm){
        a.push(parseInt(elm.value));
    })
    var highest = isNaN(a.max()) ? -1 : a.max();
    return highest + 1;
}

function setPositionValues(selector){
  //assign a value to the position attribute as soon as a new group or 
  //question is created
    $$(selector).each(
        function(elm){
            if(elm.value == '')
                elm.value = nextPosition(selector);
        }
    )
}

function setGroupPositionValues(){
    setPositionValues('.group_position')
}

function setQuestionPositionValues(){
    setPositionValues('.question_position')
}

function insert_fields_and_assign_positions(a,b,c){
    //wrap insert_fields so as to tack on functions calls to give usnassigned 
    //position values a value
    insert_fields(a,b,c)
    setGroupPositionValues()
    setQuestionPositionValues()
}