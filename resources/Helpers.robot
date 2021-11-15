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
    [Arguments]    ${geek}

    Go To Login Form
    Fill Login Form              ${geek}[email]     ${geek}[password]
    Submit Login Form
    User Should Be Logged In     ${geek}[name] ${geek}[lastname] 
