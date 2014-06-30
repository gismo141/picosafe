<!--<img src="./themes/fredgui/images/wiki.jpg" align="left" style="margin:20px"><br><br><h4>Wiki</h4><p>Your personal wiki
<br><br>
<br>-->
<!-- gehort zu tabview -->
<div id="tabs">
    <ul>
        <li><a href="#tabs-1">[TABTEXT]</a></li>
        <li><a href="#tabs-2">Help</a></li>
    </ul>
<!-- ende gehort zu tabview -->

<!-- erstes tab -->
<div id="tabs-1">
[MESSAGE]
<div class="wiki">
<table width="100%"><tr><td align="right"><a href="index.php?module=wiki&action=edit&name=[NAME]">edit</a>
&nbsp;<a href="index.php?module=wiki&action=rename&name=[NAME]">rename</a>
&nbsp;<a href="index.php?module=wiki&action=delete&name=[NAME]">delete</a>
&nbsp;<a href="index.php?module=wiki&action=alle">show all</a>
</td></tr></table>
[WIKIINDEX]
[TAB1]
</div>
[TAB1NEXT]
</div>
<div id="tabs-2">
<h1>Help</h1>
With the internal wiki can simply notes, job descriptions, documentation, links, lists, etc are shared.

<h1>Text</h1>
No special commands for standard text.
<h1>Heading</h1>
<pre>=First level=</pre>
<pre>==Second level==</pre>
<pre>===Third level===</pre>
<h1>Lists</h1>
<pre>* Point</pre>
<pre># Numbers</pre>
<h1>Links</h1>
<h3>Internal wiki page</h2>
<pre>[[NewPage]]</pre>

or with an own description:
<pre>[[NewPage| My Description]]</pre>

<h3>External link</h2>
With text as link:
<pre>[http://www.google.de Internet search engine]</pre>
as link number:
<pre>[http://www.google.de]</pre>

<h1>Create new page</h1>
Create an internal link an click on it. Now you where ask, if you 
will create the new page.
</div>


<!-- tab view schließen -->
</div>

