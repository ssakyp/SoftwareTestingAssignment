*** Settings ***
Library  SeleniumLibrary
Variables   ./locators.py
Variables   ./testData.py
*** Keywords ***
Log in
    Open Browser    ${baseUrl}      Chrome
    wait until page contains element    ${loginButton}    timeout=80      error=loginButtonNotFound
    sleep   2s
    click element   ${loginButton}
    wait until page contains element     ${loginUsernameField}    timeout=80      error=loginButtonNotFound
    sleep   2s
    input text      ${loginUsernameField}      ${login}
    input password    ${loginPasswordField}      ${password}
    sleep    2s
    click element    ${loginFormButton}
    sleep    2s

Sign Up
    Open Browser    ${baseUrl}      Chrome
    wait until page contains element    ${signUpButton}    timeout=80      error=loginButtonNotFound
    sleep   1s
    click element   ${signUpButton}
    wait until page contains element     ${signUpUsername}    timeout=80      error=loginButtonNotFound
    sleep   1s
    input text    ${signUpUsername}    ${login}
    input password    ${signUpPassword}    ${password}
    sleep    2s
    click element    ${signUpFormButton}
    sleep    3s

Log out
    click element   ${logOutButton}
    sleep    2s

Close Browser
    Close All Browsers

Buy Product
    click element    ${productSamsungGalaxyS6}
    wait until page contains element    ${addToCartButton}    timeout=80
    sleep    2s
    click element    ${addToCartButton}
    sleep    2s
    Handle Alert    accept
    click element    ${cartButton}
    sleep    2s
    wait until page contains element    ${placeOrderButton}    timeout=80
    sleep    2s
    click element    ${placeOrderButton}
    wait until page contains element    ${orderName}    timeout=80      error=loginButtonNotFound
    sleep    2s
    input text    ${orderName}       Sultan Sakyp
    input text    ${orderCountry}    Kazakhstan
    input text    ${orderCity}       Almaty
    input text    ${orderCard}       1234 5678 9012 3456
    input text    ${orderMonth}      10
    input text    ${orderYear}       2025
    sleep    2s
    click element    ${purchaseButton}
    wait until page contains    Thank you for your purchase!    timeout=80
    sleep    2s
    wait until page contains element    ${okButton}    timeout=80      error=loginButtonNotFound
    click element    ${okButton}
    sleep    2s