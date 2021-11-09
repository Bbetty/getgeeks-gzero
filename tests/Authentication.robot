*Settings*
Documentation    ST Autenticação de Usuários

Resource    ${EXECDIR}/resources/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session




*Test Cases*
User Login
    [Tags]    user_login 

    ${user}    Factory User    login

    Go To Login Form
    Fill Login Form             ${user}                            
    Submit Login Form
    User Should Be Logged In    ${user}[name] ${user}[lastname]


Invalid User
    [Tags]    inval_login    invaluser

    ${u}    Create Dictionary    email=failemail@getgeeks.com    password=pwdnotchecked

    Go To Login Form
    Fill Login Form            ${u}
    Submit Login Form
    Modal Content Should Be    Usuário e/ou senha inválidos.    


Wrong Format Email User
    [Tags]    inval_login    wrongemail

    ${u}    Factory User    wrong_email

    Go To Login Form
    Fill Login Form               ${u}
    Submit Login Form
    Should Be Field Type Email    


Ignore All Fields Login
    [Tags]    attempt_login    ignallogin

    @{expected_alerts}    Create List
    ...                   E-mail obrigatório
    ...                   Senha obrigatória

    Go To Login Form
    Submit Login Form
    # Alert Spans Login Should Be    ${expected_alerts}
    Alert Spans MSG Should Be    ${expected_alerts}


Ignore Field Login User
    [Tags]    attempt_login    ignlogin

    ${u}    Create Dictionary    email=${EMPTY}    password=test321

    @{expected_alerts}    Create List
    ...                   E-mail obrigatório
    ...                   Senha obrigatória

    Go To Login Form
    Fill Login Form Email       ${u}                     
    Submit Login Form           
    Alert Span Should Be MSG    ${expected_alerts}[1]

Ignore Field Password User
    [Tags]    attempt_login    ignpass

    ${u}    Create Dictionary    email=test@test.io    password=${EMPTY} 

    @{expected_alerts}    Create List
    ...                   E-mail obrigatório
    ...                   Senha obrigatória

    Go To Login Form
    Fill Login Form Password    ${u} 
    Submit Login Form           
    Alert Span Should Be MSG    ${expected_alerts}[0]






