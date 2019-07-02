# contents of selenium_docker.py

from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

cap = DesiredCapabilities().FIREFOX
cap["marionette"] = False
driver = webdriver.Firefox(capabilities=cap, executable_path='/usr/local/bin/geckodriver')
driver.get("http://www.qxf2.com")
print(driver.title)
driver.quit()
