import subprocess
import time

class appiumManager:
    process = None

    @staticmethod
    def start_appium():
        appiumManager.process = subprocess.Popen(
            ["appium"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )

        time.sleep(4)  # Wait for the server to start

    @staticmethod
    def stop_appium():
        if appiumManager.process:
            appiumManager.process.terminate()