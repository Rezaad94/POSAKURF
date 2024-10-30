*** Settings ***
Resource                ../../Routes/appRoutes.robot
Documentation           Testcases Splash Screen Page
Task Tags               Splash Screen Page
Suite Setup             Setup and open dialer Android App
Suite Teardown          Close All Applications

*** Keywords ***

*** Test Cases ***
TC001 - Navigate to Second Page Splash Screen
    [Tags]     Positive Cases
    splashScreenPage.Navigate to Next Page Splash Screen
    splashScreenPage.Verify Navigate to Page 2 Splash Screen

TC002 - Navigate to Third Page Splash Screen
    [Tags]     Positive Cases
    splashScreenPage.Navigate to Next Page Splash Screen
    splashScreenPage.Verify Navigate to Page 3 Splash Screen

TC003 - Finish Splash Screen
    [Tags]     Positive Cases
    splashScreenPage.Click Selesai Button Spalsh Screen
    splashScreenPage.Verify finish Splash Screen