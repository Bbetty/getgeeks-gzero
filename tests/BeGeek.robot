*Settings*
Documentation       Suite de Teste para o Be Geek

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session



*Test Cases*
Be a Geek

    ${user}     Factory Login User 
    ${geek}     Factory Be Geek

    Do Login    ${user}

    Go to Geek Form
    Fill Geek Form    ${geek}
    Submit Geek Form
    Geek Form Should Be Success     