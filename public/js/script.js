function isNumber(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
    if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
        return false;

    return true;
}    
function getSelectedOption( elem ) {
    return elem.options[elem.selectedIndex].value;
  }
  
  function setSelectedOption( elem, value ) {
    for (let i = 0; i < elem.options.length; i++) {
      elem.options[i].selected = value === elem.options[i].value;
    }
  }
  
  function swapByOptionValue( selector1, selector2 ) {
    var elem1 = document.querySelector(selector1),
        elem2 = document.querySelector(selector2),
        selectedOption1 = getSelectedOption( elem1 ),
        selectedOption2 = getSelectedOption( elem2 );
    setSelectedOption( elem1, selectedOption2 );
    setSelectedOption( elem2, selectedOption1 );
  }