class Home < SitePrism::Page
    set_url 'http://opensource.demo.orangehrmlive.com'
    element :login, '#txtUsername'
    element :senha, :xpath, '//*[@id="txtPassword"]'
    element :btn_login, '#btnLogin'


    def realizar_login(l, s)
        login.set l
        senha.set s
        btn_login.click
    end

end

