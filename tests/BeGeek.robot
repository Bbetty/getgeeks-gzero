*Settings*
Documentation       Suite de Teste para o Be Geek

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session



*Test Cases*
Be a Geek
    [Tags]      be_geek     smoke

    ${user}    Factory User     faker    
    Do Login    ${user}

    Go to Geek Form
    # Fill Geek Form                  ${user}[geek_profile]
    # Submit Geek Form
    # Geek Form Should Be Success     