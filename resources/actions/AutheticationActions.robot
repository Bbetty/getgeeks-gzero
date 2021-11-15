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

    