*** Settings ***
Resource                ../../Routes/appRoutes.robot
Documentation           Testcases Daftar Pelanggan
Task Tags               Daftar Pelanggan Page
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

TC002 - Create Pelanggan without input anything
    [Tags]    Negative Cases
    homePage.Click lewati button in Atur Keuangan Pop Up if appear
    homePage.Click in Daftar Pelanggan button
    daftarPelangganPage.Lewati daftar Pelanggan FTUI if appear
    daftarPelangganPage.Click add pelanggan button
    daftarPelangganPage.Submit Pelanggan
    daftarPelangganPage.Verify Error message correct appear    ${errorMessageEmptyNamePelanggan} 
    daftarPelangganPage.Verify Error message correct appear    ${errorMessageEmptyPhonePelanggan}

TC003 - Create Pelanggan without Photo and Document
    [Tags]    Negative Cases
    daftarPelangganPage.Input pelanggan name    ${namaPelanggan} 
    daftarPelangganPage.Input phone Pelanggan
    daftarPelangganPage.Scroll down in page
    daftarpelangganPage.Input email pelanggan
    daftarPelangganPage.Submit Pelanggan

TC004 - Create Pelanggan with Photo and Document
    [Tags]    Positive Cases
    daftarPelangganPage.Click add pelanggan button
    daftarPelangganPage.Click upload photo field
    daftarPelangganPage.Take photo by camera
    daftarPelangganPage.Input pelanggan name     ${namaPelanggan} 
    daftarPelangganPage.Input phone Pelanggan
    daftarPelangganPage.Click upload document field
    daftarPelangganPage.Take photo by camera
    daftarPelangganPage.Scroll down in page
    daftarpelangganPage.Input email pelanggan
    daftarPelangganPage.Submit Pelanggan
    daftarPelangganPage.Wait pop Up submit gone

TC005 - Delete Pelanggan
    [Tags]    Positive Cases
    daftarPelangganPage.Click in first pelanggan in list
    daftarPelangganPage.Scroll down in page
    daftarPelangganPage.Click in delete pelanggan button

TC007 - Search pelanggan
    [Tags]    Positive Cases
    daftarPelangganPage.Search pelanggan    ${namaPelanggan}
    daftarPelangganPage.Verify search correct    ${namaPelanggan}

TC008 - View Customer debt
    [Tags]    Positive Cases
    daftarPelangganPage.Click in toogle button Customer debt
    daftarpelangganPage.Verify Customer debt appear

TC006 - Edit Pelanggan name
    [Tags]    Positive Cases
    daftarPelangganPage.Click in first pelanggan in list
    daftarPelangganPage.Verify in detail pelanggan page
    daftarPelangganPage.Click in update pelanggan button
    daftarPelangganPage.Input pelanggan name        ${namaPelangganEdited}
    daftarPelangganPage.Scroll down in page
    daftarPelangganPage.Submit Pelanggan
    daftarPelangganPage.Wait pop Up submit gone
    daftarPelangganPage.Verify Nama Pelanggan Edited