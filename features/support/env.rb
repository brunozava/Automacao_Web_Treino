require 'rspec'
require 'cucumber'
require 'selenium-webdriver'
require 'pry'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'rspec/expectations'
require 'faker'

BROWSER = ENV['BROWSER']

Capybara.register_driver :selenium do |app|
    if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app, 
    :browser => :chrome,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => {
            'args' => [ "--start-maximized"]}
        )
    )
    elsif BROWSER.eql?('firefox')
        Capybara::Selenium::Driver.new(app, 
        :browser => :firefox,
        marionette: true
        )
    end
end

Capybara.configure do |config|
    config.default_driver = :selenium
end

Capybara.default_max_wait_time = 15