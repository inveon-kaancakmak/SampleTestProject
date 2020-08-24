def click_on_element(locator)
  # Öncelikle elemente, sayfayı ortalayacak şekilde (align: :center), scroll ediyoruz.
  scroll_to(find_visible_element(locator), align: :center)

  # Sonrasında da görünür olan ilk elemente tıklama işlemini yapıyoruz.
  find_visible_element(locator).click
end