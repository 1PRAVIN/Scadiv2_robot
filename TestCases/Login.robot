*** Settings ***
#Library  SeleniumLibrary
Library  Selenium2Library
Resource  ../Resources/Login_keywords.robot
Variables  ../TestData/Testdata.py
Test Setup  Open my browser     ${Scadi_URL}    ${Browser_name}
Test Teardown  Close my browser

*** Test Cases ***
Enter_wrong_username_with_correct_password
    #[Arguments]  ${Login_user_incorrect_id} ${Login_user_correct_pwd}
    Enter_Userid    ${Login_user_incorrect_id}
    log     ${Login_user_incorrect_id}
    Enter_Userpwd   ${Login_user_correct_pwd}
    log     ${Login_user_correct_pwd}
    sleep  5
    Click_loginbtn
    Verify_login

Enter_Correct_username_with_wrong_password
    #[Arguments]  ${Login_user_correct_id}   ${Login_user_incorrect_pwd}
    Enter_Userid  ${Login_user_correct_id}
    log  ${Login_user_correct_id}
    Enter_Userpwd  ${Login_user_incorrect_id}
    log  ${Login_user_incorrect_pwd}
    sleep  3
    Click_loginbtn
    Verify_login

Enter_correct_userid_with_correct_password
    Enter_Userid  ${Login_user_correct_id}
    log  ${Login_user_correct_id}
    Enter_Userpwd  ${Login_user_correct_pwd}
    log  ${Login_user_correct_pwd}
    sleep  2
    Click_loginbtn
    Verify_login
    Logout_from_scadiv2






