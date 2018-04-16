<%-- 
    Document   : blog
    Created on : 17.okt.2017, 11:08:49
    Author     : evakristine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog</title>


        <style>
            div#textEditor{
                margin: 1px;
                width: 750px;
                height: 300px;
            }
            div#theRibbon{
                border-bottom: none;
                padding: 10px;
                background-color: firebrick;
                color: white;
                width: 732px;
            }
            input#titlebar {
                width: 729px;
                padding:10px;
            }
            iframe#richTextArea{
                height: 100%;
                width: 100%;
            }
            div#theRibbon > button {
                color: white;
                border: none;
                outline: none;
                background-color: transparent;
                cursor: pointer;
            }
            input[type="color"]{
                color: transparent;
                border: none;
                padding: 1px;     
            } 
            input[type="submit"]{
                color: white;
                border: none;
                outline: none;
                background-color: grey;
                cursor: pointer;
            }

        </style>
        <script>
            window.addEventListener("load", function () {
                var editor = richTextArea.document;
                editor.designMode = "on";

                boldButton.addEventListener("click", function () {
                    editor.execCommand("Bold", false, null);
                }, false);

                italicButton.addEventListener("click", function () {
                    editor.execCommand("Italic", false, null);
                }, false);

                underlineButton.addEventListener("click", function () {
                    editor.execCommand("Underline", false, null);
                }, false);

                strikeButton.addEventListener("click", function () {
                    editor.execCommand("Strikethrough", false, null);
                }, false);

                orderedListButton.addEventListener("click", function () {
                    editor.execCommand("InsertOrderedList", false, "newOL" + Math.round(Math.random() * 1000));
                }, false);

                unorderedListButton.addEventListener("click", function () {
                    editor.execCommand("InsertUnorderedList", false, "newOL" + Math.round(Math.random() * 1000));
                }, false);

                fontColorButton.addEventListener("change", function (event) {
                    editor.execCommand("ForeColor", false, event.target.value);
                }, false);

                highlightButton.addEventListener("change", function (event) {
                    editor.execCommand("BackColor", false, event.target.value);
                }, false);

                fontChanger.addEventListener("change", function (event) {
                    editor.execCommand("FontName", false, event.target.value);
                }, false);

                fontSizeChanger.addEventListener("change", function (event) {
                    editor.execCommand("FontSize", false, event.target.value);
                }, false);

                linkButton.addEventListener("click", function () {
                    var url = prompt("Enter a URL", "http://");
                    editor.execCommand("CreateLink", false, url);
                }, false);

                unLinkButton.addEventListener("click", function () {
                    editor.execCommand("UnLink", false, null);
                }, false);

                undoButton.addEventListener("click", function () {
                    editor.execCommand("undo", false, null);
                }, false);

                redoButton.addEventListener("click", function () {
                    editor.execCommand("redo", false, null);
                }, false);

                titleInput.addEventListener("click", function () {
                    editor.execCommand("clear", false, null);
                }, false);
            }, false);
        </script>
    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>


        <body>

            <h1>Blog</h1>
            <form method="post" action="${pageContext.request.contextPath}/BlogListView" >
            <input type="submit" value="Your posts" name="Yourposts" />

        </form>
        <p>New blog post:</p>


        <div id="textEditor">   
            <div id="theRibbon">
                <button id="boldButton" title="Bold"><b>B</b></button>
                <button id="italicButton" title="Italic"><em>I</em></button>
                <button id="underlineButton" title="Underline"><u>U</u></button>
                <button id="strikeButton" title="Strikethrough"><s>abc</s></button>
                <button id="orderedListButton" title="Numbered list">(i)</button>
                <button id="unorderedListButton" title="Bulleted list">&bull;</button>
                <input type="color" id="fontColorButton" title="Change font color" >
                <input type="color" id="highlightButton" title="Highlight Text" >
                <select id="fontChanger">
                    <option value="Times New Roman" > Times New Roman</option>
                    <option value="Consolas" > Consolas</option>
                    <option value="Tahoma" > Tahoma</option>
                    <option value="Monospace" > Monospace</option>
                    <option value="Cursive" > Cursive</option>
                    <option value="Sans-Serif" > Sans-Serif</option>
                    <option value="Calibri" > Calibri</option>

                </select>
                <select id="fontSizeChanger">
                    <script>
                        for (var i = 5; i < 30; i++) {
                            document.write("<option value= '" + i + "'>" + i + "</option>");
                        }
                    </script>
                </select>
                <button id="linkButton" title="Create Link">Link</button>
                <button id="unLinkButton" title="Remove Link">UnLink</button>
                <button id="undoButton" title="Undo the previous action">&larr;</button>
                <button id="redoButton" title="Redo">&rarr;</button>
            </div>

            <form  action=BlogPost name="myform" id="myform" method= "post"> 


                <input type="text" id="titlebar" name="title" value="Title">

                <textarea style= "display: none;" name= "blog-post"  id="blog-post" cols="100" rows="20"></textarea>
                <iframe name="richTextArea" id="richTextArea" frameborder="2"></iframe>



                <input name="upload" type="button" value="Upload" onClick="Upload();"/>

            </form>                   


            <script>

                function Upload() {
                    var theForm = document.getElementById("myform");
                    theForm.elements["blog-post"].value = window.frames["richTextArea"].document.body.innerHTML;
                    theForm.submit();
                }
                ;
            </script>


    </body>

</html>