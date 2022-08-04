*** Settings ***
#Library     SeleniumLibrary
Library     Selenium2Library
Library     DatabaseLibrary
Variables    ../Pageobjects/Locators.py


*** Variables ***


*** Keywords ***
Open my browser
    [Arguments]    ${Scadiv2url}    ${Browsername}
    open browser  ${Scadiv2url}     ${Browsername}
    maximize browser window
    delete all cookies
    set browser implicit wait  20 s



Close my browser
    close browser

Enter_Userid
    [Arguments]  ${Userid}
    input text    ${Username_txt}    ${Userid}

Enter_Userpwd
    [Arguments]  ${Userpwd}
    double click element  ${Password_txt}
    sleep  3
    input text  ${Password_txt}     ${Userpwd}

Click_loginbtn
    click button  ${Login_button}
    sleep  2

Logout_from_scadiv2
    click element  ${logout_user}
    log to console  Clicked on logout
    sleep   2
    wait until element is visible  ${Logout_user_yes}
    log to console  yes visible
    sleep   2
    double click element  ${Logout_user_yes}
    log to console  clicked on yes
    log  successfully logout

Verify_login
    ${Login_Error_test}  get text  //div[@class='ui-toast-detail']
    run keyword if    '${Login_Error_test}' == "Please contact IT support"  Login_error_1
      ...   ELSE     run keyword if  '${Login_Error_test}' == "Something went wrong Please try again after some time."  Login_error_2
      ...   ELSE    run keyword if  '${Login_Error_test}' == "Login Successful. Welcome to Dashboard"   Successfully_Login





Login_error_1
    log  Invalid Login

Login_error_2
    log  Invalid Login

Successfully_Login
    log  Successfully_Login

404_page_not_found
    log  404 Page Not Found
