*** Settings ***
Library  Dialogs
Library  Selenium2Library


*** Test Cases ***
Dialogs
    ${H}=   get value from user  Enter OTP
    log to console  ${H}