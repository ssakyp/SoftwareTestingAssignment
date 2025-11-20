*** Settings ***
Library  SeleniumLibrary
Variables   ./locators.py
Variables   ./testData.py
Variables   ./browserstack.py
*** Keywords ***
Log in
    Open Browser    ${baseUrl}    ${BROWSER}    remote_url=${REMOTE_URL}    options=${OPTIONS}
    Set Window Size    1280    1024
    Wait Until Element Is Visible    ${logInButton}    timeout=120
    Click Element    ${logInButton}
    Wait Until Element Is Visible    ${loginUsernameField}    timeout=120
    Input Text    ${loginUsernameField}    ${login}
    Input Password    ${loginPasswordField}    ${password}
    Click Element    ${logInFormButton}

Sign Up
    Open Browser    ${baseUrl}    ${BROWSER}    remote_url=${REMOTE_URL}    options=${OPTIONS}
    Set Window Size    1280    1024
    Wait Until Element Is Visible    ${signUpButton}    timeout=120
    Click Element    ${signUpButton}
    Wait Until Element Is Visible    ${signUpUsername}    timeout=120
    Input Text    ${signUpUsername}    ${login}
    Input Password    ${signUpPassword}    ${password}
    Click Element    ${signUpFormButton}

Log out
    Wait Until Element Is Visible    ${logOutButton}    timeout=120
    Click Element    ${logOutButton}

Close Browser
    Close All Browsers

Buy Product
    Wait Until Element Is Visible    ${productSamsungGalaxyS6}    timeout=80
    Click Element    ${productSamsungGalaxyS6}
    Wait Until Element Is Visible    ${addToCartButton}    timeout=80
    Click Element    ${addToCartButton}
    Handle Alert    accept
    Wait Until Element Is Visible    ${cartButton}    timeout=80
    Click Element    ${cartButton}
    Wait Until Element Is Visible    ${placeOrderButton}    timeout=80
    Click Element    ${placeOrderButton}
    Wait Until Element Is Visible    ${orderName}    timeout=80
    Input Text    ${orderName}    Sultan Sakyp
    Input Text    ${orderCountry}    Kazakhstan
    Input Text    ${orderCity}    Almaty
    Input Text    ${orderCard}    1234 5678 9012 3456
    Input Text    ${orderMonth}    10
    Input Text    ${orderYear}    2025
    Click Element    ${purchaseButton}
    Wait Until Page Contains    Thank you for your purchase!    timeout=80
    Wait Until Element Is Visible    ${okButton}    timeout=80
    Click Element    ${okButton}