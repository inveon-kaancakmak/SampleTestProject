## yml dosyasından element locatorını çekebilmek için kullanılan metoddur.
def get_element(arg)
  # dir_to_data kısmı, element_list.yml'in bulunduğu pathi işaret etmektedir
  dir_to_data = Dir.pwd + '/features/support'
  # bu adımda, "element_list.yml" dosyasını yükletiyoruz. Bu sayede veri çekebileceğiz.
  data = YAML.load_file("#{dir_to_data}/element_list.yml")
  data['ElementSet']["#{arg}"]
end