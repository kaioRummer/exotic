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
		"player.noclip",
		"salario1.servico"	
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
		"player.noclip",
		"salario1.servico"
	},
	["Mod"] = {
		"mod.permissao",
		"suporte.permissao",
		"wl.permissao",
		"polpar.permissao",
		"wall.permissao",
		"ticket.permissao",
		"imune.permissao",
		"player.noclip",
		"salario2.servico"
	},
	["Suporte"] = {
		"suporte.permissao",
		"wl.permissao",
		"ticket.permissao",
		"imune.permissao",
		"player.noclip",
		"salario3.servico"
	},
	["Whitelist"] = {
		"wl.permissao"
	},
	-----------------------------------------------------
	["Juiza"] = {
		_config = {
			title = "Juiza",
			gtype = "alt"
		},
		"juiza.permissao",
		"portadp.permissao",
		"sem.permissao"
	},
	["News"] = {
		_config = {
			title = "News",
			gtype = "job"
		},
		"news.permissao",
		"sem.permissao"	
	},
	["Vendedor"] = {
		_config = {
			title = "Vendedor",
			gtype = "altl"
		},
		"vendedor.permissao",
		"sem.permissao"	
	},
	["Advogado"] = {
		_config = {
			title = "Advogado",
			gtype = "alt"
		},
		"advogado.permissao",
		"sem.permissao"
	},
	----------- Departamentod e Policia -----------------
	-----------------------------------------------------
	-- Recruta
	["Recruta"] = {
		_config = {
			title = "Recruta",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"recruta.servico",
		"recruta.arsenal",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaRecruta"] = {
		_config = {
			title = "Recruta Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"recruta.folga",
		"sem.permissao"
	},
		["Cabo"] = {
		_config = {
			title = "Cabo",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"cabo.permissao",
		"recruta.arsenal",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaCabo"] = {
		_config = {
			title = "Cabo Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanacabo.permissao",
		"sem.permissao"
	},
			["Major"] = {
		_config = {
			title = "Major",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"major.permissao",
		"recruta.arsenal",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaMajor"] = {
		_config = {
			title = "Major Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanamajor.permissao",
		"sem.permissao"
	},

	-- Soldado
	["Soldado"] = {
		_config = {
			title = "Soldado",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"soldesarg.arsenal",
		"portadp.permissao",
		"soldado.servico",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaSoldado"] = {
		_config = {
			title = "Soldado Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"soldado.folga",
		"sem.permissao"
	},
	-- Sargento
	["Sargento"] = {
		_config = {
			title = "Sargento",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"soldesarg.arsenal",
		"sargento.servico",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaSargento"] = {
		_config = {
			title = "Sargento Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"sargento.folga",
		"sem.permissao"
	},
	-- Tenete
	["Tenente"] = {
		_config = {
			title = "Tenente",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"tenenteecoronel.arsenal",
		"tenente.servico",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaTenente"] = {
		_config = {
			title = "Tenente Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"tenente.folga",
		"sem.permissao"
	},
	-- Capitão
	["Capitão"] = {
		_config = {
			title = "Capitão",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"capitaoecoronel.arsenal",
		"capitao.servico",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaCapitão"] = {
		_config = {
			title = "Capitão Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"capitao.folga",
		"sem.permissao"
	},
	["Coronel"] = {
		_config = {
			title = "Coronel",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"pmerj.permissao",
		"portadp.permissao",
		"tenenteecoronel.arsenal",
		"coronel.servico",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaCoronel"] = {
		_config = {
			title = "Coronel Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"coronel.folga",
		"sem.permissao"
	},
	["Aspirante"] = {
		_config = {
			title = "Aspirante",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"pmerj.permissao",
		"portadp.permissao",
		"aspirante.permissao",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaAspirante"] = {
		_config = {
			title = "Aspirante Folga",
			gtype = "job"
		},
		"paisanaaspirante.permissao",
		"sem.permissao"
	},
	["ComandanteGeral"] = {
		_config = {
			title = "Comandante Geral",
			gtype = "job"
		},
		"policia.permissao",
		"comandantegeral.permissao",
		"player.noclip"
	},
	["PaisanaComandanteGeral"] = {
		_config = {
			title = "Comandante Geral Folga",
			gtype = "job"
		},
		"paisanacomandantegeral.permissao",
		"sem.permissao"
	},

	-----------------------------------------------------------------
	------------------- Policia civil
	-----------------------------------------------------------------
	["Investigador"] = {
		_config = {
			title = "Investigador",
			gtype = "job"
		},
		"policia.permissao",
		"investigador.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaInvestigador"] = {
		_config = {
			title = "Investigador Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanainvestigador.permissao",
		"sem.permissao"
	},
	["Escrivao"] = {
		_config = {
			title = "Escrivão",
			gtype = "job"
		},
		"policia.permissao",
		"escrivao.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaEscrivao"] = {
		_config = {
			title = "Escrivão Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanaescrivao.permissao",
		"sem.permissao"
	},
	["DelegadoPC"] = {
		_config = {
			title = "Delegado Policia Civil",
			gtype = "job"
		},
		"policia.permissao",
		"delegadopc.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaDelegadoPC"] = {
		_config = {
			title = "Delegado PC Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanadelegadopc.permissao",
		"sem.permissao"
	},
	------------------------------------------ PRF Policia Rodoviaria Federal
	----------------------------------------------------------------------------
	["PRFTerceiraClasse"] = {
		_config = {
			title = "PRF Terceira Classe",
			gtype = "job"
		},
		"policia.permissao",
		"prfterceiraclasse.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaPRFTerceiraClasse"] = {
		_config = {
			title = "PRF Terceira Classe Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanaprfterceiraclasse.permissao",
		"sem.permissao"
	},
	["PRFSegundaClasse"] = {
		_config = {
			title = "PRF Segunda Classe",
			gtype = "job"
		},
		"policia.permissao",
		"prfsegundaclasse.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaPRFSegundaClasse"] = {
		_config = {
			title = "PRF Segunda Classe Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanaprfsegundaclasse.permissao",
		"sem.permissao"
	},
	["PRFPrimeiraClasse"] = {
		_config = {
			title = "PRF Primeira Classe",
			gtype = "job"
		},
		"policia.permissao",
		"prfprimeiraclasse.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaPRFPrimeiraClasse"] = {
		_config = {
			title = "PRF Primeira Classe Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanaprfprimeiraclasse.permissao",
		"sem.permissao"
	},
	["PRFEspecial"] = {
		_config = {
			title = "PRF Especial",
			gtype = "job"
		},
		"policia.permissao",
		"prfespecial.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaPRFEspecial"] = {
		_config = {
			title = "PRF Especial Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanaprfespecial.permissao",
		"sem.permissao"
	},


	
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
	["ParamedicoHP"] = {
		_config = {
			title = "Paramedico HP",
			gtype = "job"
		},
		"paramedicohp.permissao",
		"medico.permissao",
		"playernoclip",
		"player.blips"
	},
	["PaisanaParamedicoHP"] = {
		_config = {
			title = "Folga Paramedico HP",
			gtype = "job"
		},
		"paisanaparamedicohp.permissao",
		"sem.permissao",
		"player.blips"
	},
	["MedicoHP"] = {
		_config = {
			title = "Medico HP",
			gtype = "job"
		},
		"medicohp.permissao",
		"player.noclip",
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

	["LiderSenseCustom"] = {
		_config = {
			title = "Lider Sense Custom",
			gtype = "job"
		},
		"lidersensecustom.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaLiderSenseCustom"] = {
		_config = {
			title = "Folga Lider Sense C",
			gtype = "job"
		},
		"paisanalidersensecustom.permissao",
		"sem.permissao",
		"player.blips"
	},
	["ViceLiderSenseCustom"] = {
		_config = {
			title = "ViceLider Sense Custom",
			gtype = "job"
		},
		"vicelidersensecustom.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaViceLiderSenseCustom"] = {
		_config = {
			title = "Folga ViceLider Sense C",
			gtype = "job"
		},
		"paisanavicelidersensecustom.permissao",
		"sem.permissao",
		"player.blips"
	},
	["GerenteSenseCustom"] = {
		_config = {
			title = "Gerente Sense Custom",
			gtype = "job"
		},
		"gerentesensecustom.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaGerenteSenseCustom"] = {
		_config = {
			title = "Folga Gerente Sense C",
			gtype = "job"
		},
		"paisanagerentesensecustom.permissao",
		"sem.permissao",
		"player.blips"
	},
	["TunagemSenseCustom"] = {
		_config = {
			title = "Tunagem Sense Custom",
			gtype = "job"
		},
		"tunagemsensecustom.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaTunagemSenseCustom"] = {
		_config = {
			title = "Folga Tunagem Sense C",
			gtype = "job"
		},
		"paisanatunagemsensecustom.permissao",
		"sem.permissao",
		"player.blips"
	},
	["ReparoSenseCustom"] = {
		_config = {
			title = "Reparo Sense Custom",
			gtype = "job"
		},
		"reparosensecustom.permissao",
		"reparo.permissao",
		"player.blips"
	},
	["PaisanaReparoSenseCustom"] = {
		_config = {
			title = "Folga Reparo Sense C",
			gtype = "job"
		},
		"paisanareparosensecustom.permissao",
		"sem.permissao",
		"player.blips"
	},

	------------------------------------------------ Bennys <

	["LiderBennys"] = {
		_config = {
			title = "Lider Bennys",
			gtype = "job"
		},
		"liderbennys.permissao",
		"bennys.permissao",
		"player.blips"
	},
	["ViceLiderBennys"] = {
		_config = {
			title = "ViceLider Bennys",
			gtype = "job"
		},
		"viceliderbennys.permissao",
		"bennys.permissao",
		"player.blips"
	},
	["GerenteBennys"] = {
		_config = {
			title = "Gerente Bennys",
			gtype = "job"
		},
		"gerentebennys.permissao",
		"bennys.permissao",
		"player.blips"
	},
	["Bennys"] = {
		_config = {
			title = "Bennys",
			gtype = "job"
		},
		"bennys.permissao",
		"player.blips"
	},
	    ---------------------------------- mafia

    ["LiderMafia"] = {
		_config = {
			title = "Lider Mafia",
			gtype = "job"
		},
		"lidermafia.permissao",
		"mafia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderMafia"] = {
		_config = {
			title = "Vice Lider Mafia",
			gtype = "job"
		},
		"vicelidermafia.permissao",
		"mafia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteMafia"] = {
		_config = {
			title = "Gerente Mafia",
			gtype = "job"
		},
		"gerentemafia.permissao",
		"mafia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Mafia"] = {
		_config = {
			title = "Mafia",
			gtype = "job"
		},
		"mafia.permissao",
		"player.blips"
	},
    





	----------------------------------------------

	["Iniciante"] = {
		_config = {
			title = "VIP Iniciante",
			gtype = "vip"
		},
		"vipiniciante.permissao"
	},
	["Bronze"] = {
		_config = {
			title = "Bronze",
			gtype = "vip"
		},
		"bronze.permissao"
	},
	["Prata"] = {
		_config = {
			title = "Prata",
			gtype = "vip"
		},
		"prata.permissao"
	},
	["Ouro"] = {
		_config = {
			title = "Ouro",
			gtype = "vip"
		},
		"ouro.permissao"
	},
	["Platina"] = {
		_config = {
			title = "Platina",
			gtype = "vip"
		},
		"platina.permissao"
	},
	["Diamante"] = {
		_config = {
			title = "Diamante",
			gtype = "vip"
		},
		"diamante.permissao"
	},
	["Topazio"] = {
		_config = {
			title = "Topázio",
			gtype = "vip"
		},
		"topazio.permissao"
	},
	["Esmeralda"] = {
		_config = {
			title = "Esmeralda",
			gtype = "vip"
		},
		"esmeralda.permissao"
	},
	["Rubi"] = {
		_config = {
			title = "Rubi",
			gtype = "vip"
		},
		"rubi.permissao"
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