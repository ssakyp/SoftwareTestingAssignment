*** Settings ***
Resource  ../resources/resources.robot


*** Test Cases ***
TC_1_SIGN_UP
    Sign Up
    Close Browser

TC_2_LOGIN
    Log in

TC_3_BUY_PRODUCT
    Buy Product

TC_4_LOGOUT
    Log out
    Close Browser