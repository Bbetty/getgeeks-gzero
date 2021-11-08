*Settings*
Documentation    Ações Base para ST Signup



*Variables*
${INPUT_EMAIL}    id=email
${INPUT_PASS}     id=password



*Keywords*
Go To Login Form
    # [Arguments]    ${user}

    ${expected_text}    Set Variable    Fazer login
    ${receive_text}     Set Variable    xpath=//form[@class="login-form"]/h1    

    Go To                      ${BASE_URL}
    Wait For Elements State    ${receive_text} 
    # >> text=Fazer login
    ...                        visible             5
    Get Text                   ${receive_text}     equal    ${expected_text}    


Fill Login Form
    [Arguments]    ${user}    

    Fill Text    ${INPUT_EMAIL}    ${user}[email]
    Fill Text    ${INPUT_PASS}     ${user}[password]


Submit Login Form
    Click    css=.submit-button >> text=Entrar


User Should Be Logged In
    [Arguments]    ${expected_fullname}

    ${locator}    Set Variable    css=a[href="/profile"] 

    Wait For Elements State    ${locator}    visible    5
    Get Text                   ${locator}    equal      ${expected_fullname}


Should Be Field Type Email
    Get Property    ${INPUT_EMAIL}    type    equal    email


Modal Content Login Should Be
    [Arguments]    ${expected_text}

    ${title}      Set Variable    css=.swal2-title 
    ${content}    Set Variable    css=.swal2-html-container    

    Wait For Elements State    ${title}      visible    5
    Get Text                   ${title}      equal      Oops...
    Wait For Elements State    ${content}    
    ...                        visible       5
    Get Text                   ${content}    equal      ${expected_text}    


Alert Span Login Should Be MSG
    [Arguments]    ${expected_alert}

    Wait For Elements State    css=span[class=error] >> text=${expected_alert}
    ...                        visible                                            5


Alert Spans Login Should Be
    [Arguments]    ${expected_alerts}

    @{got_alerts}    Create List

    ${spans}    Get Elements    xpath=//span[@class="error"]

    FOR    ${span}    IN    @{spans}

    ${text}           Get Text         ${span}
    Append To List    ${got_alerts}    ${text}

    END

    Lists Should Be Equal    ${expected_alerts}    ${got_alerts}


Fill Login Form Password
    [Arguments]    ${user}    

    Fill Text    ${INPUT_PASS}     ${user}[password]


Fill Login Form Email
    [Arguments]    ${user}    

    Fill Text    ${INPUT_EMAIL}    ${user}[email]
    