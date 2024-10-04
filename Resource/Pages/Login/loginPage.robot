*** Settings ***
Resource        ../../../Routes/appRoutes.robot

*** Variables ***
${phoneNumberField}            xpath=//android.widget.EditText[@text="Nomor Handphone"]
# ${phoneNumberField}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]
${phoneNumberFieldAfterClick}  xpath=//android.widget.EditText[@text="Nomor Handphone +62xxxxxxxxxx"]
${PINField}                    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.EditText[2]
# ${PINField}                    xpath=//android.widget.ScrollView/android.widget.EditText[2]
${PINFieldAfterClick}          xpath=//android.widget.EditText[@text="|"]
${masukButton}                 xpath=//android.widget.Button[@content-desc="Masuk"]
# ${masukButton}                 id=Masuk

${okGoogle}                    id=android:id/button1
${masukHyperlink}              xpath=//android.view.View[@content-desc="Masuk"]

#home page
${homePageMenuBar}            xpath=//android.view.View[@content-desc="Home Tab 1 of 4"]
${welcomeText}                Selamat datang

#error Message
# ${notInputPhoneError}        xpath=//android.view.View[@content-desc="Isikan nomor telepon anda"]
# ${notInputPINError}          xpath=//android.widget.EditText[@text="Isikan nomor pin anda"]
${notInputPhoneError}        Isikan nomor telepon anda
${notInputPINError}          Isikan nomor pin anda
${wrongInputPINError}        PIN yang anda masukkan salah
${notRegisteredPhoneError}   Nomor Telepon yang Anda masukkan salah / tidak terdaftar.
${userNotActiveError}        Status User Tidak Aktif!

#pop up element
${tutupButtonPupUp}          xpath=//android.widget.Button[@content-desc="Tutup"]

*** Keywords ***
Navigate to login page
    Element Should Be Visible    ${masukHyperlink}  
    Click Element    ${masukHyperlink}   
    Sleep    1s

Input Phone Number
    [Arguments]  ${phoneNumber}
    Element Should Be Visible    ${phoneNumberField}
    Click Element    ${phoneNumberField}
    Input Text Into Current Element    ${phoneNumber}
    # Sleep    1s
    # Input Text    ${phoneNumberField}     ${phoneNumber}
    # Input Text   ${phoneNumberFieldAfterClick}     ${phoneNumber}
    Sleep    1s

Input PIN
    [Arguments]    ${PIN}
    Element Should Be Visible    ${PINField} 
    Click Element    ${PINField} 
    Sleep    1s
    Input Text    ${PINFieldAfterClick}     ${PIN}
    Sleep    1s

Click Masuk Button
    Click Element        ${masukButton}
    Sleep    1s  

Verify Navigate to Home Page
    Sleep    2s
    Page Should Contain Text    ${welcomeText}  
    Page Should Not Contain Element         ${phoneNumberField}

Verify Phone Number not Inputed
    # Element Should Be Visible    ${notInputPhoneError}
    Page Should Contain Text    ${notInputPhoneError}

Verify PIN not Inputed
    # Element Should Be Visible   ${notInputPINError}
    Page Should Contain Text      ${notInputPINError}

Verify Wrong input PIN
    Page Should Contain Text    ${wrongInputPINError}
    # Element Should Contain Text    ${PINField}     ${wrongInputPINError} 

Verify Phone Number not registered
    Page Should Contain Text    ${notRegisteredPhoneError}

Verify User Not Active
    Sleep    3s
    Page Should Contain Text    ${userNotActiveError} 

Click tutup Button Pop Up Login
    Click Element    ${tutupButtonPupUp} 