*** Settings ***
Resource        ../../../Routes/appRoutes.robot

*** Variables ***
${usahakuIconElement}                    xpath=//android.widget.Button[contains(@content-desc, "Usahaku")]
#  xpath=//android.widget.Button[@content-desc="Usahaku Tab 3 of 4"]
${switchButton}                          xpath=//android.widget.Switch
${updateUsahakuElement}                  xpath=//android.view.View[@content-desc="Update"]

# Edit Info Usaha Page#
${ubahFotoUsahaElement}                  xpath=//android.widget.Button[@content-desc="Ganti Foto"]
${namaUsahaElement}                      xpath=//android.widget.EditText[1]
${lokasiUsahaElement}                    xpath=//android.widget.EditText[contains(@text, "Lokasi Usaha")]
${pajakElement}                          xpath=//android.widget.EditText[contains(@text, "Pajak (%)")]
${searchTagElement}                      xpath=//android.widget.ScrollView/android.view.View[4]
${addTagElement}                         xpath=//android.widget.ScrollView/android.view.View[5]
${simpanUsahakuButton}                   xpath=//android.widget.Button[@content-desc="Simpan Perubahan"]
${yaPopUpKonfirmationUsahakuEdit}        xpath=//android.widget.Button[@content-desc="Ya"]
${textNamaUsahakuEdit}                   Usahaku Edit Test
${inputPINUsahakuElement}                xpath=android.widget.EditText
${lanjutkanButtonEditUsahaku}            xpath=//android.view.View[@content-desc="Lanjutkan"]

*** Keywords ***
Click in Usahaku menu bar
    Sleep    1s
    Element Should Be Visible    ${usahakuIconElement}
    Click Element    ${usahakuIconElement}
    Sleep    2s

Verify in usahaku page
    Page Should Contain Text    Informasi Usaha
    Element Should Be Visible    ${updateUsahakuElement}

Click in update usaha 
    Click Element    ${updateUsahakuElement}
    Sleep    1s
    Page Should Contain Text    Edit Info Usaha

Edit usaha Name
    ${usahaName}=     Generate Usaha Name    ${textNamaUsahakuEdit}
    Element Should Be Visible    ${namaUsahaElement}
    Click Element    ${namaUsahaElement}
    Clear Text    ${namaUsahaElement}
    Input Text        ${namaUsahaElement}       ${usahaName}

Generate Usaha Name
    [Arguments]                  ${textNamaUsahakuEdit}
    ${lastName} =  Generate Random String  4  [LETTERS]
    ${usahaName} =   Set Variable  ${textNamaUsahakuEdit} ${lastName}
    [Return]     ${usahaName}

Click in Simpan Perubahan Button
    Element Should Be Visible    ${simpanUsahakuButton}
    Click Element    ${simpanUsahakuButton}
    Sleep    1s

Click ya in pop up konfirmation usahaku edit
    Element Should Be Visible    ${yaPopUpKonfirmationUsahakuEdit}
    Click Element    ${yaPopUpKonfirmationUsahakuEdit}
    Sleep    1s

Input PIN edit Usahaku
    [Arguments]    ${inputPIN}
    Element Should Be Visible    ${inputPINUsahakuElement}    
    Click Element    ${inputPINUsahakuElement}    
    Input Text    ${inputPINUsahakuElement}        ${inputPIN}

Click lanjutkan button edit Usahaku
    Element Should Be Visible    ${lanjutkanButtonEditUsahaku}
    Click Element    ${lanjutkanButtonEditUsahaku}
    Sleep    1s