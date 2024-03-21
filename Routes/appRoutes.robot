*** Settings ***
Resource                env.robot
Resource                ../Libraries/lib.robot
Variables               ../Libraries/credentialTestData.py
Resource                ../Resource/Common/setupAndroidMobile.robot

#ResourcesPagesObjectModel
Resource                ../Resource/Pages/Login/loginPage.robot

