*Settings*
Documentation       Ações Compartilhadas para as Suites de Testes



*Keywords*
Modal Content Should Be
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


Alert Span Should Be MSG
    [Arguments]     ${expected_alert}

    Wait For Elements State     css=span[class=error] >> text=${expected_alert}
    ...                         visible     5
 

Alert Spans MSG Should Be
    [Arguments]     ${expected_alerts}

    @{got_alerts}   Create List

    ${spans}        Get Elements       xpath=//span[@class="error"]

    FOR   ${span}   IN    @{spans}

        ${text}             Get Text            ${span}
        Append To List      ${got_alerts}       ${text}

    END

    Lists Should Be Equal       ${expected_alerts}      ${got_alerts}