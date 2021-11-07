*Settings*
Documentation    Base para Suites de Teste

Library     Browser
Library     Collections  

Library     factories/Geeks.py 
Library     factories/Users.py 

Resource    actions/_SharedActions.robot
Resource    actions/AutheticationActions.robot
Resource    actions/GeekActions.robot
Resource    actions/SignupActions.robot

Resource    Database.robot
Resource    Helpers.robot



*Variables*
${BASE_URL}    https://getgeeks-bbetty.herokuapp.com



*Keywords*
Start Session
    New Browser    chromium         headless=False    slowMo=00:00:00
    New Page      ${BASE_URL} 
    Get Title      ==   Getgeeks - Encontre um Geek
    
    
Finish Session
    Take Screenshot


