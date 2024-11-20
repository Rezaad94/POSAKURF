*** Settings ***
Resource        ../../../Routes/appRoutes.robot

*** Variables ***
# list karyawan element #
${daftarKaryawanFTUI}                    xpath=//android.view.View[@content-desc="Tambahkan karyawan Anda melalui fungsi tombol ini"]
${lewatiButtonDaftarKaryawanFTUI}        xpath=//android.view.View[@content-desc="Lewati"]
${lanjutkanButtonDaftarKaryawanFTUI}     xpath=//android.view.View[@content-desc="Lanjutkan"]
${viewGajiKaryawanElement}               xpath=//android.widget.Switch
${detailFirstKaryawanElement}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View/android.view.View[1]
${tambahKaryawanButton}                  xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]
${containTextGajiBulanan}                //android.view.View[contains(@content-desc, "Gaji Bulanan")]
${searchKaryawanElement}                 xpath=//android.widget.EditText[@text="Cari karyawan"]

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

# ubah PIN page
${newPINElement}                         xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.EditText[1]
${newPINKonfirmation}                    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.EditText[2]
${simpanPINButton}                       xpath=//android.view.View[@content-desc="Simpan"]
${selesaiPopUpPINButton}                    xpath=//android.widget.Button[@content-desc="Selesai"]


# upload slip gaji page
${uploadSlipGajiElement}                 xpath=//android.view.View[@content-desc="Upload Foto"]
${submitSlipGajiButton}                  xpath=//android.view.View[@content-desc="Upload Bukti"]
${yaPopUpKonfirmationUploadGaji}          xpath=//android.widget.Button[@content-desc="Ya"]



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
    ${count}     Get Matching Xpath Count      ${containTextGajiBulanan}
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

Verify karyawan deactivated
    Element Should Be Visible    ${activateKaryawanButton}
    Sleep    4s
    # Page Should Contain Text  ${deactivateSuccessWarningMessage}
    # Wait Until Page Does Not Contain   ${deactivateSuccessWarningMessage}

Click in button Activated karyawan
    Element Should Be Visible    ${activateKaryawanButton}
    Click Element    ${activateKaryawanButton}

Verify karyawan activated
    Element Should Be Visible    ${deacftiveKaryawanButton}
    Sleep    4s
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
    Element Should Be Visible    ${selesaiPopUpPINButton}
    Click Element    ${selesaiPopUpPINButton}
