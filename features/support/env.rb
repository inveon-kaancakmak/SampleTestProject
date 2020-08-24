require 'cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'rails-dom-testing'
require 'rails'
require 'report_builder'
require 'pony'

Selenium::WebDriver::Chrome::Service.driver_path = File.join(Dir.pwd, 'chromedriver.exe')

# driver ismini selenium olarak veriyoruz
Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Chrome::Profile.new # Burada chrome adına bir profile objesi oluşturuyoruz.
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 240
  # Burada atılan isteklerden cevap alınamadığı durumlarda,
  # kaç saniye sonra timout olacağını belirliyoruz
  Capybara::Selenium::Driver.new(app,
                                 browser: :chrome,
                                 profile: profile,
                                 http_client: client,
                                 args: %w[--start-maximized])
  # Burada yeni bir selenium driver objesi oluşturulur ve hangi browser'ın
  # kullanılacağı ve profile seçimleri girilir
  # -- start-maximized kısmı browser'ın default olarak tam ekran olarak gelmesini sağlar.
end

## Bu kısımda capybara frameworkunun testleri
# nasıl çalıştıracağıyla alakalı konfigürasyonlar yapılır.
Capybara.configure do |config|
  config.default_max_wait_time = 20 # seconds
  ## Kaç saniye sonra testler timeout'a düşeceği belirlenir.
  config.default_driver        = :selenium
  ## Burada capybara'nın default driver'ını yukarıda tanımladığımız selenium olarak belirledik.
  config.javascript_driver = :selenium
  ## Burada da belli başlı javascript kodlarının hangi driver
  # ile çalıştırılacağı belirlendi.
  config.run_server = false
  # Server kullanılıp kullanılmayacağı belirlendi.
  config.default_selector = :css
  # Default selector olarak css selector seçilir.
  config.ignore_hidden_elements = false
  # Burada sayfa DOM'unda bulunan ancak sayfada görünür
  # olmayan elementlerin görmezden gelinmesini false yaptık.
  # Belli durumlarda bu elementlere de ihtiyacımız olabiliyor.
  config.exact = true
  config.app_host = 'https://www.watsons.com.tr'
end

World(Capybara::DSL)