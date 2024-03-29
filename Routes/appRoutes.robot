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
