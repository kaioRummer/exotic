# Sistema de Roubos
O script permite a você criar locais e métodos de roubo de uma maneira fácil e inteligente.

Join in GMZ Community: https://discord.gg/J2MVhGJ

Vídeo de exemplo: https://youtu.be/P1BA67hhnNg

 **Recursos**:
 - Configurar os itens recebidos ao realizar o roubo (é permitido mais de 1 item).
 - Configurar os itens necessários para realizar o roubo (Ex: lockpick ou ).
 - Configuração do tempo de duração do assalto.
 -  Configuração do tempo de espera para cada método de roubo.
 - Configurar a quantidade de policias para cada método de assalto.
 
 **Dependências**:
 
 - vrp
 - vrp_notify

# Como Instalar

 1. Realize o download, descompacte e mova a pasta **gmz_roubo** para sua pasta **[resources]/**
 2. start gmz_roubo
 
# Como Configurar

Acesse o arquivo config.lua e crie um novo método de roubo, seguindo a explicação de cada parâmetro abaixo:

![enter image description here](https://i.imgur.com/Zgfn0Pv.png)

|       Variável|Descrição                         |
|----------------|-------------------------------|
|items|`Itens para receber durante o assalto (a quantidade é dividida pelo tempo de duração da ação) `            |
|itemsNecessarios|`Itens necessários para começar o assalto `            |
|tempo|`Tempo de duração total da ação `            |
|tempoEspera|`Tempo de espera para realizarem a ação no método `            |
|lspd|`Quantidade mínima de policiais necessário para começar a ação `            |