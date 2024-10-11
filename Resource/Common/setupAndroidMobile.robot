*** Settings ***
Resource                    ../../Routes/appRoutes.robot


*** Variables ***
${AppiumServer}                    http://localhost:4723/wd/hub
${platformName}                    Android
# Default or leave blank for dynamic values
${deviceName}                      None
# ${deviceName}                      emulator-5554
# ${deviceName}                      K1AXGF03C126K7L
${platfromVersion}                 None
${automationName}                  Uiautomator2
${appPackage}                      com.cloudiex.possaku
${appActivity}                     com.cloudiex.possaku.MainActivity

*** Keywords ***
    
Setup and open dialer Android App 
    # Open the application without hardcoding deviceName and platformVersion
    ${AndroidDriver}=    Open Application    ${AppiumServer}    platformName=${platformName}     
    ...    automationName=${automationName}    appPackage=${appPackage}    newCommandTimeout=3000     
    ...    appActivity=${appActivity}    autoGrantPermissions=true

    # Get device name and Android version dynamically from session capabilities
    ${deviceName}=      Get Capability    deviceName
    ${platformVersion}=  Get Capability    platformVersion

    Sleep    6s