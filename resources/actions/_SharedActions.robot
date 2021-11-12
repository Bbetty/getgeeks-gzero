*Settings*
Documentation    Ações Base para ST Signup



*Keywords*
Modal Content Login Should Be
    [Arguments]    ${expected_text}

    ${title}      Set Variable    css=.swal2-title 
    ${content}    Set Variable    css=.swal2-html-container    

    Wait For Elements State    ${title}      visible    5
    Get Text                   ${title}      equal      Oops...
    Wait For Elements State    ${content}    
    ...                        visible       5
    Get Text                   ${content}    equal    ${expected_text}    


Form Success Should Be
    [Arguments]     ${target}

    ${expsct_msg}      Set Variable      css=p >> text=${target}

    Wait For Elements State     ${expsct_msg}     visible    5
    