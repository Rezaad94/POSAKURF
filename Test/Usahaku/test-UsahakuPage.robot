*** Settings ***
Resource                ../../Routes/appRoutes.robot
Documentation           Testcases Usahaku
Suite Setup             Setup and open dialer Android App
Suite Teardown          Close mobile Application

*** Test Cases ***
TC001 - Login with Valid Phone and PIN +628.. Format
    [Tags]    Positive Cases
    splashScreenPage.Click Lewati Button in Splash Screen
    loginPage.Navigate to login page
    loginPage.Input Phone Number    ${ownerPhone62}
    loginPage.Input PIN    ${ownerPIN}
    loginPage.Click Masuk Button
    loginPage.Verify Navigate to Home Page

TC002 - Navigate to Usahaku Page
    [Tags]    Positive Cases
    homePage.Click lewati button in Atur Keuangan Pop Up if appear
    usahakuPage.Click in Usahaku menu bar
    usahakuPage.Verify in usahaku page

TC003 - Edit Usaha Name
    [Tags]    Positive Cases
    usahakuPage.Click in update usaha
    usahakuPage.Edit usaha Name
    daftarPelangganPage.Scroll down in page
    usahakuPage.Click in Simpan Perubahan Button
    usahakuPage.Click ya in pop up konfirmation usahaku edit
    usahakuPage.Input PIN edit Usahaku    ${ownerPIN}
    usahakuPage.Click Lanjutkan Button Edit Usahaku
    
