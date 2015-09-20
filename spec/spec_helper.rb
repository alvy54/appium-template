require 'yaml'
require 'appium_lib'
require 'pages/home_page'
require 'pages/sign_in_page'
require 'logger'
require 'fileutils'

LOGGER = Logger.new(STDOUT)
LOGGER.level = Logger::DEBUG

CONFIG = YAML.load_file('config/config.yml')
ENV['PLATFORM'] ||= 'ios'

appium = File.expand_path(File.join(Dir.pwd, ENV['PLATFORM'], 'appium.txt'))
caps = Appium.load_appium_txt(file: appium)

RSpec.configure do |config|
  config.before do
    Appium::Driver.new(caps).start_driver
    Appium.promote_appium_methods RSpec::Core::ExampleGroup
    Appium.promote_singleton_appium_methods AppiumTemplate
  end

  config.after do |example|
    if example.exception
      FileUtils::mkdir_p 'tmp/screenshots'
      screenshot("tmp/screenshots/screenshot_#{example.full_description.downcase.gsub(' ','-')}_#{Time.now.strftime('%Y%m%d%H%M%S')}.png") 
    end
    driver_quit
  end
end
