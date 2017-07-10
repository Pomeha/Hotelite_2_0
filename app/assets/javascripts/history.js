/**
 * Created by Веталь on 14.06.2017.
 */
var names=["contact.html","history.html","index.html","interests.html","me.html","photo.html","study.html","test.html"];

function get_history(){
    for(var i=0;i<names.length;i++){
        var element1=document.getElementById(names[i]+"-current");
        var count1=localStorage.getItem(names[i]);
        var element2=document.getElementById(names[i]+"-alltime");
        var count2=getCookie(names[i]);
        if(count1==null){
            count1=0;
        }
        element1.innerHTML=count1;
        if(count2==null)
            count2=0;
        element2.innerHTML=count2;
    }
}


function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length == 2) return parts.pop().split(";").shift();
    return null;
}