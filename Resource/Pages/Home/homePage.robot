*** Settings ***
Resource        ../../../Routes/appRoutes.robot

*** Variables ***
# Pop Up Atur Keuangan element
${cobaButtonAturKeuanganPopUp}               xpath=//android.widget.Button[@content-desc="Coba Fitur"]
${lewatiButtonAturKeuanganPopUp}             xpath=//android.widget.Button[@content-desc="Lewati"]

# Buka tutup toko element
${bukaButtonElement}                         xpath=//android.view.View[@content-desc="Buka"]
${guideForCloseElement}                      Jam operasional akan tutup pada
${tutupButtonElement}                        xpath=//android.view.View[@content-desc="Tutup"]
${guideForOpenElement}                       Jam operasional akan buka pada
${yesButtonPopUp}                            xpath=//android.widget.Button[@content-desc="Ya"]

# Filter element
${filterDateButton}                          xpath=//android.widget.ScrollView/android.view.View[12]

# main menu
${kasirElement}                              xpath=//android.widget.ImageView[@content-desc="Kasir "]
${daftarPelangganElement}                    xpath=//android.widget.ScrollView/android.view.View[14]/android.view.View/android.view.View[3]
# ${daftarPelangganElement}                    xpath=//android.widget.ImageView[contains(@content-desc="Daftar Pelanggan")]
${lainlainElement}                           xpath=//android.widget.ImageView[@content-desc="Lain-Lain"]
${daftarKaryawanElement}                     xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]//android.view.View[3]

*** Keywords ***
Click lewati button in Atur Keuangan Pop Up if appear
    Sleep    3s
    ${is_visible}=    Run Keyword And Return Status     Element Should Be Visible    ${lewatiButtonAturKeuanganPopUp} 
    Run Keyword If    '${is_visible} = True'    Click Element     ${lewatiButtonAturKeuanganPopUp}

Slide buka button
    Wait Until Element Is Visible    ${bukaButtonElement}
    Element Should Be Visible    ${bukaButtonElement} 
    ${element1}=    Get Webelement    ${bukaButtonElement}
    ${location1}=   Get Element Location    ${element1}
    ${size}=       Get Element Size        ${element1}
    
    ${element2}=    Get Webelement    ${filterDateButton}
    ${location2}=   Get Element Location    ${element2}

    ${start_x}=    Evaluate     ${location1['x']} + ${size['width']} / 2
    ${start_x2}=    Set Variable    ${location2['x']}
    ${start_y}=    Evaluate   ${location1['y']} + ${size['height']} / 2
    ${end_x}=      Evaluate    ${start_x} + ${start_x2}
    ${end_y}=      Set Variable    ${start_y}
    Swipe     ${start_x}    ${start_y}    ${end_x}    ${end_y}    500

Slide tutup button
    Wait Until Element Is Visible    ${tutupButtonElement}
    Element Should Be Visible    ${tutupButtonElement} 
    ${element1}=    Get Webelement    ${tutupButtonElement}
    ${location1}=   Get Element Location    ${element1}
    ${size}=       Get Element Size        ${element1}
    
    ${element2}=    Get Webelement    ${filterDateButton}
    ${location2}=   Get Element Location    ${element2}

    ${start_x}=    Evaluate     ${location1['x']} + ${size['width']} / 2
    ${start_x2}=    Set Variable    ${location2['x']}
    ${start_y}=    Evaluate   ${location1['y']} + ${size['height']} / 2
    ${end_x}=      Evaluate    ${start_x} + ${start_x2}
    ${end_y}=      Set Variable    ${start_y}
    Swipe     ${start_x}    ${start_y}    ${end_x}    ${end_y}    500

Click in Ya in pop up open or close store
    Element Should Be Visible    ${yesButtonPopUp} 
    Click Element    ${yesButtonPopUp} 
    Sleep    1s

Convert String To Boolean
    [Arguments]    ${string_value}
    ${result}=    Evaluate    ${string_value} in ['True', 'true', '1']
    [Return]    ${result}

Verify store closed
    Page Should Contain Text    ${guideForOpenElement} 
    Element Should Be Visible    ${tutupButtonElement}
    ${is_enabled}=    Run Keyword And Return Status    Element Should Be Enabled     ${kasirElement}
    ${string_value}=     set Variable     False
    ${False}=     Convert String To Boolean    ${string_value}
    Should Be Equal    ${is_enabled}   ${False}

Verify store open
    Page Should Contain Text     ${guideForcloseElement} 
    Element Should Be Visible    ${bukaButtonElement}
    ${is_enabled}=    Run Keyword And Return Status    Element Should Be Enabled     ${kasirElement}
    ${string_value}=     set Variable     True
    ${True}=     Convert String To Boolean    ${string_value}
    Should Be Equal    ${is_enabled}    ${True}

Click in Daftar Pelanggan button
    Element Should Be Visible    ${daftarPelangganElement}
    Click Element  ${daftarPelangganElement}

Click in lain - lain menu
    Element Should Be Visible    ${lainlainElement}
    Click Element    ${lainlainElement}

Click in Daftar Karyawan Button
    Element Should Be Visible    ${daftarKaryawanElement}
    Click Element    ${daftarKaryawanElement}