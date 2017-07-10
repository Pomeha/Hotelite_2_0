var path = "images/gallery/";
var descriptions = ["Скуталу", "Пинки", "Хрень", "Бабка и каджит",
    "Домик в Балморе", "Приговор", "Меган Лиза", "Спасибо Тодду",
    "Гаррус", "Поздравления", "Фантомная рука", "I've never asked for this",
    "Кошмар", "Правда жизни", "Габен"];
var a = ".jpg";
var i, j, k = 1;
var article, section, imgDiv, img, div;
var current_pic;

function gallery() {
    section = document.getElementById("gallery");
    for (i = 0; i < 4; i++) {
        article = document.createElement("article");
        article.className = "image-row";
        for (j = 0; j < 4; j++) {
            imgDiv = document.createElement("div");
            imgDiv.className = "img-text-gallery";
            img = document.createElement("img");
            img.src = path + k + a;
            img.id = (k - 1) + "-img";
            div = document.createElement("div");
            div.innerHTML = "<p id=" + (k - 1) + "-desc>" + descriptions[k - 1] + "</p>";
            img.onclick = function () {
                expand(this)
            };
            imgDiv.appendChild(img);
            imgDiv.appendChild(div);
            article.appendChild(imgDiv);
            k++;
            if (k > 15)
                break;
        }
        section.appendChild(article);
        if (k > 15)
            break;
    }
    $(function () {
        $(document).on("click", '#left', function () {
            $("#" + current_pic + "-div").remove();
            current_pic--;
            if (current_pic < 0)
                current_pic = descriptions.length-1;
            $("#" + current_pic + "-img").click();
        });
        $(document).on("click", '#right', function () {
            $("#" + current_pic + "-div").remove();
            current_pic++;
            if (current_pic > descriptions.length-1)
                current_pic = 0;
            $("#" + current_pic + "-img").click();
        });
    });
}

function expand(that) {
    current_pic = parseInt((that.id).slice(0, -4));
    var src = that.src;
    var div = document.createElement("div");
    div.id = current_pic + "-div";
    div.style.zIndex = "999";
    div.style.position = "fixed";
    div.style.width = "100%";
    div.style.height = "100%";
    div.style.left = "0";
    div.style.top = "0";
    div.style.justifyContent = "center";
    div.style.alignItems = "center";
    div.style.display = "flex";
    div.style.backgroundColor = "rgba(169,169,169,0.9)";
    div.style.flexFlow = "row wrap";
    var img = document.createElement("img");
    img.src = src;
    var aspect = window.innerWidth / window.innerHeight * 1.0;
    if (aspect > img.width / img.height * 1.0) {
        img.style.height = "80%";
    }
    else {
        img.style.width = "80%";
    }
    img.style.display = "block";
    img.style.borderRadius = "20px";
    img.style.backgroundColor = "white";
    div.appendChild(img);
    var b1 = document.createElement("button");
    b1.id = "left";
    b1.style.marginRight = "2%";
    b1.style.backgroundColor = "white";
    b1.style.pageBreakBefore = "always";
    b1.style.borderRadius = "20px";
    b1.innerHTML = "<";
    div.appendChild(b1);
    var p = document.createElement("p");
    p.style.textAlign = "center";
    p.innerHTML = document.getElementById(current_pic + "-desc").innerHTML;
    p.style.backgroundColor = "white";
    p.style.borderRadius = "20px";
    p.style.lineHeight = "2";
    p.style.paddingLeft = "10px";
    p.style.paddingRight = "10px";
    p.style.width="50%";
    div.appendChild(p);
    var b1 = document.createElement("button");
    b1.id = "right";
    b1.style.marginLeft = "2%";
    b1.style.backgroundColor = "white";
    b1.style.borderRadius = "20px";
    b1.innerHTML = ">";
    div.appendChild(b1);
    div.onclick = function (event) {
        if (event.target == this) this.remove();
    };
    document.body.appendChild(div);
}

