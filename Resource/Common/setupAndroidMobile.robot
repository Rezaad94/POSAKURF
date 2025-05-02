*** Settings ***
Resource                    ../../Routes/appRoutes.robot

*** Variables ***
${AppiumServer}                    http://localhost:4723
${platformName}                    Android
# Default or leave blank for dynamic values
# ${deviceName}                      None
# ${deviceName}                      emulator-5554
# ${deviceName}                      K1AXGF03C126K7L
# ${platfromVersion}                 None
${automationName}                  Uiautomator2
${appPackage}                      com.cloudiex.possaku
${appActivity}                     com.cloudiex.possaku.MainActivity

*** Keywords ***
Setup and open dialer Android App 
    # Open the application without hardcoding deviceName and platformVersion
    # appiumManager.Start Appium
    # Fetch device information dynamically
    ${deviceName}    ${platformVersion}=    Fetch Device Info

    Open Application    ${AppiumServer}        platformName=${platformName}     
    ...    automationName=${automationName}    appPackage=${appPackage}    
    ...    newCommandTimeout=3000              appActivity=${appActivity}
    ...    deviceName=${deviceName}            platformVersion=${platformVersion}
    ...    autoGrantPermissions=true
    Sleep    4s

Close mobile Application
    Close Application
    # appiumManager.Stop Appium

Fetch Device Info
    # Fetch connected devices using ADB
    ${result}=    Run Process    adb    devices        
    ${output}=    Set Variable    ${result.stdout}
    Log    ADB Devices Output: ${output}

    # Extract device name from the output
    ${lines}=    Split String    ${output}    \n
    ${deviceLine}=    Evaluate    [line for line in ${lines} if 'device' in line and 'List' not in line][0]
    ${deviceName}=    Split String    ${deviceLine}    \t
    ${deviceName}=    Get From List    ${deviceName}    0

    # Fetch platform version for the selected device
    ${platformVersionResult}=    Run Process    adb    -s    ${deviceName}    shell    getprop ro.build.version.release    
    ${platformVersion}=    Strip String    ${platformVersionResult.stdout}

    Log    Device Name: ${deviceName}, Platform Version: ${platformVersion}
    [Return]    ${deviceName}    ${platformVersion}
