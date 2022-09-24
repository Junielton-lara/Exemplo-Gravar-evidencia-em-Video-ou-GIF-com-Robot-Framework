*** Settings ***
Documentation        Projeto basico para testar os drives de execução

Library    SeleniumLibrary
Library    ScreenCapLibrary
Library    FakerLibrary
Library    OperatingSystem

*** Variables ***

${caminho_gif}      ${EXECDIR}${/}local_gif${/}
${caminho_video}    ${EXECDIR}${/}local_video${/}

&{NOVO_USER}
...        nome=Junior
...        ultimo_nome=lara
...        email=Junior@gmail.com
...        endereco=rua
...        universidade=positivo
...        profissao=QA
...        genero=masculino
...        idade=25

*** Test Cases ***
Caso de Teste 01: Efetuar user com sucesso
    
    Open Browser    abaut:blank        Chrome        options=add_experimental_option('excludeSwitches', ['enable-logging'])

    Create Directory      ${caminho_gif}
    Create Directory      ${caminho_video}
    
    Go To               https://automacaocombatista.herokuapp.com/users/new
    Maximize Browser Window

    Start Gif Recording      ${caminho_gif}
    Start Video Recording    ${caminho_video}


    
    Title Should Be                          Automação com Batista
    Wait until Element is Visible            xpath=//*[contains(text(), 'Novo Usuário!!')]


    Input Text        id=user_name             ${NOVO_USER.nome}
    Input Text        id=user_lastname         ${NOVO_USER.ultimo_nome}
    Input Text        id=user_email            ${NOVO_USER.email}
    Input Text        id=user_address          ${NOVO_USER.endereco}
    Input Text        id=user_university       ${NOVO_USER.universidade}
    Input Text        id=user_profile          ${NOVO_USER.profissao}
    Input Text        id=user_gender           ${NOVO_USER.genero}
    Input Text        id=user_age              ${NOVO_USER.idade}


    Sleep    2

    Click Element    xpath=//input[@value='Criar']


    Wait until Element is Visible            xpath=//*[contains(text(), 'Usuário Criado com sucesso')]

    Wait Until Page Contains    ${NOVO_USER.nome}
    Wait Until Page Contains    ${NOVO_USER.ultimo_nome}
    Wait Until Page Contains    ${NOVO_USER.email}
    Wait Until Page Contains    ${NOVO_USER.endereco}
    Wait Until Page Contains    ${NOVO_USER.universidade}
    Wait Until Page Contains    ${NOVO_USER.profissao}
    Wait Until Page Contains    ${NOVO_USER.genero}
    Wait Until Page Contains    ${NOVO_USER.idade}
    

    Stop Gif Recording       ${caminho_gif}
    Stop Video Recording     ${caminho_video}
    
    
    Close Browser
