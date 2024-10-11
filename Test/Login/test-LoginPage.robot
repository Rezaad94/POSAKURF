*** Settings ***
Resource                ../../Routes/appRoutes.robot
Documentation           Testcases Login Page
Task Tags               Login Page
Test Setup             Setup and open dialer Android App
Test Teardown          Close All Applications

*** Keywords ***

*** Test Cases ***
TC001 - Login with not Input Phone and PIN
    [Tags]     Negetive Cases
    splashScreenPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Click Masuk Button
    loginPage.Verify PIN not Inputed
    loginPage.Verify Phone Number not Inputed

TC002 - Login with not Input Phone and input PIN
    [Tags]     Negetive Cases
    splashScreenPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${empty}
    loginPage.Input PIN    ${ownerPIN}
    loginPage.Click Masuk Button
    loginPage.Verify Phone Number not Inputed

TC003 - Login with Input Phone and not input PIN
    [Tags]     Negetive Cases
    splashScreenPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${ownerPhone}
    loginPage.Click Masuk Button
    loginPage.Verify PIN not Inputed

TC004 - Login with Wrong PIN
    [Tags]     Negative Cases
    splashScreenPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${ownerPhone}
    loginPage.Input PIN    ${notRegisteredPIN}
    loginPage.Click Masuk Button
    loginPage.Verify Wrong input PIN
    loginPage.Click tutup Button Pop Up Login
        
TC005 - Login with not registered Phone
    [Tags]    Negative Cases
    splashScreenPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${notRegisteredPhone}
    loginPage.Input PIN    ${ownerPIN}
    loginPage.Click Masuk Button
    loginPage.Verify Phone Number not registered
    loginPage.Click tutup Button Pop Up Login

TC006 - Login with Inactive User
    [Tags]    Negative Cases
    splashScreenPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${inactiveKaryawanPhone}
    loginPage.Input PIN    ${inactiveKaryawanPIN}
    loginPage.Click Masuk Button
    loginPage.Verify User Not Active
    loginPage.Click tutup Button Pop Up Login

TC007 - Login with Valid Phone and PIN 08.. Format
    [Tags]    Positive Cases
    splashScreenPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${ownerPhone}
    loginPage.Input PIN    ${ownerPIN}
    loginPage.Click Masuk Button
    loginPage.Verify Navigate to Home Page

TC008 - Login with Valid Phone and PIN +628.. Format
    [Tags]    Positive Cases
    splashScreenPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${ownerPhone62}
    loginPage.Input PIN    ${ownerPIN}
    loginPage.Click Masuk Button
    loginPage.Verify Navigate to Home Page