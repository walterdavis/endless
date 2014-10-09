document.on('change', '.version-navigator', function(evt, elm){
  var original_id = elm.id.split('_').last();
  var version = $F(elm);
  new Ajax.Updater(elm.up(), '/assets/' + original_id + '/versions/' + version, 
    {method: 'get', 
    insertion: 'after',
    onComplete: function(){
      elm.up().next().highlight();
      elm.up().remove();
    }
  });
});