function buy(item, price, name) {
  fetch(`https://${GetParentResourceName()}/buy`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({
      item: item,
      price: price,
      name: name
    })
  })
}

window.addEventListener('keyup', (key) => {
  if (key.key === "Escape") {
    $(".departamento").css("display", "none")
    $(".ammunation").css("display", "none")
    fetch(`https://${GetParentResourceName()}/close`, {
      method: 'POST',
      body: JSON.stringify({})
    })
  }
})
window.addEventListener('message', (event) => {

  let nome = ''
  let sobrenome = ''
  let carteira = ''
  let banco = ''

  const data = event.data
  if (data.departamento == true) {
    $(".departamento").css("display", "flex")
    $(".ammunation").css("display", "none")
    if (event.data.nome != undefined) {
      nome = event.data.nome
    }
    if (event.data.sobrenome != undefined) {
      sobrenome = event.data.sobrenome
    }
    if (event.data.carteira != undefined) {
      carteira = event.data.carteira
    }
    if (event.data.banco != undefined) {
      banco = event.data.banco
    }
    document.querySelector(".nameclose h1").innerText = nome + " " + sobrenome
    document.querySelector(".bank p span").innerText = banco
    document.querySelector(".wallet p span").innerText = carteira
  }
  if (data.ammunation == true) {
    $(".departamento").css("display", "none")
    $(".ammunation").css("display", "flex")
    if (event.data.nome != undefined) {
      nome = event.data.nome
    }
    if (event.data.sobrenome != undefined) {
      sobrenome = event.data.sobrenome
    }
    if (event.data.carteira != undefined) {
      carteira = event.data.carteira
    }
    if (event.data.banco != undefined) {
      banco = event.data.banco
    }
    document.querySelector("#name").innerText = nome + " " + sobrenome
    document.querySelector("#bank").innerText = banco
    document.querySelector("#wallet").innerText = carteira
  }

})