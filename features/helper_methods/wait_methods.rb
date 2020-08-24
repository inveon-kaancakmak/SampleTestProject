
## süreli kullandığımız ve kod tekrarına sebep olan wait sınıfından instance
# oluşturma işlemini bu şekilde bir metodun içine aldık.
def wait_for
  wait = Selenium::WebDriver::Wait.new(timeout: 30)
  wait.until { yield }
end

## metodun içine string olarak yollanan url'i, sayfanın url'i içerinceye kadar bekler
def wait_until_page_url_includes(url)
  wait_for { page.current_url.include?(url.to_s) }
end

# sayfadaki görünür elementlerin sayısı 0'ı geçinceye kadar bekler
def wait_until_element_is_displayed(locator)
  wait_for do
    all(get_element(locator).to_s,
        match: :first,
        visible: true).size > 0
  end
end

## sayfada ilgili text görünür oluncaya kadar bekler
def wait_until_text_is_displayed(text)
  wait_for { page.has_text?(text) }
end


## ilgili element görünür oluncaya kadar bekler
# sonrasında da ilgili elementin üzerinde ilgili text görünür oluncaya kadar bekler
def wait_until_elements_text_is_displayed(element, text)
  wait_until_element_is_displayed(element)
  stored_text = find_visible_element(element).text
  wait_for { stored_text.include?(text) }
end