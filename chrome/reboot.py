# import chromedriver_binary
from webdriver_manager.chrome import ChromeDriverManager
from selenium import webdriver
import time
import json
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support.expected_conditions import visibility_of_element_located
# WebDriver のオプションを設定する
options = webdriver.ChromeOptions()

options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')
options.add_argument('--window-size=1600,900')

# Chromeを起動します
# driver = webdriver.Chrome(options=options)
driver = webdriver.Chrome(ChromeDriverManager().install(),options=options)

driver.implicitly_wait(5)
# driver.set_window_size(1920, 1057)
# driver.implicitly_wait(5)
driver.get("http://192.168.11.1/login.html")
driver.implicitly_wait(5)
driver.find_element(By.ID, "form_PASSWORD").click()
driver.implicitly_wait(5)
driver.find_element(By.ID, "form_PASSWORD").send_keys("qN7e2vNX")
driver.implicitly_wait(5)
driver.find_element(By.CSS_SELECTOR, ".button_login").click()
driver.implicitly_wait(10)


driver.get("http://192.168.11.1/advanced.html?req=save_init")
driver.implicitly_wait(10)
# driver.find_element(By.CSS_SELECTOR, ".button_login").click(
driver.switch_to.frame(0)
driver.implicitly_wait(10)
driver.find_element(By.NAME, "reboot").click()
print('pushed')
# WebDriverWait(driver, 10).until(visibility_of_element_located((By.NAME, 'reboot'))).click()
# driver.find_element(By.ID, "Lang_Save_init_10").click()



# print(driver.find_element(By.CSS_SELECTOR, ".text_advanced").is_displayed())
# driver.find_element(By.CSS_SELECTOR, ".text_advanced").click()


# driver.implicitly_wait(5)
# driver.find_element(By.CSS_SELECTOR, ".ADMIN").click()
# driver.implicitly_wait(5)
# driver.find_element(By.ID, "menu_admin_init").click()
# driver.implicitly_wait(5)
# # driver.switch_to.frame(0)
# driver.implicitly_wait(5)
# driver.find_element(By.NAME, "reboot").click()

# driver.quit()




# アクセスしたいサイトのURLを記載します
# driver.get('https://ja.wordpress.com/')
# ブラウザを終了します
