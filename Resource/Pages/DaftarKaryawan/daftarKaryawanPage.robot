*** Settings ***
Resource        ../../../Routes/appRoutes.robot

*** Variables ***
# list karyawan element #
${daftarKaryawanFTUI}                    xpath=//android.view.View[@content-desc="Tambahkan karyawan Anda melalui fungsi tombol ini"]
${lewatiButtonDaftarKaryawanFTUI}        xpath=//android.view.View[@content-desc="Lewati"]
${lanjutkanButtonDaftarKaryawanFTUI}     xpath=//android.view.View[@content-desc="Lanjutkan"]


*** Keywords ***
