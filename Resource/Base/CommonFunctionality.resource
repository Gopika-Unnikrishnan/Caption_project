*** Settings ***
Documentation   This file handles browser configuration, resuable scripts.

Library     SeleniumLibrary

*** Variables ***
${BROWSER_NAME}     chrome
${URL}  https://admin-demo.nopcommerce.com/

*** Keywords ***
Launch Browser And Navigate To URL
    IF  '${BROWSER_NAME}'=='edge'
        Set Local Variable    ${driver_name}     msedgedriver.exe
    ELSE IF  '${BROWSER_NAME}'== 'ff'
        Set Local Variable    ${driver_name}     geckodriver.exe
    ELSE
        Set Local Variable    ${driver_name}     chromedriver.exe
    END

    Open Browser    browser=${BROWSER_NAME}     executable_path=${EXECDIR}${/}driver${/}${driver_name}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    #Set Screenshot Directory    ${EXECDIR}${/}screenshot
    Go To    url=${URL}
