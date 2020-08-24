
## Burada yaptığımız şey, '@log_out' annotation'ına sahip
# her bir testten sonra, bu metodu çalıştır demiş oluyoruz.
After('@log_out') do
  # Öncelikle ana sayfaya navigate olmamız her durumda çıkış yapabilmemizi sağlayacaktır
  visit '/'

  ## Kişi ikonuna hover edilir.
  hover_on_element('Person_Icon')

  ## Çıkış yap butonuna basılır
  click_on_element('Logout_Button')

  ## Sonrasında da çıkış yapınca redirect olunan url'in gelip gelmediği kontrol edilir.
  wait_until_page_url_includes('/?logout=1')
end