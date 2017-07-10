/**
 * Created by Веталь on 09.06.2017.
 */
var isFio = null;
var isPhone = null;
var isEmail = null;
var isMessage = null;
var isDate = null;

function setting() {
    var fio = document.getElementsByName("fio")[0];
    var phone = document.getElementsByName("phone")[0];
    var email = document.getElementsByName("email")[0];
    var message = document.getElementsByName("message")[0];
    var date = document.getElementsByName("date")[0];
    message.addEventListener("focusout", check_message);
    fio.addEventListener("focusout", check_fio);
    phone.addEventListener("focusout", check_phone);
    email.addEventListener("focusout", check_email);
    date.addEventListener("focusout", check_date);
    var b = document.getElementById("submit");
    b.disabled = true;
    b.style.backgroundColor = "grey";
    $(function () {
        $("#fio")
            .tooltip({
                position: {
                    my: "left",
                    at: "right+2%",
                    collision: "none"
                }
            });
        $("#phone")
            .tooltip({
                position: {
                    my: "left",
                    at: "right+2%",
                    collision: "none"
                }
            });
        $("#email")
            .tooltip({
                position: {
                    my: "left",
                    at: "right+2%",
                    collision: "none"
                }
            });
        $("#message")
            .tooltip({
                position: {
                    my: "left",
                    at: "right+2%",
                    collision: "none"
                }
            });
        $('#dialog')
            .dialog({ autoOpen: false,modal: true,resizable: false,draggable: false });
    });

}

function dialog(){
     $('#dialog').dialog('open');
}

function dialog_hide() {
    $('#dialog').dialog('close');
}
function submit_form() {
    $('#submit_button').click();
}
function reset_all() {
    check_email("reset");
    check_phone("reset");
    check_fio("reset");
    check_message("reset");
    check_date("reset");
}

function check_all() {
    if (isFio && isMessage && isPhone && isEmail && isDate) {
        var b = document.getElementById("submit");
        b.disabled = false;
        b.style.backgroundColor = "white";
    }
    else {
        var b = document.getElementById("submit");
        b.disabled = true;
        b.style.backgroundColor = "grey";
    }

}



function check_date(tag) {
    var date = document.getElementsByName("date");
    if (tag === "reset") {
        date[0].style.backgroundColor = "white";
        var c = document.getElementById("date_error");
        isDate = null;
        if (c !== null)
            date[0].parentNode.removeChild(c);
        check_all();
        return true;
    }
    if (date[0].value == "") {
        if (isDate || isDate == null) {
            date[0].style.backgroundColor = "#ffacac";
            var a = document.createElement("pre");
            a.innerHTML = "  Нет даты!";
            a.style.color = "indianred";
            a.style.display = "inline";
            a.id = "date_error";
            date[0].parentNode.appendChild(a);
            isDate = false;
            check_all();
        }
        return false;
    }
    date[0].style.backgroundColor = "lightgreen";
    var c = document.getElementById("date_error");
    isDate = true;
    if (c)
        date[0].parentNode.removeChild(c);
    check_all();
    return true;
}

function check_fio(tag) {
    var fio = document.getElementsByName("fio");
    if (tag === "reset") {
        fio[0].style.backgroundColor = "white";
        var c = document.getElementById("fio_error");
        isFio = null;
        if (c !== null)
            fio[0].parentNode.removeChild(c);
        check_all();
        return true;
    }
    var str = fio[0].value.trim();
    var k = 0;
    for (var i = 0; i < str.length; i++) {
        if (!(str[i].match(/[a-zа-я]/i))) {
            if (str[i] === ' ') {
                k++;
            }
            else {
                if (isFio || isFio == null) {
                    fio[0].style.backgroundColor = "#ffacac";
                    var a = document.createElement("pre");
                    a.innerHTML = "  Недопустимые символы!";
                    a.style.color = "indianred";
                    a.style.display = "inline";
                    a.id = "fio_error";
                    fio[0].parentNode.appendChild(a);
                    isFio = false;
                    check_all();
                }
                return false;
            }
        }
    }
    if (k !== 2) {
        if (isFio || isFio == null) {
            fio[0].style.backgroundColor = "#ffacac";
            var a = document.createElement("pre");
            a.innerHTML = "  Неверный формат ФИО!";
            a.style.color = "indianred";
            a.style.display = "inline";
            a.id = "fio_error";
            fio[0].parentNode.appendChild(a);
            isFio = false;
            check_all();
        }
        return false;
    }
    fio[0].style.backgroundColor = "lightgreen";
    var c = document.getElementById("fio_error");
    isFio = true;
    if (c)
        fio[0].parentNode.removeChild(c);
    check_all();
    return true;
}

function check_email(tag) {
    var email = document.getElementsByName("email");
    if (tag === "reset") {
        email[0].style.backgroundColor = "white";
        var c = document.getElementById("email_error");
        isEmail = null;
        if (c !== null)
            email[0].parentNode.removeChild(c);
        check_all();
        return true;
    }
    var str = email[0].value.trim();
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!(re.test(str))) {
        if (isEmail || isEmail == null) {
            email[0].style.backgroundColor = "#ffacac";
            var a = document.createElement("pre");
            a.innerHTML = "  Неверный email!";
            a.style.color = "indianred";
            a.style.display = "inline";
            a.id = "email_error";
            email[0].parentNode.appendChild(a);
            isEmail = false;
            check_all();
        }
        return false;
    }


    email[0].style.backgroundColor = "lightgreen";
    var c = document.getElementById("email_error");
    isEmail = true;
    if (c)
        email[0].parentNode.removeChild(c);
    check_all();
    return true;


}

function check_phone(tag) {
    var phone = document.getElementsByName("phone");
    if (tag === "reset") {
        phone[0].style.backgroundColor = "white";
        var c = document.getElementById("phone_error");
        isPhone = true;
        if (c !== null)
            phone[0].parentNode.removeChild(c);
        check_all();
        return true;
    }
    var str = phone[0].value.trim();
    if (str[0] !== '+' || (str[1] !== '7' && str[1] !== '3')) {
        if (isPhone || isPhone == null) {
            phone[0].style.backgroundColor = "#ffacac";
            var a = document.createElement("pre");
            a.innerHTML = "  Номер начинается с +7 либо +3!";
            a.style.color = "indianred";
            a.style.display = "inline";
            a.id = "phone_error";
            phone[0].parentNode.appendChild(a);
            isPhone = false;
            check_all();
        }
        return false;
    }
    for (var i = 2; i < str.length; i++) {
        if (!(str[i].match(/[0-9]/))) {
            if (isPhone || isPhone == null) {
                phone[0].style.backgroundColor = "#ffacac";
                var a = document.createElement("pre");
                a.innerHTML = "  Номер состоит из + и цифр!";
                a.style.color = "indianred";
                a.style.display = "inline";
                a.id = "phone_error";
                phone[0].parentNode.appendChild(a);
                isPhone = false;
                check_all();
            }
            return false;
        }
    }
    phone[0].style.backgroundColor = "lightgreen";
    var c = document.getElementById("phone_error");
    isPhone = true;
    if (c)
        phone[0].parentNode.removeChild(c);
    check_all();
    return true;
}

function check_message(tag) {
    var message = document.getElementsByName("message");
    if (tag === "reset") {
        message[0].style.backgroundColor = "white";
        var c = document.getElementById("phone_error");
        isMessage = null;
        if (c !== null)
            message[0].parentNode.removeChild(c);
        check_all();
        return true;
    }
    if (message[0].value === "") {
        if (isMessage || isMessage == null) {
            message[0].style.backgroundColor = "#ffacac";
            var a = document.createElement("pre");
            a.innerHTML = "  Пусто!";
            a.style.color = "indianred";
            a.style.display = "inline";
            a.id = "message_error";
            message[0].parentNode.appendChild(a);
            isMessage = false;
            check_all();
        }
        return false;
    }

    message[0].style.backgroundColor = "lightgreen";
    var c = document.getElementById("message_error");
    isMessage = true;
    check_all();
    if (c)
        message[0].parentNode.removeChild(c);
    return true;
}

function check_test() {
    var checkboxes = document.getElementsByClassName("check-test");
    var k = 0;
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked)
            k++;
    }
    if (k > 1) {
        alert("Не более одной отметки!");
        checkboxes[0].focus();
        return false;
    }
    return true;
}



