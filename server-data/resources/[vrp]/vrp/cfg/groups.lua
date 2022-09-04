local cfg = {}

cfg.groups = {
	["Dono"] = {
		"dono.permissao",
		"admin.permissao",
		"mod.permissao",
		"suporte.permissao",
		"wl.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"wall.permissao",
		"prop.permissao",
		"imune.permissao",
		"player.noclip"
			
    },
	    ["OffDono"] = {
    	"offdono.permissao",
    	"sem.permissao"


    },
	["Admin"] = {
		"admin.permissao",
		"mod.permissao",
		"suporte.permissao",
		"wl.permissao",
		"polpar.permissao",
		"wall.permissao",
		"prop.permissao",
		"imune.permissao",
		"ticket.permissao",
		"player.noclip"
		
	},
		["OffAdmin"] = {
		"offadmin.permissao",
		"sem.permissao"

		
	},
	["Mod"] = {
		"mod.permissao",
		"suporte.permissao",
		"wl.permissao",
		"polpar.permissao",
		"wall.permissao",
		"ticket.permissao",
		"imune.permissao",
		"player.noclip"
		
	},
		["OffMod"] = {
		"offmod.permissao",
		"sem.permissao"
	},
	["Suporte"] = {
		"suporte.permissao",
		"wl.permissao",
		"ticket.permissao",
		"imune.permissao",
		"player.noclip"
		
	},
		["OffSuporte"] = {
		"offsuporte.permissao",
		"sem.permissao"
	},
	["Whitelist"] = {
		"wl.permissao"
	},
	-----------------------------------------------------
---------------------------------------------------
	["COMANDANTEPaycheck"] = {
		_config = {
		},
		"paisanacmdgeral.permissao"
	},
	["COMANDANTE"] = {
		_config = {
			title = "Comandante Geral",
			gtype = "job"
		},
		"policia.permissao",
		"cmdgeral.permissao",
		"addgrupo.permissao",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	---------------------------------------------------
	---------------------------------------------------
	["PMESPPaycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"salariopmesp.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PMESP1"] = {
		_config = {
			title = "PMERJ Recruta",
			gtype = "job"
		},
		"paisanapolicia.recruta"
	},
	---------------------------------------------------
	["PMESP2Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"salariopmesp.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PMESP2"] = {
		_config = {
			title = "PMERJ Soldado",
			gtype = "job"
		},
		"paisanapolicia.soldado"
	},
	---------------------------------------------------
	["PMESP3Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"salariopmesp.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PMESP3"] = {
		_config = {
			title = "PMERJ Cabo",
			gtype = "job"
		},
		"paisanapolicia.cabo"
		
	},
	---------------------------------------------------
	["PMESP4Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"salariopmesp.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PMESP4"] = {
		_config = {
			title = "PMERJ Sargento",
			gtype = "job"
		},
		"paisanapolicia.sargento"
	},
	---------------------------------------------------
	["PMESP5Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"salariopmesp.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PMESP5"] = {
		_config = {
			title = "PMERJ Sub-Tenente",
			gtype = "job"
		},
		"paisanapolicia.subtenente"
	},
	---------------------------------------------------
	["PMESP6Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"salariopmesp.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PMESP6"] = {
		_config = {
			title = "PMERJ Tenente",
			gtype = "job"
		},
		"paisanapolicia.tenente"
	},
	---------------------------------------------------
	["PMESP7Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"salariopmesp.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PMESP7"] = {
		_config = {
			title = "PMERJ Capitão",
			gtype = "job"
		},
		"paisanapolicia.capitao"
	},
	---------------------------------------------------
	["PMESP8Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"salariopmesp.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PMESP8"] = {
		_config = {
			title = "PMERJ Major",
			gtype = "job"
		},
		"paisanapolicia.major"
	},
	---------------------------------------------------
	["PMESP9Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"salariopmesp.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PMESP9"] = {
		_config = {
			title = "PMERJ Coronel",
			gtype = "job"
		},
		"paisanapolicia.coronel"
	},
	---------------------------------------------------
	---------------------------------------------------
	---------------------------------------------------
	["PC1Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"PC.permissao",
		"salariopc.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PC1"] = {
		_config = {
			title = "Policia Civil - Investigador",
			gtype = "job"
		},
		"paisanapoliciapc.investigador"
	},
	---------------------------------------------------
	["PC2Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"PC.permissao",
		"salariopc.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PC2"] = {
		_config = {
			title = "Policia Civil - Perito Criminal",
			gtype = "job"
		},
		"paisanapoliciapc.perito"
	},
	---------------------------------------------------
	["PC3Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"PC.permissao",
		"salariopc.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["PC3"] = {
		_config = {
			title = "Policia Civil - Delegado",
			gtype = "job"
		},
		"paisanapoliciapc.delegado"
	},
	---------------------------------------------------
	---------------------------------------------------
	["PRF1Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"prf.permissao",
		"apreender.veiculo",
		"salarioprf.permissao",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["PRF1"] = {
		_config = {
			title = "PRF - Terceira Classe",
			gtype = "job"
		},
		"paisanaprf.terceira"
	},
	---------------------------------------------------
	["PRF2Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"prf.permissao",
		"apreender.veiculo",
		"salarioprf.permissao",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["PRF2"] = {
		_config = {
			title = "PRF - Segunda Classe",
			gtype = "job"
		},
		"paisanaprf.segunda"
	},
	---------------------------------------------------
	["PRF3Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"prf.permissao",
		"apreender.veiculo",
		"salarioprf.permissao",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["PRF3"] = {
		_config = {
			title = "PRF - Primeira Classe",
			gtype = "job"
		},
		"paisanaprf.primeira"
	},
	---------------------------------------------------
	["PRF4Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"prf.permissao",
		"apreender.veiculo",
		"salarioprf.permissao",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["RPF4"] = {
		_config = {
			title = "PRF - Especial",
			gtype = "job"
		},
		"paisanaprf.especial"
	},
	---------------------------------------------------
	["BAEP1Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"baep.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["BAEP1"] = {
		_config = {
			title = "BAEP Soldado",
			gtype = "job"
		},
		"paisanapoliciabaep.soldado"
	},
	---------------------------------------------------	
	["BAEP2Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"baep.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["BAEP2"] = {
		_config = {
			title = "BAEP Cabo",
			gtype = "job"
		},
		"paisanapoliciabaep.cabo"
	},
	---------------------------------------------------	
	["BAEP3Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"baep.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["BAEP3"] = {
		_config = {
			title = "BAEP Sargento",
			gtype = "job"
		},
		"paisanapoliciabaep.sargento"
	},
	---------------------------------------------------	
	["BAEP4Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"baep.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["BAEP4"] = {
		_config = {
			title = "BAEP Tenente",
			gtype = "job"
		},
		"paisanapoliciabaep.tenente"
	},
	---------------------------------------------------	
	["BAEP5Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"baep.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["BAEP5"] = {
		_config = {
			title = "BAEP Capitão",
			gtype = "job"
		},
		"paisanapoliciabaep.capitao"
	},
	---------------------------------------------------	
	["BAEP6Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"baep.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["BAEP6"] = {
		_config = {
			title = "BAEP Major",
			gtype = "job"
		},
		"paisanapoliciabaep.major"
	},
	---------------------------------------------------	
	["BAEP7Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"baep.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["BAEP7"] = {
		_config = {
			title = "BAEP Coronel",
			gtype = "job"
		},
		"paisanapoliciabaep.coronel"
	},
	---------------------------------------------------	
	["ROTA1Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"rota.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["ROTA1"] = {
		_config = {
			title = "ROTA Soldado",
			gtype = "job"
		},
		"paisanapoliciarota.soldado"
	},
	---------------------------------------------------
	["ROTA2Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"rota.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["ROTA2"] = {
		_config = {
			title = "ROTA Cabo",
			gtype = "job"
		},
		"paisanapoliciarota.cabo"
	},
	---------------------------------------------------
	["ROTA3Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"rota.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["ROTA3"] = {
		_config = {
			title = "ROTA Sargento",
			gtype = "job"
		},
		"paisanapoliciarota.sargento"
	},
	---------------------------------------------------
	["ROTA4Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"rota.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["ROTA4"] = {
		_config = {
			title = "ROTATenente",
			gtype = "job"
		},
		"paisanapoliciarota.tenente"
	},
	---------------------------------------------------
	["ROTA5Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"rota.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["ROTA5"] = {
		_config = {
			title = "ROTA Capitão",
			gtype = "job"
		},
		"paisanapoliciarota.capitao"
	},
	---------------------------------------------------
	["ROTA6Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"rota.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["ROTA6"] = {
		_config = {
			title = "ROTA Major",
			gtype = "job"
		},
		"paisanapoliciarota.major"
	},
	---------------------------------------------------
	["ROTA7Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"rota.permissao",
		"salariorota.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
	["ROTA7"] = {
		_config = {
			title = "ROTA Coronel",
			gtype = "job"
		},
		"paisanapoliciarota.coronel"
	},
	---------------------------------------------------
	["CET"] = {
		_config = {
			title = "Companhia de Engenharia de Tráfego",
			gtype = "job"
		},
		"policia.permissao",
		"cet.permissao",
		"apreender.veiculo",
		"salariocet.permissao",
		"polpar.permissao"
	},
	["PaisanaCET"] = {
		_config = {
			title = "À Paisana CET",
			gtype = "job"
		},
		"paisanacet.permissao"
	},
    ---------------------------------------------------
    ["GRPAEPaycheck"] = {
		_config = {
			title = "GRPAE",
			gtype = "job"
		},
		"policia.permissao",
		"grpae.permissao",
		"salariogrpae.permissao",
		"policiaheli.permissao",
		"polpar.permissao",
		"civil.permissao"
	},
    ["GRPAE"] = {
		_config = {
			title = "GRPAE",
			gtype = "job"
		},
		"paisanapoliciagrpae.permissao"
	},
	---------------------------------------------------
	-----------------------------------------------------
	-- Hospital ------------------------------------
	-----------------------------------------------------

	["EnfermeiroHP"] = {
		_config = {
			title = "Enfermeiro HP",
			gtype = "job"
		},
		"enfermeirohp.permissao",
		"medico.permissao",
		"paramedico.permissao",
		"player.noclip",
		"player.blips"
	}, 
	["PaisanaEnfermeiroHP"] = {
		_config = {
			title = "Folga Enfermeiro HP",
			gtype = "job"
		},
		"paisanaenfermeirohp.permissao",
		"sem.permissao"	,	
		"player.blips"
	},
	["MedicoHP"] = {
		_config = {
			title = "Medico HP",
			gtype = "job"
		},
		"medicohp.permissao",
		"medico.permissao",
		"player.noclip",
		"paramedico.permissao",
		"player.blips"
	},
	["PaisanaMedicoHP"] = {
		_config = {
			title = "Folga Medico HP",
			gtype = "job"
		},
		"paisanamedicohp.permissao",
		"sem.permissao",
		"player.blips"
	}, 
	["MedicoChefeHP"] = {
		_config = {
			title = "Medico Chefe HP",
			gtype = "job"
		},
		"medicochefehp.permissao",
		"medico.permissao",
		"paramedico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaMedicoChefeHP"] = {
		_config = {
			title = "Folga Medico Chefe HP",
			gtype = "job"
		},
		"paisanamedicochefehp.permissao",
		"sem.permissao",
		"player.blips"
	}, 
	["DiretorHP"] = {
		_config = {
			title = "Diretor HP",
			gtype = "job"
		},
		"diretorhp.permissao",
		"medico.permissao",
		"paramedico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaDiretorHP"] = {
		_config = {
			title = "Folga Diretor HP",
			gtype = "job"
		},
		"paisanadiretorhp.permissao",
		"sem.permissao",
		"player.blips"
	}, 
	["ViceDiretorHP"] = {
		_config = {
			title = "Vice Diretor HP",
			gtype = "job"
		},
		"vicediretorhp.permissao",
		"medico.permissao",
		"player.noclip",
		"paramedico.permissao",
		"player.blips"
	}, 
	["PaisanaViceDiretorHP"] = {
		_config = {
			title = "Folga Vice Diretor HP",
			gtype = "job"
		},
		"paisanavicediretorhp.permissao",
		"sem.permissao",
		"player.blips"
	}, 

	------------------------------------------------------------------------------------------
	----------------- Mecânica Sense Customs --------------------------------------------------------

	["LiderMidas"] = {
		_config = {
			title = "Lider Midas",
			gtype = "job"
		},
		"liderMidas.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"mecanico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaLiderMidas"] = {
		_config = {
			title = "Folga Lider Midas",
			gtype = "job"
		},
		"paisanaliderMidas.permissao",
		"sem.permissao",
		"player.blips"
	},
	["GerenteMidas"] = {
		_config = {
			title = "Gerente Midas",
			gtype = "job"
		},
		"gerenteMidas.permissao",
		"mecanico.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaGerenteMidas"] = {
		_config = {
			title = "Folga Gerente Midas",
			gtype = "job"
		},
		"paisanagerenteMidas.permissao",
		"sem.permissao",
		"player.blips"
	},
	["TunagemMidas"] = {
		_config = {
			title = "Tunagem Midas",
			gtype = "job"
		},
		"tunagemMidas.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"mecanico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaTunagemMidas"] = {
		_config = {
			title = "Folga Tunagem Midas",
			gtype = "job"
		},
		"paisanatunagemMidas.permissao",
		"sem.permissao",
		"player.blips"
	},
	["ReparoMidas"] = {
		_config = {
			title = "Reparo Midas",
			gtype = "job"
		},
		"reparoMidas.permissao",
		"reparo.permissao",
		"mecanico.permissao",
		"player.blips"
	},
	["PaisanaReparoMidas"] = {
		_config = {
			title = "Folga Reparo Midas",
			gtype = "job"
		},
		"paisanareparoMidas.permissao",
		"sem.permissao",
		"player.blips"
	},

	------------------------------------------------ Bennys <

	["LiderBennys"] = {
		_config = {
			title = "Lider Bennys",
			gtype = "job"
		},
		"liderBennys.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"mecanico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaLiderBennys"] = {
		_config = {
			title = "Folga Lider Bennys",
			gtype = "job"
		},
		"paisanaliderBennys.permissao",
		"sem.permissao",
		"player.blips"
	},
	["GerenteBennys"] = {
		_config = {
			title = "Gerente Bennys",
			gtype = "job"
		},
		"gerenteBennys.permissao",
		"mecanico.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaGerenteBennys"] = {
		_config = {
			title = "Folga Gerente Bennys",
			gtype = "job"
		},
		"paisanagerenteBennys.permissao",
		"sem.permissao",
		"player.blips"
	},
	["TunagemBennys"] = {
		_config = {
			title = "Tunagem Bennys",
			gtype = "job"
		},
		"tunagemBennys.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"mecanico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaTunagemBennys"] = {
		_config = {
			title = "Folga Tunagem Bennys",
			gtype = "job"
		},
		"paisanatunagemBennys.permissao",
		"sem.permissao",
		"player.blips"
	},
	["ReparoBennys"] = {
		_config = {
			title = "Reparo Bennys",
			gtype = "job"
		},
		"reparoBennys.permissao",
		"reparo.permissao",
		"mecanico.permissao",
		"player.blips"
	},
	["PaisanaReparoBennys"] = {
		_config = {
			title = "Folga Reparo Bennys",
			gtype = "job"
		},
		"paisanareparoBennys.permissao",
		"sem.permissao",
		"player.blips"
	},

	    ---------------------------------- mafia

    ["LiderMafia"] = {
		_config = {
			title = "Lider França",
			gtype = "job"
		},
		"lidermafia.permissao",
		"mafia.permissao",
		"bloods.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderMafia"] = {
		_config = {
			title = "Vice Lider França",
			gtype = "job"
		},
		"vicelidermafia.permissao",
		"mafia.permissao",
		"bloods.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteMafia"] = {
		_config = {
			title = "Gerente França",
			gtype = "job"
		},
		"gerentemafia.permissao",
		"mafia.permissao",
		"bloods.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Mafia"] = {
		_config = {
			title = "Membro França",
			gtype = "job"
		},
		"mafia.permissao",
		"bloods.permissao",
		"player.blips"
	},
	
	--------------------------------------- Correia

        ["LiderCorreia"] = {
		_config = {
			title = "Lider Correia",
			gtype = "job"
		},
		"liderCorreia.permissao",
		"Correia.permissao",
		"colete.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderCorreia"] = {
		_config = {
			title = "Vice Lider Correia",
			gtype = "job"
		},
		"viceliderCorreia.permissao",
		"Correia.permissao",
		"colete.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteCorreia"] = {
		_config = {
			title = "Gerente Correia",
			gtype = "job"
		},
		"gerenteCorreia.permissao",
		"Correia.permissao",
		"colete.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Correia"] = {
		_config = {
			title = "Membro Correia",
			gtype = "job"
		},
		"Correia.permissao",
		"colete.permissao",
		"player.blips"
	},
        
        --------------------------------------- Ruf Ruf

        ["LiderRufRuf"] = {
		_config = {
			title = "Lider Ruf Ruf",
			gtype = "job"
		},
		"liderRufRuf.permissao",
		"RufRuf.permissao",
		"colete.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderRufRuf"] = {
		_config = {
			title = "Vice Lider RufRuf",
			gtype = "job"
		},
		"viceliderRufRuf.permissao",
		"RufRuf.permissao",
		"colete.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteRufRuf"] = {
		_config = {
			title = "Gerente RufRuf",
			gtype = "job"
		},
		"gerenteRufRuf.permissao",
		"colete.permissao",
		"RufRuf.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["RufRuf"] = {
		_config = {
			title = "Membro Ruf Ruf",
			gtype = "job"
		},
		"RufRuf.permissao",
		"colete.permissao",
		"player.blips"
	},

         --------------------------------------- Vinhedo

        ["LiderVinhedo"] = {
		_config = {
			title = "Lider Vinhedo",
			gtype = "job"
		},
		"liderVinhedo.permissao",
		"Vinhedo.permissao",
		"lavagem.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderVinhedo"] = {
		_config = {
			title = "Vice Lider Vinhedo",
			gtype = "job"
		},
		"viceliderVinhedo.permissao",
		"Vinhedo.permissao",
		"lavagem.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteVinhedo"] = {
		_config = {
			title = "Gerente Vinhedo",
			gtype = "job"
		},
		"gerenteVinhedo.permissao",
		"Vinhedo.permissao",
		"lavagem.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Vinhedo"] = {
		_config = {
			title = "Membro Vinhedo",
			gtype = "job"
		},
		"Vinhedo.permissao",
		"lavagem.permissao",
		"player.blips"
	},
       
        --------------------------------------- Bahamas

        ["LiderBahamas"] = {
		_config = {
			title = "Lider Bahamas",
			gtype = "job"
		},
		"liderBahamas.permissao",
		"lavagem.permissao",
		"Bahamas.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderBahamas"] = {
		_config = {
			title = "Vice Lider Bahamas",
			gtype = "job"
		},
		"viceliderBahamas.permissao",
		"lavagem.permissao",
		"Bahamas.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteBahamas"] = {
		_config = {
			title = "Gerente Bahamas",
			gtype = "job"
		},
		"gerenteBahamas.permissao",
		"lavagem.permissao",
		"Bahamas.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Bahamas"] = {
		_config = {
			title = "Membro Bahamas",
			gtype = "job"
		},
		"Bahamas.permissao",
		"lavagem.permissao",
		"player.blips"
	},

        --------------------------------------- Yakuza

        ["LiderYakuza"] = {
		_config = {
			title = "Lider Yakuza",
			gtype = "job"
		},
		"liderYakuza.permissao",
		"Yakuza.permissao",
		"bloods.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderYakuza"] = {
		_config = {
			title = "Vice Lider Yakuza",
			gtype = "job"
		},
		"viceliderYakuza.permissao",
		"Yakuza.permissao",
		"gmafia.permissao",
		"bloods.permissao",
		"player.blips"
	},
	["GerenteYakuza"] = {
		_config = {
			title = "Gerente Yakuza",
			gtype = "job"
		},
		"gerenteYakuza.permissao",
		"Yakuza.permissao",
		"bloods.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Yakuza"] = {
		_config = {
			title = "Membro Yakuza",
			gtype = "job"
		},
		"Yakuza.permissao",
		"bloods.permissao",
		"player.blips"
	},
        
         --------------------------------------- Bratva

        ["LiderBratva"] = {
		_config = {
			title = "Lider Bratva",
			gtype = "job"
		},
		"liderBratva.permissao",
		"Bratva.permissao",
		"municao.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderBratva"] = {
		_config = {
			title = "Vice Lider Bratva",
			gtype = "job"
		},
		"viceliderBratva.permissao",
		"Bratva.permissao",
		"municao.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteBratva"] = {
		_config = {
			title = "Gerente Bratva",
			gtype = "job"
		},
		"gerenteBratva.permissao",
		"municao.permissao",
		"Bratva.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Bratva"] = {
		_config = {
			title = "Membro Bratva",
			gtype = "job"
		},
		"Bratva.permissao",
		"municao.permissao",
		"player.blips"
	},
	
         --------------------------------------- Grota

        ["LiderGrota"] = {
		_config = {
			title = "Lider Grota",
			gtype = "job"
		},
		"liderGrota.permissao",
		"muniçao.permissao",
		"Grota.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderGrota"] = {
		_config = {
			title = "Vice Lider Grota",
			gtype = "job"
		},
		"viceliderGrota.permissao",
		"Grota.permissao",
		"muniçao.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteGrota"] = {
		_config = {
			title = "Gerente Grota",
			gtype = "job"
		},
		"gerenteGrota.permissao",
		"muniçao.permissao",
		"Grota.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Grota"] = {
		_config = {
			title = "Membro Grota",
			gtype = "job"
		},
		"Grota.permissao",
		"muniçao.permissao",
		"player.blips"
	},
        
        --------------------------------------- Fazenda

        ["LiderFazenda"] = {
		_config = {
			title = "Lider Fazenda",
			gtype = "job"
		},
		"liderFazenda.permissao",
		"america.permissao",
		"Fazenda.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderFazenda"] = {
		_config = {
			title = "Vice Lider Fazenda",
			gtype = "job"
		},
		"viceliderFazenda.permissao",
		"Fazenda.permissao",
		"america.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteFazenda"] = {
		_config = {
			title = "Gerente Fazenda",
			gtype = "job"
		},
		"gerenteFazenda.permissao",
		"Fazenda.permissao",
		"america.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Fazenda"] = {
		_config = {
			title = "Membro Fazenda",
			gtype = "job"
		},
		"Fazenda.permissao",
		"america.permissao",
		"player.blips"
	},

       --------------------------------------- Vanilla

        ["LiderVanilla"] = {
		_config = {
			title = "Lider Vanilla",
			gtype = "job"
		},
		"liderVanilla.permissao",
		"america.permissao",
		"Vanilla.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderVanilla"] = {
		_config = {
			title = "Vice Lider Vanilla",
			gtype = "job"
		},
		"viceliderVanilla.permissao",
		"america.permissao",
		"Vanilla.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteVanilla"] = {
		_config = {
			title = "Gerente Vanilla",
			gtype = "job"
		},
		"gerenteVanilla.permissao",
		"america.permissao",
		"Vanilla.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Vanilla"] = {
		_config = {
			title = "Membro Vanilla",
			gtype = "job"
		},
		"Vanilla.permissao",
		"america.permissao",
		"player.blips"
	},
        
         --------------------------------------- MotoClube

        ["LiderMotoClube"] = {
		_config = {
			title = "Lider MotoClube",
			gtype = "job"
		},
		"liderMotoClube.permissao",
		"MotoClube.permissao",
		"desmanche.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderMotoClube"] = {
		_config = {
			title = "Vice Lider MotoClube",
			gtype = "job"
		},
		"viceliderMotoClube.permissao",
		"MotoClube.permissao",
		"desmanche.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteMotoClube"] = {
		_config = {
			title = "Gerente MotoClube",
			gtype = "job"
		},
		"gerenteMotoClube.permissao",
		"desmanche.permissao",
		"MotoClube.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["MotoClube"] = {
		_config = {
			title = "Membro MotoClube",
			gtype = "job"
		},
		"MotoClube.permissao",
		"desmanche.permissao",
		"player.blips"
	},
        
         --------------------------------------- Tequi La La

        ["LiderTequiLaLa"] = {
		_config = {
			title = "Lider TequiLa",
			gtype = "job"
		},
		"liderTequiLaLa.permissao",
		"TequiLaLa.permissao",
		"desmanche.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderTequiLaLa"] = {
		_config = {
			title = "Vice Lider Tequi La La",
			gtype = "job"
		},
		"viceliderTequiLaLa.permissao",
		"desmanche.permissao",
		"TequiLaLa.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteTequiLaLa"] = {
		_config = {
			title = "Gerente Tequi La La",
			gtype = "job"
		},
		"gerenteTequiLaLa.permissao",
		"desmanche.permissao",
		"TequiLaLa.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["TequiLaLa"] = {
		_config = {
			title = "Membro TequiLaLa",
			gtype = "job"
		},
		"TequiLaLa.permissao",
		"desmanche.permissao",
		"player.blips"
	},

        --------------------------------------- Colombia

        ["LiderColombia"] = {
		_config = {
			title = "Lider Colombia",
			gtype = "job"
		},
		"liderColombia.permissao",
		"Colombia.permissao",
		"lsd.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderColombia"] = {
		_config = {
			title = "Vice Lider Tequi La La",
			gtype = "job"
		},
		"viceliderColombia.permissao",
		"Colombia.permissao",
		"lsd.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteColombia"] = {
		_config = {
			title = "Gerente Colombia",
			gtype = "job"
		},
		"gerenteColombia.permissao",
		"Colombia.permissao",
		"lsd.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Colombia"] = {
		_config = {
			title = "Membro Colombia",
			gtype = "job"
		},
		"Colombia.permissao",
		"lsd.permissao",
		"player.blips"
	},

         --------------------------------------- America

        ["LiderAmerica"] = {
		_config = {
			title = "Lider America",
			gtype = "job"
		},
		"liderAmerica.permissao",
		"America.permissao",
		"lsd.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderAmerica"] = {
		_config = {
			title = "Vice Lider America",
			gtype = "job"
		},
		"viceliderAmerica.permissao",
		"America.permissao",
		"lsd.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteAmerica"] = {
		_config = {
			title = "Gerente America",
			gtype = "job"
		},
		"gerenteAmerica.permissao",
		"America.permissao",
		"lsd.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["America"] = {
		_config = {
			title = "Membro America",
			gtype = "job"
		},
		"America.permissao",
		"lsd.permissao",
		"player.blips"
	},
        
         --------------------------------------- ADA

        ["LiderADA"] = {
		_config = {
			title = "Lider ADA",
			gtype = "job"
		},
		"liderADA.permissao",
		"ADA.permissao",
		"cocaina.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderADA"] = {
		_config = {
			title = "Vice Lider ADA",
			gtype = "job"
		},
		"viceliderADA.permissao",
		"ADA.permissao",
		"cocaina.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteADA"] = {
		_config = {
			title = "Gerente ADA",
			gtype = "job"
		},
		"gerenteADA.permissao",
		"ADA.permissao",
		"cocaina.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ADA"] = {
		_config = {
			title = "Membro ADA",
			gtype = "job"
		},
		"ADA.permissao",
		"cocaina.permissao",
		"player.blips"
	},
        
         --------------------------------------- CV

        ["LiderCV"] = {
		_config = {
			title = "Lider CV",
			gtype = "job"
		},
		"liderCV.permissao",
		"CV.permissao",
		"maconha.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderCV"] = {
		_config = {
			title = "Vice Lider CV",
			gtype = "job"
		},
		"viceliderCV.permissao",
		"CV.permissao",
		"maconha.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteCV"] = {
		_config = {
			title = "Gerente CV",
			gtype = "job"
		},
		"gerenteCV.permissao",
		"CV.permissao",
		"maconha.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["CV"] = {
		_config = {
			title = "Membro CV",
			gtype = "job"
		},
		"CV.permissao",
		"maconha.permissao",
		"player.blips"
	},
        
         --------------------------------------- Barragem

        ["LiderBarragem"] = {
		_config = {
			title = "Lider Barragem",
			gtype = "job"
		},
		"liderBarragem.permissao",
		"maconha.permissao",
		"Barragem.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderBarragem"] = {
		_config = {
			title = "Vice Lider Barragem",
			gtype = "job"
		},
		"viceliderBarragem.permissao",
		"maconha.permissao",
		"Barragem.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteBarragem"] = {
		_config = {
			title = "Gerente Barragem",
			gtype = "job"
		},
		"gerenteBarragem.permissao",
		"maconha.permissao",
		"Barragem.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Barragem"] = {
		_config = {
			title = "Membro Barragem",
			gtype = "job"
		},
		"Barragem.permissao",
		"maconha.permissao",
		"player.blips"
	},

       --------------------------------------- Milicia

        ["LiderMilicia"] = {
		_config = {
			title = "Lider Milicia",
			gtype = "job"
		},
		"liderMilicia.permissao",
		"cocaina.permissao",
		"Milicia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderMilicia"] = {
		_config = {
			title = "Vice Lider Milicia",
			gtype = "job"
		},
		"viceliderMilicia.permissao",
		"cocaina.permissao",
		"Milicia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteMilicia"] = {
		_config = {
			title = "Gerente Milicia",
			gtype = "job"
		},
		"gerenteMilicia.permissao",
		"cocaina.permissao",
		"Milicia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Milicia"] = {
		_config = {
			title = "Membro Milicia",
			gtype = "job"
		},
		"Milicia.permissao",
		"cocaina.permissao",
		"player.blips"
	},

         --------------------------------------- Hell Anjos

        ["LiderHellAnjos"] = {
		_config = {
			title = "Lider Hell Anjos",
			gtype = "job"
		},
		"liderHellAnjos.permissao",
		"HellAnjos.permissao",
		"lsd.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderHellAnjos"] = {
		_config = {
			title = "Vice Lider Hell Anjos",
			gtype = "job"
		},
		"viceliderHellAnjos.permissao",
		"HellAnjos.permissao",
		"lsd.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteHellAnjos"] = {
		_config = {
			title = "Gerente Hell Anjos",
			gtype = "job"
		},
		"gerenteHellAnjos.permissao",
		"HellAnjos.permissao",
		"lsd.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Hell Anjos"] = {
		_config = {
			title = "Membro HellAnjos",
			gtype = "job"
		},
		"HellAnjos.permissao",
		"lsd.permissao",
		"player.blips"
	},

        --------------------------------------- Turquia

        ["LiderTurquia"] = {
		_config = {
			title = "Lider Turquia",
			gtype = "job"
		},
		"liderTurquia.permissao",
		"lsd.permissao",
		"Turquia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderTurquia"] = {
		_config = {
			title = "Vice Lider Turquia",
			gtype = "job"
		},
		"viceliderTurquia.permissao",
		"lsd.permissao",
		"Turquia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteTurquia"] = {
		_config = {
			title = "Gerente Turquia",
			gtype = "job"
		},
		"gerenteTurquia.permissao",
		"lsd.permissao",
		"Turquia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Turquia"] = {
		_config = {
			title = "Membro Turquia",
			gtype = "job"
		},
		"Turquia.permissao",
		"lsd.permissao",
		"player.blips"
	},

        --------------------------------------- Israel

        ["LiderIsrael"] = {
		_config = {
			title = "Lider Israel",
			gtype = "job"
		},
		"liderIsrael.permissao",
		"lsd.permissao",
		"Israel.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderIsrael"] = {
		_config = {
			title = "Vice Lider Israel",
			gtype = "job"
		},
		"viceliderIsrael.permissao",
		"lsd.permissao",
		"Israel.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteIsrael"] = {
		_config = {
			title = "Gerente Israel",
			gtype = "job"
		},
		"gerenteIsrael.permissao",
		"lsd.permissao",
		"Israel.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Israel"] = {
		_config = {
			title = "Membro Israel",
			gtype = "job"
		},
		"Israel.permissao",
		"lsd.permissao",
		"player.blips"
	},

        --------------------------------------- Bluds

        ["LiderBluds"] = {
		_config = {
			title = "Lider Bluds",
			gtype = "job"
		},
		"liderBluds.permissao",
		"Bluds.permissao",
		"maconha.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderBluds"] = {
		_config = {
			title = "Vice Lider Bluds",
			gtype = "job"
		},
		"viceliderBluds.permissao",
		"Bluds.permissao",
		"maconha.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteBluds"] = {
		_config = {
			title = "Gerente Bluds",
			gtype = "job"
		},
		"gerenteBluds.permissao",
		"Bluds.permissao",
		"maconha.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Bluds"] = {
		_config = {
			title = "Membro Bluds",
			gtype = "job"
		},
		"Bluds.permissao",
		"maconha.permissao",
		"player.blips"
	},

        --------------------------------------- Mexico

        ["LiderMexico"] = {
		_config = {
			title = "Lider Mexico",
			gtype = "job"
		},
		"liderMexico.permissao",
		"Mexico.permissao",
		"cocaina.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderMexico"] = {
		_config = {
			title = "Vice Lider Mexico",
			gtype = "job"
		},
		"viceliderMexico.permissao",
		"Mexico.permissao",
		"cocaina.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteMexico"] = {
		_config = {
			title = "Gerente Mexico",
			gtype = "job"
		},
		"gerenteMexico.permissao",
		"Mexico.permissao",
		"cocaina.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Mexico"] = {
		_config = {
			title = "Membro Mexico",
			gtype = "job"
		},
		"Mexico.permissao",
		"cocaina.permissao",
		"player.blips"
	},

         --------------------------------------- SUICA

        ["LiderElements"] = {
		_config = {
			title = "Lider Elements",
			gtype = "job"
		},
		"liderElements.permissao",
		"Elements.permissao",
		"maconha.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderElements"] = {
		_config = {
			title = "Vice Lider Elements",
			gtype = "job"
		},
		"viceliderElements.permissao",
		"Elements.permissao",
		"maconha.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteElements"] = {
		_config = {
			title = "Gerente Elements",
			gtype = "job"
		},
		"gerenteElements.permissao",
		"Elements.permissao",
		"maconha.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Elements"] = {
		_config = {
			title = "Membro Elements",
			gtype = "job"
		},
		"Elements.permissao",
		"maconha.permissao",
		"cocaina.permissao",
		"player.blips"
	},
















	----------------------------------------------

	["Iniciante"] = {
		_config = {
			title = "VIP Iniciante",
			gtype = "vip"
		},
		"vipiniciante.permissao",
		"salario1.servico"
	},
	["Bronze"] = {
		_config = {
			title = "VIP Bronze",
			gtype = "vip"
		},
		"bronze.permissao",
		"salario2.servico"
	},
	["Prata"] = {
		_config = {
			title = "VIP Prata",
			gtype = "vip"
		},
		"prata.permissao",
		"salario3.servico"
	},
	["Ouro"] = {
		_config = {
			title = "VIP Ouro",
			gtype = "vip"
		},
		"ouro.permissao",
		"salario4.servico"
	},
	["Platina"] = {
		_config = {
			title = "VIP Platina",
			gtype = "vip"
		},
		"platina.permissao",
		"salario5.servico"
	},
	["Randola"] = {
		_config = {
			title = "VIP Randola",
			gtype = "vip"
		},
		"Randola.permissao",
		"helivip.permissao",
		"salario6.servico"
	},
	["Randola-supremo"] = {
		_config = {
			title = "VIP Randola Supremo",
			gtype = "vip"
		},
		"Randola-supremo.permissao",
		"helivip.permissao",
		"salario7.servico"
	},
	["EXOTIC"] = {
		_config = {
			title = "VIP Exotic",
			gtype = "vip"
		},
		"EXOTIC.permissao",
		"helivip.permissao",
		"salario8.servico"
	},
	["GOD"] = {
		_config = {
			title = "VIP God",
			gtype = "vip"
		},
		"GOD.permissao",
		"helivip.permissao",
		"jatovip.permissao",
		"salario9.servico"
	},
	["RUBI"] = {
		_config = {
			title = "VIP Rubi",
			gtype = "vip"
		},
		"RUBI.permissao",
		"helivip.permissao",
		"jatovip.permissao",
		"salario9.servico"
	},


}

cfg.users = {
	[1] = { "Dono" },
	[20] = { "Dono" },
	[24] = { "Dono" },
	[31] = { "Dono" },
	[32] = { "Dono" },
	[33] = { "Dono" },
	[42] = { "Dono" },
	[40] = { "Dono" },
	[39] = { "Dono" }
	
}

cfg.selectors = {

}

return cfg