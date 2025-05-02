*** Settings ***
Resource        ../../../Routes/appRoutes.robot

*** Variables ***
${lewatiButton}                xpath=//android.widget.Button[@content-desc="Lewati"]
${arrowToNext}                 xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]//android.widget.Button[2]
${page1Title}                  Tansaksi Mudah
${page1Wording}                Buat mesin kasir hanya dengan genggamanmu
${page2Title}                  Scan Barang
${page2Wording}                Tidak perlu membeli alat scan produk,
${page2Wordingline2}           bisa Anda lakukan dengan hp anda    
${page3Title}                  Nota Pembelian
${page3Wording}                Nota pembelian bisa Anda kirim melalui email pelanggan Anda, tidak perlu mengeluarkan uang untuk beli printer
${selesaiSplashButton}         xpath=//android.widget.Button[@content-desc="Selesai"]

${allowLocationPermission}     id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
${registerTitlePage}           Ayo Daftar 
${registerTitlePageLine2}      Sekarang Juragan!


*** Keywords ***
Click Lewati Button in Splash Screen
    Element Should Be Visible    ${lewatiButton}  
    Click Element    ${lewatiButton}  
    Sleep    2s

Navigate to Next Page Splash Screen
    Element Should Be Visible    ${arrowToNext}
    Click Element    ${arrowToNext}

Verify Navigate to Page 2 Splash Screen
    Sleep    1s
    Page Should Contain Text    ${page2Title}
    Page Should Contain Text    ${page2Wording}
    Page Should Contain Text    ${page2Wordingline2}

Verify Navigate to Page 3 Splash Screen
    Page Should Contain Text    ${page3Title}
    Page Should Contain Text    ${page3Wording}
    Element Should Be Visible   ${selesaiSplashButton} 

Click Selesai Button Spalsh Screen
    Click Element    ${selesaiSplashButton}

Verify finish Splash Screen
    Sleep    1s
    # Click Element    ${allowLocationPermission} 
    Page Should Contain Text    ${registerTitlePage}
    Element Should Be Visible    ${masukHyperlink} 
    

