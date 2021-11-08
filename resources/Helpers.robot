*Settings*
Documentation    Teste Users


*Keywords*
Add Users From Database
    [Arguments]    ${user}

    Connect To Postgress            
    Insert User Database         ${user}
    Users Seed
    Disconnect From Database


Do Login
    [Arguments]    ${user}

    Go To Login Form
    Fill Login Form              ${user}  
    Submit Login Form
    User Should Be Logged In     ${user}[name] ${user}[lastname] 
