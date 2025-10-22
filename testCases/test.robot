*** Settings ***
Resource  ../resources/resources.robot
Suite Teardown    Close Browser

*** Test Cases ***
TC_1_SIGN_UP
    Sign Up

TC_2_LOGIN
    Log in

TC_3_BUY_PRODUCT
    Buy Product

TC_4_LOGOUT
    Log out