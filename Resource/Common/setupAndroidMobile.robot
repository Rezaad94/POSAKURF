*** Settings ***
Resource                    ../../Routes/appRoutes.robot

*** Variables ***
${AppiumServer}                    http://localhost:4723/wd/hub
${platformName}                    Android
${platfromVersion}                 11
${deviceName}                      emulator-5554
# ${deviceName}                      K1AXGF03C126K7L
#appium
${automationName}                  Uiautomator2
${appPackage}                      com.cloudiex.possaku
${appActivity}                     com.cloudiex.possaku.MainActivity


*** Keywords ***
Setup and open dialer Android Dagangan App 
        ${AndroidDriver}=    Open Application        ${AppiumServer}    platformName=${platformName}    platformVersion=${platfromVersion}    deviceName=${Device_name}     
        ...    automationName=${automationName}    appPackage=${appPackage}    newCommandTimeout=3000      appActivity=${appActivity}    autoGrantPermissions=true 
    Sleep    6s