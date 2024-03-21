*** Settings ***
Resource                ../Routes/appRoutes.robot
Documentation           Testcases Login Page
Task Tags               Login Page
Test Setup             Setup and open dialer Android Dagangan App
Test Teardown          Close All Applications

*** Keywords ***

*** Test Cases ***
Login with not Input Phone and PIN
    [Tags]     Negetive Cases
    loginPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Click Masuk Button
    loginPage.Verify PIN not Inputed
    loginPage.Verify Phone Number not Inputed

Login with not Input Phone and input PIN
    [Tags]     Negetive Cases
    loginPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input PIN    ${ownerPIN}
    loginPage.Click Masuk Button
    loginPage.Verify Phone Number not Inputed

Login with Input Phone and not input PIN
    [Tags]     Negetive Cases
    loginPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${ownerPhone}
    loginPage.Click Masuk Button
    loginPage.Verify PIN not Inputed

Login with Wrong PIN
    [Tags]     Negative Cases
    loginPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${ownerPhone}
    loginPage.Input PIN    ${notRegisteredPIN}
    loginPage.Click Masuk Button
    loginPage.Verify Wrong input PIN
    loginPage.Click tutup Button Pop Up Login
        
Login with not registered Phone
    [Tags]    Negative Cases
    loginPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${notRegisteredPhone}
    loginPage.Input PIN    ${ownerPIN}
    loginPage.Click Masuk Button
    loginPage.Verify Phone Number not registered
    loginPage.Click tutup Button Pop Up Login

# Login with Inactive User

Login with Valid Phone and PIN
    [Tags]    Positive Cases
    loginPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${ownerPhone}
    loginPage.Input PIN    ${ownerPIN}
    loginPage.Click Masuk Button
    loginPage.Verify Navigate to Home Page