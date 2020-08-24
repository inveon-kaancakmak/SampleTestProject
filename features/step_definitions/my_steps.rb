
Given(/^I navigate to homepage$/) do
  visit '/'
end

When(/^I hovered on Person Icon and navigated to Login Page$/) do
  hover_on_element('Person_Icon')

  click_on_element('Login_Page_Button')
end

Then(/^I should be redirected to the Login Page$/) do
  # Sayfanın url'i aşagıdaki url'i içerene kadar bekler. Timeout suresi 30 saniyedir
  wait_until_page_url_includes('/girisyap')

  wait_until_element_is_displayed('Login_Button')
end

And(/^I login to the website with following credentials$/) do |table|
  # table is a table.hashes.keys # => [:kaan.cakmak@inveon.com, :Test1234]
  table_row = table.raw[0] # Bu şekilde, feature dosyasındaki table'ın satır kısmına ulaştık
  email = table_row[0] # Bu şekilde, feature dosyasndaki table'ın satır kısmının ilk parametresine ulaştık
  password = table_row[1] # Bu şekilde, feature dosyasndaki table'ın satır kısmının ikinci parametresine ulaştık

  fill_in 'Email',
          match: :first,
          visible: true,
          with: email
  ## id'si mail_t1 olan ilk görünür elemente, email girdiriyoruz
  fill_in 'Password',
          match: :first,
          visible: true,
          with: password

  ## id'si Password olan ilk görünür elemente, şifre girdiriyoruz
  click_on_element('Login_Button')
end

Then(/^I should see I logined successfully$/) do
  ## burada da demin çektiğimiz user_name degişkeninin Kaan textini içerene kadar beklemesini sağlıyoruz.
  # Eğer login başarılı bir şekilde gerçekleştiyse, buradaki text "Kaan" yazısını içerecektir
  # Eğer login başarılı olmamışsa da timeout'a düşecektir.
  wait_until_elements_text_is_displayed('My_Account_Text',
                                        'Kaan')
end