# contents of selenium_docker.py

from selenium import webdriver

driver = webdriver.Firefox(executable_path='/usr/local/bin/geckodriver')
driver.get("http://www.qxf2.com")
print(driver.title)
driver.quit()