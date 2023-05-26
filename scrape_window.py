# Installing and starting up Chrome using Webdriver Manager
#!pip install webdriver_manager
#!pip install selenium

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By 

# Opening the Twitch site
driver = webdriver.Chrome(ChromeDriverManager().install())

#url = "https://twitch.tv/"
url = "https://www.kvk.nl/zoeken/handelsregister/?handelsnaam=team.blue&kvknummer=&straat=&postcode=&huisnummer=&plaats=&hoofdvestiging=1&rechtspersoon=1&nevenvestiging=1&zoekvervallen=0&zoekuitgeschreven=1&start=0"
driver.get(url)
