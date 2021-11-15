*Settings*
Documentation    Ações Base para ST Signup



*Keywords*
Go to Geek Form
    Click                      css=a[href="/be-geek"] >> text=Seja um Geek
    Wait For Elements State    css=.be-geek-form                              
    ...                        visible                                        5


Fill Geek Form
    [Arguments]    ${gp}

    Fill Text    xpath=//label[text()="Whatsapp"]/..//input         ${gp}[whats]
    Fill Text    xpath=//label[text()="Descrição"]/..//textarea     ${gp}[desc]

    ${locator_printer}    Set Variable          xpath=//label[text()="Conserta Impressora?"]/../select
    Sect Options By       ${locator_printer}    value                                                     ${gp}[printer_repair]

    ${locator_work}    Set Variable       xpath=//label[text()="Modelo de Trabalho"]/../select
    Sect Options By    ${locator_work}    value                                                   ${gp}[work]

    Fill Text    xpath=//label[text()="Valor da sua hora"]/../input    ${gp}[cost]


Submit Geek Form
    Click    css=button >> text=Quero ser um Geek


Geek Form Should Be Success
    # [Arguments]     ${target}

    ${expsct_msg}    Set Variable    css=p >> text=Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu Whatsapp.

    Wait For Elements State    ${expsct_msg}    visible    5


