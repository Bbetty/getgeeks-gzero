*Settings*
Documentation    ST Autenticação de Usuários

Resource    ${EXECDIR}/resources/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session



*Variables*
@{EXPECTED_ALERT}    Create List
                     ...            E-mail obrigatório
                     ...            Senha obrigatória

@{EXPECTED_MSG}    Usuário e/ou senha inválidos.



*Test Cases*
User Login
    [Tags]    user_login 

    ${user}    Factory Login User

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
    Modal Content Should Be    @{EXPECTED_MSG}    


Wrong Format Email User
    [Tags]    inval_login    wrongemail

    ${u}    Factory Wrong Email

    Go To Login Form
    Fill Login Form               ${u}
    Submit Login Form
    Should Be Field Type Email    


# Invald Password User
#    [Tags]    inval_login    invalpass

#    ${user}    Factory Login User

#    Go To Login Form
#    Fill Login Form            ${user}[email]          ${u}
#    Submit Login Form
#    Modal Content Should Be    ${EXPECTED_ALERT}[2]    


Ignore All Fields Login
    [Tags]    attempt_login    ignallogin

    @{expected_alerts}    Create List
    ...                   E-mail obrigatório
    ...                   Senha obrigatória

    Go To Login Form
    Submit Login Form
    Alert Spans Login Should Be    ${expected_alerts}


Ignore Fields Login User
    [Tags]    attempt_login    ignlogin

    @{expected_alerts}    Create List
    ...                   E-mail obrigatório
    ...                   Senha obrigatória

    ${user}    Factory Login User
    # ${user}    Create Dictionary
    # ...        email=
    # ...        password=pwd123

    Go To Login Form
    Fill Login Form Password          ${user}                  
    Submit Login Form                 
    Alert Span Login Should Be MSG    ${expected_alerts}[0]


Ignore Fields Password User
    [Tags]    attempt_login    ignpass

    # ${user_null}     Factory Empty Fields
    ${user}    Factory Login User

    @{expected_alerts}    Create List
    ...                   E-mail obrigatório
    ...                   Senha obrigatória
    # ${user}    Create Dictionary
    # ...        email=marques.bbetty@gmail.com
    # ...        password=

    Go To Login Form
    Fill Login Form Email             ${user}
    Submit Login Form                 
    Alert Span Login Should Be MSG    ${expected_alerts}[1]
