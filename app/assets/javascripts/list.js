function list() {
    var article=document.getElementById("list");
    var inner="<ul>";
    for (var i = 0; i < list.arguments.length; i+=2) {
        inner+="<li><a href=#"+list.arguments[i]+">" + list.arguments[i+1]+"</a></li>";
    }
    inner+="</ul>";
    article.innerHTML=inner;
}