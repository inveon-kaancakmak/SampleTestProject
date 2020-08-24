def hover_on_element(locator)
  scroll_to(find_visible_element(locator), align: :center)
  find_visible_element(locator).hover
end

## Burada görünür olan elementi geri döndürecek metodu yazıyoruz
# çünkü bu işlemi sürekli yapmamız gerekecek.
def find_visible_element(locator)
  find(get_element(locator.to_s), match: :first, visible: true)
end