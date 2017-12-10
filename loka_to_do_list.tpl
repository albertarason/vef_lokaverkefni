<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8" />
        <title>To-do listi</title>
		<link rel="stylesheet" href="static/css/loka_to_do_list.css">
    	<h5><a href="/logout">Skrá út</a></h5>
    </head>
    <body>
		<h1>Tasks</h1>
		<p id="addTask"><h5>Skrifaðu inní boxið að neðan til að bæta við listann</h5></p>
		<input type='text' id='inputTask'/>
		<input type='button' onclick='addText()' value='Add To List'/>
		<script type="text/javascript">
			function addText(){
			    var input = document.getElementById('inputTask').value;
			    var node=document.createElement("p");
			    var textnode=document.createTextNode(input);
			    node.appendChild(textnode);
			    document.getElementById('addTask').appendChild(node);
			    
			    var removeTask = document.createElement('input');
			    removeTask.setAttribute('type', 'button');
			    removeTask.setAttribute("value", "Remove");
			    removeTask.setAttribute("id", "removeButton");
			    removeTask.addEventListener('click', function(e) {
			        node.parentNode.removeChild(node);
			    }, false);
			    node.appendChild(removeTask);
			    
			    
			}
		</script>
    </body>
</html>