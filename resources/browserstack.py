import os
from selenium.webdriver import ChromeOptions

BS_USERNAME = os.getenv("BROWSERSTACK_USERNAME", "")
BS_ACCESS_KEY = os.getenv("BROWSERSTACK_ACCESS_KEY", "")

REMOTE_URL = f"https://{BS_USERNAME}:{BS_ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub"

BROWSER = "chrome"

# Create Selenium Options object (Robot requires this)
options = ChromeOptions()

options.set_capability("browserName", "chrome")
options.set_capability("browserVersion", "latest")

# BrowserStack capabilities must go under bstack:options
options.set_capability(
    "bstack:options",
    {
        "os": "Windows",
        "osVersion": "11",
        "projectName": "SoftwareTestingAssignment",
        "buildName": "RobotFramework",
        "sessionName": "DemoBlaze Tests"
    }
)

OPTIONS = options
