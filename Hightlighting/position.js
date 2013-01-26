var color="";

function pasteHtmlAtCaret(id) {
    var sel, range; var txt = new String(id);
  
    if (window.getSelection) {
        // IE9 and non-IE
        sel = window.getSelection();
        if (sel.getRangeAt && sel.rangeCount) {
            range = sel.getRangeAt(0);
            range.deleteContents();
            
            // Range.createContextualFragment() would be useful here but is
            // non-standard and not supported in all browsers (IE9, for one)
            var el = document.createElement("div");
            el.innerHTML = "<a class='note' id="+txt+" onClick='reply_click(this.id)' href=\'http://google.com\' '>C</a>";
            alert(el.innerHTML);
            var frag = document.createDocumentFragment(), node, lastNode;
            while ( (node = el.firstChild) ) {
                lastNode = frag.appendChild(node);
            }
            range.insertNode(frag);
            
            
            // Preserve the selection
            if (lastNode) {
                range = range.cloneRange();
                range.setStartAfter(lastNode);
                range.collapse(true);
                sel.removeAllRanges();
                sel.addRange(range);
                
                
            }
        }
    } else if (document.selection && document.selection.type != "Control") {
        // IE < 9
        document.selection.createRange().pasteHTML(html);
    }
}
range.insertNode(newDiv);

function redirect() {
	alert("save us!");
	window.location="http://google.com";
    
}

function reply_click(clicked_id)
{
    color=clicked_id;
    //alert(color);
    return color;
}

function returnValue() {
    var value=color;
    alert(value);
    return value;
    
    
}