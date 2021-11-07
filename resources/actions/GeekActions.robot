*Settings*
Documentation    Ações Base para ST Signup



*Keywords*
Go to Geek Form
    Click                      css=a[href="/be-geek"] >> text=Seja um Geek
    Wait For Elements State    css=.be-geek-form      
    ...                        visible               5


Fill Geek Form
    [Arguments]    ${geek}

    Fill Text    xpath=//label[text()="Whatsapp"]/..//input         ${geek}[whats]
    Fill Text    xpath=//label[text()="Descrição"]/..//textarea     ${geek}[desc]
    
    ${locater_printer}      Set Variable            xpath=//label[text()="Conserta Impressora?"]/../select
    Sect Options By         ${locater_printer}      value       ${geek}[printer_repair]

    ${locater_work}         Set Variable            xpath=//label[text()="Modelo de Trabalho"]/../select
    Sect Options By         ${locater_work}         value       ${geek}work]

    Fill Text               xpath=//label[text()="Valor da sua hora"]/../input      ${geek}[cost]

Submit Geek Form
    Click    css=button >> text=Quero ser um Geek


Geek Form Should Be Success
    [Arguments]     ${target}

    ${expsct_msg}      Set Variable      css=p >> text=Seu cadastro esta na nossa lista

    Wait For Elements State     ${expsct_msg}     visible    5