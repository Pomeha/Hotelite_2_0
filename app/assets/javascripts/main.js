/**
 * Created by Веталь on 13.06.2017.
 */
function time() {
    var name = window.location.pathname.split('/').pop();
    var pagecount=localStorage.getItem(name);
    if(pagecount==null)
        pagecount=1;
    else
        pagecount=parseInt(pagecount)+1;
    localStorage.setItem(name,pagecount);

    var cookie=getCookie(name);
    if(cookie==null)
        cookie=0;
    console.log(cookie);
    cookie=parseInt(cookie)+1;
    document.cookie=name+"="+cookie+"; path=/";
    setInterval(count,500);
}

function count() {
    var today=new Date();
    var h=checkTime(today.getHours());
    var m=checkTime(today.getMinutes());
    var s=checkTime(today.getSeconds());
    document.getElementById("clock").innerHTML=h+":"+m+":"+s;
}

function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}

function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length == 2) return parts.pop().split(";").shift();
    return null;
}