import os

# BrowserStack credentials from environment
BS_USERNAME = os.getenv("BROWSERSTACK_USERNAME", "")
BS_ACCESS_KEY = os.getenv("BROWSERSTACK_ACCESS_KEY", "")

if BS_USERNAME and BS_ACCESS_KEY:
    REMOTE_URL = f"https://{BS_USERNAME}:{BS_ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub"
else:
    REMOTE_URL = None

if not REMOTE_URL:
    raise ValueError("REMOTE_URL is not set. Please check your BrowserStack credentials.")

BROWSER = os.getenv("BROWSER", "chrome").lower()
BROWSER_VERSION = os.getenv("BROWSER_VERSION", "latest")

# Build BrowserStack options payload
bstack_options = {
    "os": os.getenv("BS_OS", "Windows"),
    "osVersion": os.getenv("BS_OS_VERSION", "11"),
    "local": os.getenv("BROWSERSTACK_LOCAL", "false").lower() in ("true", "1", "yes"),
    "seleniumVersion": os.getenv("BS_SELENIUM_VERSION", "4.1.0"),
    "projectName": os.getenv("BS_PROJECT", "SoftwareTestingAssignment"),
    "buildName": os.getenv("BS_BUILD", "local"),
    "sessionName": os.getenv("BS_SESSION", BROWSER)
}

# Create an Options object appropriate for the selected browser and attach bstack:options
OPTIONS = None
try:
    if "chrome" in BROWSER:
        from selenium.webdriver.chrome.options import Options as ChromeOptions
        opts = ChromeOptions()
        opts.set_capability("browserName", "chrome")
        opts.set_capability("browserVersion", BROWSER_VERSION)
        opts.set_capability("bstack:options", bstack_options)
        OPTIONS = opts
    elif "firefox" in BROWSER:
        from selenium.webdriver.firefox.options import Options as FirefoxOptions
        opts = FirefoxOptions()
        opts.set_capability("browserName", "firefox")
        opts.set_capability("browserVersion", BROWSER_VERSION)
        opts.set_capability("bstack:options", bstack_options)
        OPTIONS = opts
    elif "safari" in BROWSER:
        from selenium.webdriver.safari.options import Options as SafariOptions
        opts = SafariOptions()
        opts.set_capability("browserName", "safari")
        opts.set_capability("browserVersion", BROWSER_VERSION)
        opts.set_capability("bstack:options", bstack_options)
        OPTIONS = opts
except Exception as e:
    print(f"Error creating browser options: {e}")
    OPTIONS = None
