*** Settings ***
Resource        ../../../Routes/appRoutes.robot

*** Variables ***
${phoneNumberField}            xpath=//android.widget.EditText[@text="Nomor Handphone"]
# ${phoneNumberField}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]
${phoneNumberFieldAfterClick}  xpath=//android.widget.EditText[@text="Nomor Handphone +62xxxxxxxxxx"]
${PINField}                    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]
${PINFieldAfterClick}          xpath=//android.widget.EditText[@text="|"]
${masukButton}                 xpath=//android.view.View[@content-desc="Masuk"]
${lewatiButton}                xpath=//android.widget.Button[@content-desc="Lewati"]
${okGoogle}                    id=android:id/button1
${masukHyperlink}              xpath=//android.view.View[@content-desc="Masuk"]

#home page
${homePageMenuBar}            xpath=//android.view.View[@content-desc="HomeTab 1 of 4"]
${welcomeText}                xpath=//android.view.View[@content-desc="Selamat datang di"]

#error Message
${notInputPhoneError}        xpath=//android.view.View[@content-desc="Isikan nomor telepon anda"]
${notInputPINError}          xpath=//android.widget.EditText[@text="Isikan nomor pin anda"]
${wrongInputPINError}        PIN yang anda masukkan salah
${notRegisteredPhoneError}   Nomor Telepon yang Anda masukkan salah / tidak terdaftar.

#pop up element
${tutupButtonPupUp}          xpath=//android.widget.Button[@content-desc="Tutup"]

*** Keywords ***
Click Lewati Button in Splash Screen
    Element Should Be Visible    ${lewatiButton}  
    Click Element    ${lewatiButton}  
    Sleep    1s

Navigate to login page
    Element Should Be Visible    ${masukHyperlink}  
    Click Element    ${masukHyperlink}   
    Sleep    1s

Input Phone Number
    [Arguments]  ${phoneNumber}
    Element Should Be Visible    ${phoneNumberField}
    Click Element    ${phoneNumberField}
    Sleep    1s
    Input Text    ${phoneNumberFieldAfterClick}      ${phoneNumber}
    # Input Text   ${phoneNumberField}     ${phoneNumber}
    Sleep    1s

Input PIN
    [Arguments]    ${PIN}
    Element Should Be Visible    ${PINField} 
    Click Element    ${PINField} 
    Input Text    ${PINFieldAfterClick}     ${PIN}
    Sleep    1s

Click Masuk Button
    Click Element        ${masukButton}
    Sleep    2s  

Verify Navigate to Home Page
    Element Should Be Visible    ${welcomeText}  
    Element Should Be Visible   ${homePageMenuBar}

Verify Phone Number not Inputed
    Element Should Be Visible    ${notInputPhoneError}

Verify PIN not Inputed
    Element Should Be Visible   ${notInputPINError}

Verify Wrong input PIN
    Text Should Be Visible    ${wrongInputPINError}
    # Element Should Contain Text    ${PINField}     ${wrongInputPINError} 

Verify Phone Number not registered
    Text Should Be Visible    ${notRegisteredPhoneError}

Click tutup Button Pop Up Login
    Click Element    ${tutupButtonPupUp} 