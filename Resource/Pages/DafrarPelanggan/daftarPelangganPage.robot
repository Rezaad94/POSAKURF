*** Settings ***
Resource        ../../../Routes/appRoutes.robot

*** Variables ***
# list pelanggan element #
${daftarPelannganFTUI}                    xpath=//android.view.View[@content-desc="Tambahkan pelanggan Anda melalui fungsi tombol ini"]
${lewatiButtonDaftarPelangganFTUI}        xpath=//android.view.View[@content-desc="Lewati"]
${lanjutkanButtonDaftarPelangganFTUI}     xpath=//android.view.View[@content-desc="Lanjutkan"]
${tambahPelangganButton}                  xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]
${detailFirstPelangganElement}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View/android.view.View[1]
${searchPelangganElement}                 xpath=//android.widget.EditText[@text="Cari pelanggan"]

# tambah pelanggan element #
${tambahFotoPelangganElement}                        xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[1]
${ubahFotoPelangganElement}                          xpath=//android.widget.Button[@content-desc="Ubah Foto"]
${inputNamaLengkapPelangganElement}                  xpath=//android.widget.EditText[@text="Nama Lengkap"]
${inputNoHPPelangganElement}                         xpath=//android.widget.EditText[@text="Nomor handphone"]
${uploadIdentitasPelanngganElement}                  xpath=//android.view.View[@content-desc="Upload Identitas"]
${inputEmailPelangganElement}                        xpath=//android.widget.EditText[@text="Email"]
${simpanPelangganButtonElement}                      xpath=//android.view.View[@content-desc="Simpan"]
${errorMessageEmptyNamePelanggan}                    Nama depan belum diisi
${errorMessageEmptyPhonePelanggan}                   Isikan nomor telepon anda
${loadingSubmitPopUpText}                            Mohon tunggu

# camera #
${selectCameraPhoto}                                 xpath=//android.widget.Button[@content-desc="Kamera"]
${allowWhileUseAppCameraPermission}                  id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
${shutterCameraButton}                               id=com.android.camera2:id/shutter_button
${doneCameraPhoto}                                   id=com.android.camera2:id/done_button
${doneCropPhoto}                                     id=com.cloudiex.possaku:id/menu_crop

# detail Pelanggan #
${updatePelangganButton}                            xpath=//android.widget.Button[@content-desc="Update"]
${deletePelangganButton}                            xpath=//android.view.View[@content-desc="Hapus Pelanggan"]
${yaPopUpConfirmationDeletePelanggan}               xpath=//android.widget.Button[@content-desc="Ya"]
${namaPelanggan}                                    Pelanggan
${pelangganDetailElement}                           xpath=//android.view.View[@content-desc="Informasi Personal Nama Lengkap Pelanggan pERb Nomor HP +628226876429 Foto Identitas"]

*** Keywords ***
Lewati daftar Pelanggan FTUI if appear
    ${present}=      Run Keyword And Return Status    Wait Until Page Contains Element   ${daftarPelannganFTUI}
    Run Keyword If    '${present} = True'  Click Element    ${lewatiButtonDaftarPelangganFTUI}
    Sleep    2s

Click add pelanggan button
    Element Should Be Visible    ${tambahPelangganButton}
    Click Element    ${tambahPelangganButton}
    Sleep    2s

Input pelanggan name
    Element Should Be Visible    ${inputNamaLengkapPelangganElement}
    Click Element    ${inputNamaLengkapPelangganElement}
    ${lastName} =  Generate Random String  4  [LETTERS]
    Input Text    ${inputNamaLengkapPelangganElement}   Pelanggan ${lastName}
    

Input phone Pelanggan
    Element Should Be Visible    ${inputNoHPPelangganElement}
    Click Element    ${inputNoHPPelangganElement}
    ${randomPhone} =    Generate Random String     8     [NUMBERS]
    Input Text    ${inputNoHPPelangganElement}    082${randomPhone}

Input email pelanggan
    Element Should Be Visible    ${inputEmailPelangganElement}
    Click Element    ${inputEmailPelangganElement}
    ${lastName} =  Generate Random String  4  [LETTERS]
    Input Text    ${inputEmailPelangganElement}    ${lastName}@email.com

Submit Pelanggan
    Element Should Be Visible    ${simpanPelangganButtonElement}
    Click Element    ${simpanPelangganButtonElement}
    Sleep    3s

Verify Error message correct appear
    [Arguments]            ${errorMessage}
    Page Should Contain Text    ${errorMessage}

Allow permission camera if appear
    ${present}=      Run Keyword And Return Status       Wait Until Page Contains Element   ${allowWhileUseAppCameraPermission}
    Run Keyword If    ${present} == 'True'      Click Element    ${allowWhileUseAppCameraPermission}   
    Sleep    2s

Click upload photo field
    Click Element    ${tambahFotoPelangganElement}

Click upload document field
    Click Element    ${uploadIdentitasPelanngganElement}

Take photo by camera
    Wait Until Element Is Visible    ${selectCameraPhoto} 
    Click Element    ${selectCameraPhoto} 
    Allow permission camera if appear
    Wait Until Element Is Visible    ${shutterCameraButton}
    Click Element    ${shutterCameraButton}  
    Wait Until Element Is Visible    ${doneCameraPhoto} 
    Click Element    ${doneCameraPhoto} 
    Wait Until Element Is Visible    ${doneCropPhoto} 
    Click Element    ${doneCropPhoto} 

Click in first pelanggan in list
    Click Element    ${detailFirstPelangganElement}

Verify in detail pelanggan page
    Element Should Be Visible    ${updatePelangganButton}

Click in update pelanggan button
    Click Element    ${updatePelangganButton}

Get text first pelanggan list
    ${pelangganName}    Get Text    ${detailFirstPelangganElement}
    Log    ${pelangganName}

Scroll down in page
   Swipe     53     1047    0    0

Wait pop Up submit gone
    Wait Until Page Does Not Contain    ${loadingSubmitPopUpText}        10s

Click in delete pelanggan button
    Wait Until Element Is Visible    ${deletePelangganButton}
    Click Element    ${deletePelangganButton}
    Wait Until Element Is Visible    ${yaPopUpConfirmationDeletePelanggan}
    Click Element    ${yaPopUpConfirmationDeletePelanggan}

Search pelanggan
    Wait Until Element Is Visible    ${searchPelangganElement}
    [Arguments]        ${namaPelanggan}
    Input Text    ${searchPelangganElement}    ${namaPelanggan}

Verify search correct
    [Arguments]     ${namaPelanggan}
    Page Should Contain Text    ${namaPelanggan}
