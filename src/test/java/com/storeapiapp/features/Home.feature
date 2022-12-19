Feature: UI >> Home Test

Scenario:
    Given driver 'https://www.amazon.in/'
    * driver maximize()
    Then match driver.title == 'Online Shopping site in India: Shop Online for Mobiles, Books, Watches, Shoes and More - Amazon.in'
    And scroll('//*[@id="CardInstanceVncOVtfpZ1oMUfaVjpt6Zw"]/div/div/a/span')
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    #And match text('//*[@id="-X0642KukBieSo8OtD7qmQ"]/div[1]/h2') == 'Top picks for your home'
    #* click('//*[@id="twotabsearchtextbox"]')
    # And input('//*[@id="twotabsearchtextbox"]', 'apple iphone')
    # * click('//*[@id="nav-search-submit-button"]')
    # And match text ('//*[@id="authportal-main-section"]/div[2]/div/div[1]/form/div/div/div/h1') == 'Sign in'  
    # * waitUntil('//*[@id="regPopUp"]')
    #* waitForEnabled('//*[@id="formSubmit-popup_reg_form"]').mouse().click()    
    #And waitFor('//*[@id="registerPopupLink"]').click()
        
