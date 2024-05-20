*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# Dados do Teste
${Nome_Da_Musica}  Ariana Grande Positions

# Variáveis de Configuração
${URL}       https://www.youtube.com/
${Browser}      chrome

# Elementos
${Input_Pesquisa}    //input[@id="search"]
${Button_Pesquisa}   //button[@id='search-icon-legacy']
${Primeiro_Video}    (//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${Confirma_Pesquisa}    //div[contains(@class, 'yt-spec-button-shape-next__button-text-content') and text()='Compartilhar']

*** Keywords ***
Dado que eu acesso o site do youtube
    Open Browser    ${URL}      ${Browser}

Quando digito o nome da música
    Input Text      ${Input_Pesquisa}   ${Nome_Da_Musica}

E clico no botão buscar
    Click Element   ${Button_Pesquisa}

E clico na primeira opção da lista
    Wait Until Element is Visible   ${Primeiro_Video}       30
    Click Element   ${Primeiro_Video}    

Então o vídeo é executado
    Wait Until Element is Visible   ${Confirma_Pesquisa}        30
    Element Should Be Visible   ${Confirma_Pesquisa}
    Sleep   3s
    Close Browser

*** Test Cases ***
Cenario 1: Executar vídeo no site do youtube
    Dado que eu acesso o site do youtube
    Quando digito o nome da música
    E clico no botão buscar
    E clico na primeira opção da lista
    Então o vídeo é executado