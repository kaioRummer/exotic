const pt_BR = {
   team: "Time",
   firstTeam: "Azul",
   secondTeam: "Rosa",
   join: "entrar",
   title: "paintball",
   logo: "https://media.discordapp.net/attachments/864649540987781120/902739257519661056/cj7Rkua.png",
   timer: "tempo",
   scoreboard: "scoreboard",
   startTime: "tempo para iniciar:",
   cancel: "pressione <span class='cancel'>&nbsp;f7&nbsp;</span> para sair",
   win: "Venceu a rodada",
   draw: "Empate",
   exitScoreboard: "Pressione <span class='cancel'>&nbsp;F7&nbsp;</span> para sair",
   winner: "Vencedor:",
   weaponStore: "Loja de Armamentos",
   formatMoney: (money, onlyNumbers) => {
      let dollar = "$ ";
      if (onlyNumbers) dollar = "";
      return dollar+(new Intl.NumberFormat('de-DE').format(money));
   }
}


const lang = pt_BR;
