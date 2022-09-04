let items = [];
$(document).ready(function(){
    window.addEventListener("message",function(event){
        let item = event.data;
        switch(item.action){
            case "show":
               init(item);
            break;

            case "hide":
                $("#container").fadeOut(500);;
            break;

            case "updateMoney":
                updateMoney(item.money);
            break;
        }
    });

    document.onkeyup = function(data){
        if (data.which == 27){
            $.post("http://hawaii-departamento/close");
        }
    };
});

function init(item){
    $(".item").removeClass("item-focus");
    $(".opcao").removeClass("opcao-focus");
    $(".secao").hide();
    $(".comprar").hide();
    $(".item-escolhido").hide();
    $("#container").fadeIn(500);
    updateMoney(item.money);
    items = item.items;
}

function updateMoney(money) {
    let wallet = new Intl.NumberFormat('de-DE').format(money);
    $(".wallet").html("<i class='fas fa-wallet' style='color: white;'></i> &nbsp; $ "+wallet+",00");
}


function changeCategory(category){
    $(".item-escolhido").fadeOut(500);
    $(".comprar").fadeOut(500);
    $(".secao-titulo").html(category);
    $(".items").html("");
    for (let i = 0; i < items[category].length; i++) {
        let imagem = items[category][i].img;
        let nome = items[category][i].name;
        let descricao = items[category][i].descricao;
        let item = items[category][i].item;
        let preco = new Intl.NumberFormat('de-DE').format(items[category][i].compra);
        $(".items").append(
            `<button class='item' onclick='selectItem("`+imagem+`","`+nome+`","`+descricao+`","`+item+`","`+preco+`")'>`+
                `<img src='images/`+imagem+`.png' alt=''>`+nome+
            `</button>`
        );
    }
    $(".item").click(function (e) {
        $(".item").removeClass("item-focus");
        $(this).addClass("item-focus");
    })
    $(".secao").fadeIn(500);
    document.querySelector(".items").scrollTo({top: 0, behavior: 'smooth'});
}


function selectItem(imagem,nome,descricao,item,preco) {
    $(".comprar").fadeIn(500);
    $(".item-escolhido").fadeIn(500);
    $(".item-escolhido-titulo").html(nome);
    $(".item-image").html("<img src='images/"+imagem+".png' alt=''>");
    $(".descricao").html("<span>"+descricao+"</span>");
    $(".price").html("$ "+preco+",00");
    $(".comprar").attr("data-action", item);
}


function buyItem(){
    let item = $(".comprar").attr("data-action");
    $.post("http://hawaii-departamento/comprar", JSON.stringify({item: item}));
}

$(".opcao").click(function (e) {
    $(".opcao").removeClass("opcao-focus");
    $(this).addClass("opcao-focus");
})
