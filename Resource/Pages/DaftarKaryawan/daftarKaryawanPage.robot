*** Settings ***
Resource        ../../../Routes/appRoutes.robot

*** Variables ***
# list karyawan element #
${daftarKaryawanFTUI}                    xpath=//android.view.View[@content-desc="Tambahkan karyawan Anda melalui fungsi tombol ini"]
${lewatiButtonDaftarKaryawanFTUI}        xpath=//android.widget.Button[@content-desc="Lewati"]
${lanjutkanButtonDaftarKaryawanFTUI}     xpath=//android.view.View[@content-desc="Lanjutkan"]
${viewGajiKaryawanElement}               xpath=//android.widget.Switch
${detailFirstKaryawanElement}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]//android.view.View[3]//android.view.View/android.view.View
${tambahKaryawanButton}                  xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]//android.view.View[1]//android.view.View[2]
${containTextGajiBulanan}                Gaji Bulanan
${searchKaryawanElement}                 xpath=//android.widget.EditText

# Detail Karyawan #
${deacftiveKaryawanButton}              xpath=//android.widget.Button[@content-desc="Non Aktifkan"]
${activateKaryawanButton}                xpath=//android.widget.Button[@content-desc="Aktifkan"]
${yaPopUpConfirmationActivationKaryawan}    xpath=//android.widget.Button[@content-desc="Ya"]
# ${activateSuccessWarningMessage}         xpath=//android.view.View[@content-desc="Status Karyawan Berhasil diaktifkan"]
# ${deactivateSuccessWarningMessage}       xpath=//android.view.View[@content-desc="Status Karyawan Berhasil dinonaktifkan"]
${activateSuccessWarningMessage}         Status Karyawan Berhasil diaktifkan
${deactivateSuccessWarningMessage}       Status Karyawan Berhasil dinonaktifkan
${ubahPINButton}                         xpath=//android.view.View[@content-desc="Ubah PIN"]
${uploadSlipGajiKaryawanButton}          xpath=//android.view.View[@content-desc="Upload Slip Gaji"]
${namaKaryawan}                          Karyawan
${updateKaryawanElement}                 xpath=//android.widget.ImageView[contains(@content-desc, 'Update')]


# ubah PIN page
${newPINElement}                         xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]//android.view.View[2]//android.widget.EditText[1]
${newPINKonfirmation}                    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]//android.view.View[2]//android.widget.EditText[2]
${simpanPINButton}                       xpath=//android.view.View[@content-desc="Simpan"]
${selesaiPopUpPINButton}                    xpath=//android.widget.Button[@content-desc="Selesai"]

# upload slip gaji page
${uploadSlipGajiElement}                 xpath=//android.view.View[@content-desc="Upload Foto"]
${submitSlipGajiButton}                  xpath=//android.view.View[@content-desc="Upload Bukti"]
${yaPopUpKonfirmationUploadGaji}          xpath=//android.widget.Button[@content-desc="Ya"]

# edit karyawan page
${nameKaryawanElement}                    xpath=//android.widget.EditText[contains(@text, 'Nama')]
${gajiKaryawanElement}                    xpath=//android.widget.EditText[contains(@text, 'Nominal Gaji')]
${ubahFotoKaryawanElement}                xpath=//android.widget.Button[@content-desc="Ubah Foto"]
${ubahFotoKTPElement}                     xpath=//android.widget.ScrollView/android.widget.ImageView[2]
${kasirHakAksesElement}                   xpath=//android.widget.ScrollView/android.widget.RadioButton[1]
${supervisorHakAksesElement}              xpath=//android.widget.ScrollView/android.widget.RadioButton[2]
${yaPopUPConfirmationEditKaryawan}        xpath=//android.widget.Button[@content-desc="Ya"]
${simpanKaryawanButton}                   xpath=//android.view.View[@content-desc="Simpan"]
${namaKaryawanEdited}                     Karyawan Edit
${gajiKaryawanEdited}                     1200000

*** Keywords ***
Verify in Daftar karyawan list page
    Page Should Contain Text       Kelola Karyawan

Lewati daftar Karyawan FTUI if appear
    ${present}=      Run Keyword And Return Status    Wait Until Page Contains Element   ${daftarKaryawanFTUI}
    Run Keyword If    '${present} = True'  Click Element    ${lewatiButtonDaftarKaryawanFTUI} 
    Sleep    2s

Click in toogle button Gaji Bulanan 
    Wait Until Element Is Visible    ${viewGajiKaryawanElement}  
    Click Element   ${viewGajiKaryawanElement}  
    Sleep    2s

Verify Gaji Bulanan Karyawan appear
    ${elements}=    Get Text    //android.view.View
    Log    ${elements}
    ${count}=    Evaluate    sum([1 for element in ${elements} if '${containTextGajiBulanan}' in element])    # Count occurrences
    Log    Text occurrences: ${count}
    IF    ${count} > 2
        Pass Execution    PASS
    ELSE
        Fail
    END

Click in first karyawan in list
    Click Element    ${detailFirstKaryawanElement}
    Sleep    2s

Verify in detail karyawan page
    Page Should Contain Text    Detail Karyawan

Click in button Deactivated Karyawan
    Element Should Be Visible    ${deacftiveKaryawanButton}
    Click Element    ${deacftiveKaryawanButton}
    Wait Until Page Does Not Contain    ${loadingSubmitPopUpText}

Verify karyawan deactivated
    Element Should Be Visible    ${activateKaryawanButton}
    Sleep    2s
    # Page Should Contain Text  ${deactivateSuccessWarningMessage}
    # Wait Until Page Does Not Contain   ${deactivateSuccessWarningMessage}

Click in button Activated karyawan
    Sleep    5s
    Element Should Be Visible    ${activateKaryawanButton}
    Click Element    ${activateKaryawanButton}

Verify karyawan activated
    Element Should Be Visible    ${deacftiveKaryawanButton}
    Sleep    2s
    # Page Should Contain Text    ${activateSuccessWarningMessage}
    # Wait Until Page Does Not Contain    ${activateSuccessWarningMessage}

Click ya in pop up confirmation karyawan activation
    Element Should Be Visible    ${yaPopUpConfirmationActivationKaryawan}
    Click Element    ${yaPopUpConfirmationActivationKaryawan}

Search karyawan
    Wait Until Element Is Visible    ${searchKaryawanElement}
    [Arguments]        ${namaKaryawan}
    Click Element    ${searchKaryawanElement}
    Input Text    ${searchKaryawanElement}    ${namaKaryawan}

Verify search correct
    [Arguments]     ${namaKaryawan}
    Page Should Contain Text    ${namaKaryawan}

Click in Upload Slip Gaji
    Element Should Be Visible    ${uploadSlipGajiKaryawanButton}
    Click Element    ${uploadSlipGajiKaryawanButton} 
    Sleep    2s

Click upload image gaji field
    Element Should Be Visible    ${uploadSlipGajiElement}
    Click Element    ${uploadSlipGajiElement}
    Sleep    1s

Submit slip gaji
    Click Element    ${submitSlipGajiButton}

Click ya in pop up confirmation upload gaji
    Click Element    ${yaPopUpKonfirmationUploadGaji}
    Sleep     3s

Click in Ubah PIN button
    Element Should Be Visible    ${ubahPINButton}
    Click Element    ${ubahPINButton}

Input New karyawan PIN
    [Arguments]        ${newKaryawanPIN}
    Sleep    2s
    Element Should Be Visible    ${newPINElement}
    Click Element    ${newPINElement}
    Input Text    ${newPINElement}    ${newKaryawanPIN}
    Click Element    ${newPINKonfirmation}
    Input Text    ${newPINKonfirmation}    ${newKaryawanPIN}

Click simpan new karyawan PIN button
    Element Should Be Visible    ${simpanPINButton}
    Click Element    ${simpanPINButton}

Click selesai in pop up confirmation change PIN karyawan
    Wait Until Page Does Not Contain    ${loadingSubmitPopUpText}
    Element Should Be Visible    ${selesaiPopUpPINButton}
    Click Element    ${selesaiPopUpPINButton}
    

Click in Update Karyawan button
    Element Should Be Visible    ${updateKaryawanElement}
    Click Element    ${updateKaryawanElement}

Fill in name karyawan element
    [Arguments]          ${namaKaryawan}
    Click Element    ${nameKaryawanElement}
    Input Text    ${nameKaryawanElement}    ${namaKaryawan}

Fill in gaji karyawan
    [Arguments]        ${gajiKaryawan}
    Click Element    ${gajiKaryawanElement}
    Input Text    ${gajiKaryawanElement}    ${gajiKaryawan} 

Click in simpan Karyawan Button
    Click Element    ${simpanKaryawanButton}  

Click in ya in pop up confirmation Karyawan
    Click Element    ${yaPopUPConfirmationEditKaryawan}