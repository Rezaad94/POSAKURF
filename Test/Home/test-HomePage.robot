*** Settings ***
Resource                ../../Routes/appRoutes.robot
Documentation           Testcases Login Page
Task Tags               Home Page
Suite Setup             Setup and open dialer Android App
Suite Teardown          Close All Applications

*** Test Cases ***
TC001 - Login with Valid Phone and PIN +628.. Format
    [Tags]    Positive Cases
    splashScreenPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${ownerPhone62}
    loginPage.Input PIN    ${ownerPIN}
    loginPage.Click Masuk Button
    loginPage.Verify Navigate to Home Page

TC002 - Close the store
    homePage.Click lewati button in Atur Keuangan Pop Up if appear
    homePage.Slide buka button
    homePage.Click in Ya in pop up open or close store
    homePage.Verify store closed

TC003 - Open the store
    homePage.Slide tutup button
    homePage.Click in Ya in pop up open or close store
    homePage.Verify store open

    