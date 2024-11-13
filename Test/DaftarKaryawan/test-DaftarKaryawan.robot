*** Settings ***
Resource                ../../Routes/appRoutes.robot
Documentation           Testcases Daftar Karyawan
Task Tags               Daftar Karyawan Page
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

TC002 - Navigate in to Daftar karyawan list page
    [Tags]    Positive Cases
    homePage.Click lewati button in Atur Keuangan Pop Up if appear
    homePage.Click in lain - lain menu
    homePage.Click in Daftar Karyawan Button
    daftarKaryawanPage.Lewati daftar Karyawan FTUI if appear
    daftarKaryawanPage.Verify in Daftar karyawan list page

TC003 - View Gaji Karyawan
    [Tags]    Positive Cases
    daftarKaryawanPage.Click in toogle button Gaji Bulanan
    daftarKaryawanPage.Verify Gaji Bulanan Karyawan appear

TC004 - Deactivated karyawan
    [Tags]    Positive Cases
    daftarKaryawanPage.Click in first karyawan in list
    daftarPelangganPage.Scroll down in page
    daftarKaryawanPage.Click in button Deactivated Karyawan
    daftarKaryawanPage.Click ya in pop up confirmation karyawan activation
    daftarKaryawanPage.Verify karyawan deactivated

TC005 - Activated Karyawan
    daftarkaryawanPage.Click in button Activated karyawan
    daftarKaryawanPage.Click ya in pop up confirmation karyawan activation
    daftarKaryawanPage.Verify karyawan activated
    