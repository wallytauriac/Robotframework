from PageObjectLibrary import PageObject

class LoginPage(PageObject):
    PAGE_TITLE = "Login - PageObjectLibrary Demo"
    PAGE_URL = "/login.html"

    _locators = {
        "username": "id=id_username",
        "password": "id=id_password",
        "submit_button": "id=id_submit",
    }

    def enter_username(self, username):
        """Enter the given string into the username field"""
        self.selib.input_text(self.locator.username, username)

    def enter_password(self,password):
        """Enter the given string into the password field"""
        self.selib.input_text(self.locator.password, password)

    def click_the_submit_button(self):
        """Click the submit button, and wait for the page to reload"""
        with self._wait_for_page_refresh():
            self.selib.click_button(self.locator.submit_button)