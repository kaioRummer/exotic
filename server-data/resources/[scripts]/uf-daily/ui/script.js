var randomProbability   = []
var resName             = "uf-daily"
var config              
var blockEsc            = false 
var actualMeta,nearMeta,hours

const generateRandomArray = (gifts)=>{
  randomProbability = []
  for(let i in gifts){
    let originalNumber = i*10
    for(let j = 0; j < originalNumber; j++){
      randomProbability.push(originalNumber)
    }
  }
}

document.addEventListener('keydown', (ev) => {
  if (ev.key === 'Escape' && !blockEsc) {
    $.post(`https://${resName}/close`,JSON.stringify({erro: 'false'}))
  }
});

$.post(`https://${resName}/reqConfig`)

const getRandomGift   = () =>{
  const probability = randomProbability[Math.floor(Math.random() * randomProbability.length)]
   const randomGift  = Math.floor(Math.random() * objectToArray(config.gifts[''+nearMeta][probability/10].gifts).length)
  $("#receber").css("opacity", "0.7").css("pointer-events", "none")
  $.post(`https://${resName}/playEffect`,JSON.stringify({type: 'click'}))
  $.post(`https://${resName}/reedemGift`,JSON.stringify({probability: probability/10,  itemIndex: randomGift+1, lastHour: nearMeta}),function(data){
    $("#receber").css("opacity", `${(data.success) ? '0.0': '1.0' } `).css("pointer-events",  `auto`)
    if(data.success){
      blockEsc = true
      if(config.actions.reedemGift.baloons.enable) $("#baloes").show()
      $("#show").hide()
      initialFunction(hours,{lastHour: nearMeta})
      $("#oldReward").addClass('rewardAnim')
      setupLastItem(data.item.idname,data.item.amount)
      setTimeout(() => {
        $("#baloes").hide()
        $("#oldReward").removeClass('rewardAnim')
        blockEsc = false
      }, 4000);
    }
  })
}

const setupLastItem = (item,amount) =>{
  $("#itemRecebido").text(`${item.toUpperCase()} x ${amount}`)
  $("#oldReward").fadeIn(500)
  $('#itemRecebido').show()
}
$('.divPremio, .divProximo').on( "mouseenter",function () {
  $.post(`https://${resName}/playEffect`,JSON.stringify({type: 'navigation'}))
})

$('.divProximo').on('click',function () {
  if($("#cadeado").is(':visible')){
   $.post(`https://${resName}/playEffect`,JSON.stringify({type: 'error'}))
  }
})

window.addEventListener('message', function (ev) {
  switch (ev.data.case) {
    case 'setup':
      resName = ev.data.resName
      config  = ev.data.config 
      if(ev.data.lastItem){
        setupLastItem(ev.data.lastItem.idname,ev.data.lastItem.amount)  
      } else {
        $('#itemRecebido').hide()
        $("#oldReward").css('opacity', '0.5')
      }
      $("#listaChances").html('')
      let stringsSetted = 0
      let arrData       = []
      for(let hours of Object.keys(config.gifts)){
        for(let probability of Object.keys(config.gifts[hours])){
          if(config.listOnePorcentage && probability > config.listOnePorcentage) continue
          if (stringsSetted > 8) break
          for(let key of config.gifts[hours][probability].gifts){
            if(arrData.indexOf(key.name) == -1) {
            stringsSetted += 1
            arrData.push(key.name)
            $("#listaChances").append(`
                <div class="item">• ${key.name.toUpperCase()} </div>
                `)
            }
          }
        };
      };

        $("#listaChances").append(`
        <div class="item" style="opacity:0.7;font-weight: 200;">E MUITO MAIS!</div>
        `)
      
    break; 
    case 'open':
      try {
        if(!config) throw new Error("Configuração não carregada. Tente novamente")
        console.log(ev.data?.hours,ev.data?.lastItem)
        hours = ev.data.hours
        initialFunction(hours,ev.data.lastItem)
        $('body').show();
      } catch (error) {
        console.warn(`Reportar ao lupin. ${error}`)
        $.post(`https://${resName}/close`,JSON.stringify({erro: error}))
      }
    break;
  
    case 'close':
      $('body').hide();
    break;
  }
});


const findPreviousNext = (array, currentValue) => {
  if(array.length === 0){
    return { next: null, prev: null }
  }
  const closestIndex = array.findIndex(v => v >= currentValue)
  const closestNext = array[closestIndex] || null
  const closestPrev = array[closestIndex - 1] || null
  const lastValue = array[array.length - 1] || null
  const next = closestIndex === -1 ? null : closestNext
  const prev = closestIndex === -1 ? lastValue : closestPrev
  return { next, prev }
}

const objectToArray = (objectList) => {
  const c = []
  for(let key of Object.keys(objectList)){
    c.push(Number(key))
  }
  return c
}


const initialFunction = (hours,lastItem)=>{
    $('#actualHours').text((hours).toFixed(1));
    $('#barProguess span').css("width",`${4.16*hours}%`);
    let arr           = objectToArray(config.gifts)
    let arrIndex      = findPreviousNext(arr,hours)

    actualMeta = arrIndex.prev || 0;
    nearMeta   = arrIndex.next || arr[arr.length-1]
    if( lastItem && lastItem.lastHour < Math.trunc(hours) && nearMeta > Math.trunc(hours) &&  arr.findIndex(v => v == Math.trunc(hours)) ){
      nearMeta = arrIndex.prev
    }

    if(!lastItem && actualMeta > 0){
      nearMeta = actualMeta
      actualMeta = 0
    }
    if((lastItem && Number(lastItem.lastHour) >= nearMeta)){
      nearMeta = "VOCÊ ATINGIU O LIMITE"
    }

    generateRandomArray(config.gifts[''+nearMeta])
    $(".nextcheck").text(`${nearMeta} ${(typeof nearMeta == 'number') ? 'h' : ''}`)
    if (typeof nearMeta == 'number' && nearMeta > 0 && hours >= nearMeta && config.gifts[''+nearMeta] ){
      $("#cadeado").hide(),
      $("#receber").show()
    }else{
      $("#cadeado").show(),
      $("#receber").hide()
    }
}
