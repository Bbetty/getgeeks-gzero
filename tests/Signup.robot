
*Settings*
Documentation    ST Novos Usuários

Resource    ${EXECDIR}/resources/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session


*Test Cases*
Register a New User
    [Tags]    new_user    

    ${user}    Factory User     faker

    Go To Signup Form            
    Fill Signup Form             ${user}
    Submit Signup Form
    User Should Be Registered
    Go Back Home


Duplicated User
    [Tags]    exection_signup    dup_email

    ${user}     Factory User     faker
    Add Users From Database    ${user}

    Go To Signup Form          
    Fill Signup Form           ${user}
    Submit Signup Form
    Modal Content Should Be    Já temos um usuário com o e-mail informado.


New User Wrong Format Email
    [Tags]    exection_signup

    ${user}     Factory User    wrong_email

    Go To Signup Form           
    Fill Signup Form            ${user}
    Submit Signup Form
    Alert Span Should Be MSG    O email está estranho


New User Ignore All Fields
    [Tags]    exection_signup    igallf

    @{expected_alerts}    Create List
    ...                   Cadê o seu nome?
    ...                   E o sobrenome?
    ...                   O email é importante também!
    ...                   Agora só falta a senha!

    Go To Signup Form
    Submit Signup Form
    Alert Spans MSG Should Be    ${expected_alerts}


New User Short Name
    [Tags]        exection_signup           short_name
    [Template]    Signup With Short Name

    1
    12
    a
    ab
    a1
    -1
    1#


New User Short Last Name
    [Tags]        exection_signup                short_last
    [Template]    Signup With Short Last Name

    1
    12
    a
    ab
    a1
    -1
    1#    


New User Short Pass
    [Tags]        exection_signup           short_pass
    [Template]    Signup With Short Pass

    1
    12
    123
    1234
    12345
    a
    ab
    abc
    abcd
    abcde
    a1
    a2c
    a2c4
    a2c4e
    -1
    '#1'
    @12


New User Limit Pass
    [Tags]        exection_signup           limit_pass
    [Template]    Signup With Limit Pass

    01234567890123456789012345678901234567
    abcdefghijklmnopqrstuvwyxzabcdefjhijk
    0123456789abcdefghijlmnopqrtsuvxzABCDE



*Keywords*
Signup With Short Last Name
    [Arguments]    ${short_last_name}

    ${user}    Create Dictionary
    ...        name=Name                lastname=${short_last_name}
    ...        email=emailast@teste.io    password=1234567Qa

    Go To Signup Form           
    Fill Signup Form            ${user}
    Submit Signup Form
    Alert Span Should Be MSG    Informe pelo menos 3 caracteres


Signup With Short Name
    [Arguments]    ${short_name}

    ${user}    Create Dictionary
    ...        name=${short_name}       lastname=Last Name
    ...        email=emainame@teste.io    password=1234567Qa

    Go To Signup Form           
    Fill Signup Form            ${user}
    Submit Signup Form
    Alert Span Should Be MSG    Informe pelo menos 3 caracteres


Signup With Short Pass
    [Arguments]    ${short_pass}

    ${user}    Create Dictionary
    ...        name=User                    lastname=Short Pass Letters
    ...        email=ushortpass@teste.io    password=${short_pass}

    Go To Signup Form           
    Fill Signup Form            ${user}
    Submit Signup Form
    Alert Span Should Be MSG    Informe uma senha com pelo menos 6 caracteres


Signup With Limit Pass
    [Arguments]    ${limit_pass}
    [Tags]         exection_signup    limit_pass

    ${user}    Create Dictionary
    ...        name=User                    lastname=Limit Pass
    ...        email=ushortpass@teste.io    password=${limit_pass}

    Go To Signup Form           
    Fill Signup Form            ${user}
    Submit Signup Form
    Alert Span Should Be MSG    Informe uma senha com no máximo 36 caracteres