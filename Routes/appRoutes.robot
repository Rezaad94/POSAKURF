*** Settings ***
Resource                env.robot
Resource                ../Libraries/lib.robot
Variables               ../Libraries/credentialTestData.py
Resource                ../Resource/Common/setupAndroidMobile.robot

#ResourcesPagesObjectModel

#- Login -#
Resource                ../Resource/Pages/Login/loginPage.robot

#- SplashScreen -#
Resource                ../Resource/Pages/splashScreen/splashScreenPage.robot

#- Home -#
Resource                ../Resource/Pages/Home/homePage.robot

#- Daftar Pelanggan -#
Resource                ../Resource/Pages/DaftarPelanggan/daftarPelangganPage.robot

#- Daftar karyawan -#
Resource                ../Resource/Pages/DaftarKaryawan/daftarKaryawanPage.robot

#- Usahaku -# 
Resource                ../Resource/Pages/Usahaku/usahakuPage.robot