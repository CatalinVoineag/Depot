
function removeFlashMessage() {
  var flashContainer = $('#flashContainer');
  flashContainer.remove();
}

function showTab(tab, event) {
  if(tab != undefined){
    // finds the parent of the tab (the <a> element) which should be an <li> element
    var li = tab.offsetParent;
    if(li) {
      $('#'+li.id+' a[href="'+tab.hash+'"]').tab('show');
    }
  }
}