Config = {}

--- vazamento por dogz1n community
--   vem para comunidade <3
--     discord.gg/dogz1n

Config.isCreative = false -- É BASE CREATIVE

-- [[ NOTIFICAÇÕES]] --------------------------------------
Config.Notify_Event = "Notify"
Config.Notify_Sucesso = "sucesso"
Config.Notify_Aviso = "aviso"
Config.Notify_Importante = "importante"
Config.Notify_Negado = "negado"

-- [[ CONFIG ]] --------------------------------------

Config.tabletComando = "tabletcontrato" -- COMANDO PARA ABRIR O TABLET

Config.tabletUsarBlockList = true -- CASO QUERIA TER AS BLOCK LIST ATIVA NO SCIPT
Config.tabletDiasBlockList = 3 -- DIAS QUE A PESSOA ESTÁ NA BLOCKLIST DE SETAGEM
Config.tabletBlockListDB = "vRP:pth_tablet_contratacao_group_blocklist" -- NOME DA LINHA QUE FICA NO BANCO DE DADOS ( tabela: vrp_user_data )

Config.tabletPermissoes = {
    ["cmdgeral.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "PMESP", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "COMANDANTE", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "PMESP1", -- GRUPO DE SETAGEM
                        title = "PMESP Recruta", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "PMESP2", title = "PMESP Soldado", blocklist = true},
                    [3] = {group = "PMESP3", title = "PMESP Cabo", blocklist = true},
                    [4] = {group = "PMESP4", title = "PMESP Sargento", blocklist = true},
                    [5] = {group = "PMESP7", title = "PMESP Capitão", blocklist = true},
                    [6] = {group = "PMESP8", title = "PMESP Major", blocklist = true},
                    [7] = {group = "PMESP6", title = "PMESP Tenente", blocklist = true},
                },
            }
        }
    },
    ["paisanapoliciapc.delegado"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "PC3", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Policia Civil - Delegado", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "PC2", -- GRUPO DE SETAGEM
                        title = "Policia Civil - Perito Criminal", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "PC1", title = "Policia Civil - Investigador", blocklist = true},
            },
          }
        }
    },
    ["comandantegeral.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "ComandanteGeral", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Comandante Geral", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "Recruta", -- GRUPO DE SETAGEM
                        title = "Recruta", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Cabo", title = "Cabo", blocklist = true},
                    [3] = {group = "Major", title = "Major", blocklist = true},
                    [4] = {group = "Soldado", title = "Soldado", blocklist = true},
                    [5] = {group = "Sargento", title = "Sargento", blocklist = true},
                    [6] = {group = "Tenente", title = "Tenente", blocklist = true},
                    [7] = {group = "Capitão", title = "Capitão", blocklist = true},
                    [8] = {group = "Coronel", title = "Coronel", blocklist = true},
                },
            }
        }
    },
    ["comandantegeral-civil.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "ComandanteGeral-civil", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Comandante Geral Civil", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "Recruta-civil", -- GRUPO DE SETAGEM
                        title = "Recruta Civil", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Cabo-civil", title = "Cabo Civil", blocklist = true},
                    [3] = {group = "Major-civil", title = "Major Civil", blocklist = true},
                    [4] = {group = "Soldado-civil", title = "Soldado Civil", blocklist = true},
                    [5] = {group = "Sargento-civil", title = "Sargento Civil", blocklist = true},
                    [6] = {group = "Tenente-civil", title = "Tenente Civil", blocklist = true},
                    [7] = {group = "Capitão-civil", title = "Capitão Civil", blocklist = true},
                    [8] = {group = "Coronel-civil", title = "Coronel Civil", blocklist = true},
                },
            }
        }
    },
    ["comandantegeral-rota.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "ComandanteGeral-rota", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Comandante Geral Rota", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "Recruta-rota", -- GRUPO DE SETAGEM
                        title = "Recruta Rota", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Cabo-rota", title = "Cabo Rota", blocklist = true},
                    [3] = {group = "Major-rota", title = "Major Rota", blocklist = true},
                    [4] = {group = "Soldado-rota", title = "Soldado Rota", blocklist = true},
                    [5] = {group = "Sargento-rota", title = "Sargento-rota", blocklist = true},
                    [6] = {group = "Tenente-rota", title = "Tenente Rota", blocklist = true},
                    [7] = {group = "Capitão-rota", title = "Capitão Rota", blocklist = true},
                    [8] = {group = "Coronel-rota", title = "Coronel Rota", blocklist = true},
                },
            }
        }
    },
    ["ComandanteGeral-PRF.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "ComandanteGeral-PRF", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Comandante Geral PRF", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "Recruta-PRF", -- GRUPO DE SETAGEM
                        title = "Recruta PRF", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Cabo-PRF", title = "Cabo PRF", blocklist = true},
                    [3] = {group = "Major-PRF", title = "Major PRF", blocklist = true},
                    [4] = {group = "Soldado-PRF", title = "Soldado PRF", blocklist = true},
                    [5] = {group = "Sargento-PRF", title = "Sargento-PRF", blocklist = true},
                    [6] = {group = "Tenente-PRF", title = "Tenente PRF", blocklist = true},
                    [7] = {group = "Capitão-PRF", title = "Capitão PRF", blocklist = true},
                    [8] = {group = "Coronel-PRF", title = "Coronel PRF", blocklist = true},
                },
            }
        }
    },
    ["diretorhp.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "DiretorHP", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Diretor HP", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "ViceDiretorHP", -- GRUPO DE SETAGEM
                        title = "Vice Diretor HP", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "MedicoChefeHP", title = "Medico Chefe HP", blocklist = true},
                    [3] = {group = "MedicoHP", title = "Medico HP", blocklist = true},
                    [4] = {group = "enfermeirohp", title = "Enfermeiro HP", blocklist = true},
                },
            }
        }
    },
    ["lidermafia.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderMafia", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider França", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteMafia", -- GRUPO DE SETAGEM
                        title = "Gerente França", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Mafia", title = "Membro França", blocklist = true},
                },
            }
        }
    },
    ["liderCoreia.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderCoreia", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Coreia", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteCoreia", -- GRUPO DE SETAGEM
                        title = "Gerente Coreia", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Coreia", title = "Membro Coreia", blocklist = true},
                },
            }
        }
    },
    ["liderRufRuf.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderRufRuf", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider RufRuf", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteRufRuf", -- GRUPO DE SETAGEM
                        title = "Gerente RufRuf", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "RufRuf", title = "Membro RufRuf", blocklist = true},
                },
            }
        }
    },
    ["liderVinhedo.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderVinhedo", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Vinhedo", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteVinhedo", -- GRUPO DE SETAGEM
                        title = "Gerente Vinhedo", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Vinhedo", title = "Membro Vinhedo", blocklist = true},
                },
            }
        }
    },
    ["liderBahamas.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderBahamas", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Bahamas", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteBahamas", -- GRUPO DE SETAGEM
                        title = "Gerente Bahamas", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Bahamas", title = "Membro Bahamas", blocklist = true},
                },
            }
        }
    },
    ["liderYakuza.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderYakuza", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Yakuza", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteYakuza", -- GRUPO DE SETAGEM
                        title = "Gerente Yakuza", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Yakuza", title = "Membro Yakuza", blocklist = true},
                },
            }
        }
    },
    ["liderBratva.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderBratva", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Bratva", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteBratva", -- GRUPO DE SETAGEM
                        title = "Gerente Bratva", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Bratva", title = "Membro Bratva", blocklist = true},
                },
            }
        }
    },
    ["liderItalia.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderItalia", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Italia", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteItalia", -- GRUPO DE SETAGEM
                        title = "Gerente Italia", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Italia", title = "Membro Italia", blocklist = true},
                },
            }
        }
    },
    ["liderFazenda.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderFazenda", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Fazenda", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteFazenda", -- GRUPO DE SETAGEM
                        title = "Gerente Fazenda", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Fazenda", title = "Membro Fazenda", blocklist = true},
                },
            }
        }
    },
    ["liderVanilla.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderVanilla", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Vanilla", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteVanilla", -- GRUPO DE SETAGEM
                        title = "Gerente Vanilla", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Vanilla", title = "Membro Vanilla", blocklist = true},
                },
            }
        }
    },
    ["liderMotoClub.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderMotoClub", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider MotoClub", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteMotoClub", -- GRUPO DE SETAGEM
                        title = "Gerente MotoClub", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "MotoClub", title = "Membro MotoClub", blocklist = true},
                },
            }
        }
    },
    ["liderTequila Lala.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderTequila Lala", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Tequila Lala", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteTequila Lala", -- GRUPO DE SETAGEM
                        title = "Gerente Tequila Lala", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Tequila Lala", title = "Membro Tequila Lala", blocklist = true},
                },
            }
        }
    },
    ["liderColômbia.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderColômbia", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Colômbia", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteColômbia", -- GRUPO DE SETAGEM
                        title = "Gerente Colômbia", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Colômbia", title = "Membro Colômbia", blocklist = true},
                },
            }
        }
    },
    ["liderAmerica.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderAmerica", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider America", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteAmerica", -- GRUPO DE SETAGEM
                        title = "Gerente America", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "America", title = "Membro America", blocklist = true},
                },
            }
        }
    },
    ["liderAda.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderAda", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "LiderAda", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteAda", -- GRUPO DE SETAGEM
                        title = "Gerente Ada", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Ada", title = "Membro Ada", blocklist = true},
                },
            }
        }
    },
    ["liderComando Vermelho.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderComando Vermelho", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Comando Vermelho", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteComando Vermelho", -- GRUPO DE SETAGEM
                        title = "Gerente Comando Vermelho", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Comando Vermelho", title = "Membro Comando Vermelho", blocklist = true},
                },
            }
        }
    },
    ["liderBarragem.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderComando Vermelho", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "LiderBarragem", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteBarragem", -- GRUPO DE SETAGEM
                        title = "Gerente Barragem", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Barragem", title = "Membro Barragem", blocklist = true},
                },
            }
        }
    },
    ["liderMilicia.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderMilicia", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Milicia", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteMilicia", -- GRUPO DE SETAGEM
                        title = "Gerente Milicia", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Milicia", title = "Membro Milicia", blocklist = true},
                },
            }
        }
    },
    ["liderHell Anjos.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderHell Anjos", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Hell Anjos", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteHell Anjos", -- GRUPO DE SETAGEM
                        title = "Gerente Hell Anjos", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Hell Anjos", title = "Membro Hell Anjos", blocklist = true},
                },
            }
        }
    },
    ["liderTurquia.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderTurquia", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Turquia", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteTurquia", -- GRUPO DE SETAGEM
                        title = "Gerente Turquia", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Turquia", title = "Membro Turquia", blocklist = true},
                },
            }
        }
    },
    ["liderIsrael.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderIsrael", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Israel", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteIsrael", -- GRUPO DE SETAGEM
                        title = "Gerente Israel", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Israel", title = "Membro Israel", blocklist = true},
                },
            }
        }
    },
    ["liderBluds.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderBluds", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Bluds", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteBluds", -- GRUPO DE SETAGEM
                        title = "Gerente Israel", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Bluds", title = "Membro Bluds", blocklist = true},
                },
            }
        }
    },
    ["liderMéxico.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderMéxico", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider México", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteMéxico", -- GRUPO DE SETAGEM
                        title = "Gerente México", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "México", title = "Membro México", blocklist = true},
                },
            }
        }
    },
    ["liderSuíça.permissao"] = { -- PERMISSÃO QUE TERÁ ACESSO A DAR OS CARGOS ABAIXO
        nome = "LiderSuíça", -- TITULO DA CAIXA DE GRUPOS (NO NUI)
        grupos = {
            [1] = { 
                title = "Lider Suíça", -- TITULO DA SUB CAIXA DE CARGOS (CASO SO TENHA 1 LISTA DE SUBCARGOS, O TITULO SERÁ O ACIMA)
                cargos = {
                    [1] = {
                        group = "GerenteSuíça", -- GRUPO DE SETAGEM
                        title = "Gerente Suíça", -- LEGENDA DO GRUPO
                        blocklist = true -- SE APLICA BLOCKLIST OU NÃO
                    },  -- 
                    [2] = {group = "Suíça", title = "Membro Suíça", blocklist = true},
                },
            }
        }
    },
    ["manager.permissao"] = {
        nome = "Groove",
        grupos = {
            [1] = { 
                title = "Cargo Groove",
                cargos = {
                    [1] = {group = "Groove", title = "Groove", blocklist = true}, 
                },
            }
        }
    },
    ["admin.permissao"] = {
        nome = "STAFF",
        grupos = {
            [1] = { 
                title = "VIPS",
                cargos = {
                    [1] = {group = "Bronze", title = "Bronze", blocklist = false}, 
                    [2] = {group = "Prata", title = "Prata", blocklist = false}, 
                    [3] = {group = "Ouro", title = "Ouro", blocklist = false},
                    [4] = {group = "Platina", title = "Platina", blocklist = false},
                    [5] = {group = "Randola", title = "Randola", blocklist = false},
                    [6] = {group = "Randola-Supremo", title = "Randola-Supremo", blocklist = false},
                    [7] = {group = "Exotic", title = "Exotic", blocklist = false},
                    [8] = {group = "God", title = "God", blocklist = false}, 
                    [9] = {group = "Rubi", title = "Rubi", blocklist = false}, 
                },
            },
            [2] = { 
                title = "Policia Militar",
                cargos = {
                    [1] = {group = "Policia", title = "Police Departament", blocklist = true}, 
                    [2] = {group = "PaisanaPolicia", title = "Paisana - Police Departament", blocklist = true}, 
                },
            },
            [4] = { 
                title = "MECANICO - CARGOS",
                cargos = {
                    [1] = {group = "MecanicoAprendiz", title = "Mecanico - Aprendiz", blocklist = false}, 
                    [2] = {group = "MecanicoSenior", title = "Mecanico - Senior", blocklist = false},
                    [3] = {group = "MecanicoChefe", title = "Mecanico - Chefe", blocklist = false},
                },
            }
        }
    },
}


--- vazamento por dogz1n community
--   vem para comunidade <3
--     discord.gg/dogz1n


-- [[ LOGS HOSPITAL ]] --------------------------------------
Config.webhookTablet = "https://discord.com/api/webhooks/895330323498405889/0vekrVlBQaSakC7LMpfsstRH1lZFWhjjDmjtGYCVd8ulu-Lp1qknQcNb8tMIKsP9DWxb" -- LOG ABRIR TABLET
Config.webhookTabletRemoveGrupo = "https://discord.com/api/webhooks/895330323498405889/0vekrVlBQaSakC7LMpfsstRH1lZFWhjjDmjtGYCVd8ulu-Lp1qknQcNb8tMIKsP9DWxb" -- LOG DE REMOVER GRUPO DE CIDADÃO
Config.webhookTabletEditGrupos = "https://discord.com/api/webhooks/895330323498405889/0vekrVlBQaSakC7LMpfsstRH1lZFWhjjDmjtGYCVd8ulu-Lp1qknQcNb8tMIKsP9DWxb" -- LOG DE QUANDO EDITA AS PERMISSOES DO CIDADAO