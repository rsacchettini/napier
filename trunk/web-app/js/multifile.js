/* This file is a modification of StickBlog's code. Please refer:
http://the-stickman.com/web-development/javascript/upload-multiple-files-with-a-single-file-element/
for StickBlog's original source code */

/** file name: script.js **/

function addElement(){

    //retrieve <div> with id 'fileList'
    var target_list = document.getElementById( 'fileList')
    var childs = target_list.getElementsByTagName("div") //number of <div> under 'fileList'
    var count = childs.length + 1

    //retrive file input element
    var element = document.getElementById( 'picture' )

    //create new row <div>
    var new_row = document.createElement( 'div' );
    new_row.id = "div" + count

    //create new file input and copy 'myfile''s value
  //var new_row_file_input = document.createElement( 'input' );
	var new_row_file_input = document.getElementsByName("picture_0")[0].cloneNode(true);

	if(document.getElementById('picture_' + count) == null)
	{
   		new_row_file_input.name = 'picture_' + count;
   		new_row_file_input.id = 'picture_' + count ;
	}
	else
	{
		var i = 1;
		var found = false;
		while(!found)
		{
			if(document.getElementById('picture_' + i) == null)
			{
				new_row_file_input.name = 'picture_' + i;
   				new_row_file_input.id = 'picture_' + i ;
				found = true;
			}
			i++;
		}

	}
   //new_row_file_input.value = element.value;
   //make it invisible
    new_row_file_input.style.opacity = 0
	new_row_file_input.style.position = 'absolute';
	new_row_file_input.style.left = '-1000px';


   //create new input box and display uploaded file name
    var new_row_input = document.createElement( 'span' );
    new_row_input.innerHTML = element.value;

    //create a button which handles removing file from file list
    var new_row_button = document.createElement( 'span' );
	new_row_button.style.cursor = "pointer";
	new_row_button.style.fontWeight = "bold";
	new_row.className= "buttons";
	new_row_button.innerHTML = '[Delete]';
    new_row_button.onclick = function (){

      target_list.removeChild( this.parentNode );
      }
    // Add button

    //append child elements
	 new_row.appendChild( new_row_button );
	new_row.appendChild(new_row_input);
    new_row.appendChild(new_row_file_input);
	//new_row_file_input.type = 'file';
	document.getElementsByName("picture_0")[0].value = null;

	//append new row to file list
    target_list.appendChild (new_row)
}

var submitFiles = function()
{
	//deleting the picture_0 input of the form because it is only used to add the files in the list and contains
	//no files.
	document.getElementsByName("picture_0")[0].parentNode.removeChild(document.getElementsByName("picture_0")[0]);
	document.getElementById("fileCount").setAttribute("value", document.getElementById( 'fileList').getElementsByTagName("div").length);
}

