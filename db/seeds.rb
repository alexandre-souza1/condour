# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# seeds.rb

require 'open-uri'

condominios = [
  { name: "Condomínio do Edifício Primavera", address: "Avenida das Flores, 123, Jardim Botânico, São Paulo - SP", cnpj: "12345678000100", photos_urls: [
    "https://i.pinimg.com/originals/02/d8/79/02d8793cf8544f56da34e036ea7f0e75.jpg",
    "https://s2.glbimg.com/Hpj99JHog8uO9KQQ8ykvbxIPcG4=/s.glbimg.com/jo/g1/f/original/2013/07/27/predio.jpg"
  ] },
  { name: "Residencial Jardins do Lago", address: "Rua das Margaridas, 456, Lagoa Seca, Brasília - DF", cnpj: "23456789000111", photos_urls: [
    "https://vivendos3.s3.amazonaws.com/awsdrupal/s3fs-public/interna_que_es_un_condominio_residencial-04.jpg",
    "https://vivendos3.s3.amazonaws.com/awsdrupal/s3fs-public/interna_que_es_un_condominio_residencial-04.jpg"
  ] },

  { name: "Condomínio Vista Verde", address: "Rua das Palmeiras, 789, Vista Alegre, Belo Horizonte - MG", cnpj: "34567890000122", photos_urls: [
    "https://th.bing.com/th/id/OIP.47BYnQQJXrZEICsQnNxPpwHaEn?w=3000&h=1872&rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/OIP.47BYnQQJXrZEICsQnNxPpwHaEn?w=3000&h=1872&rs=1&pid=ImgDetMain"
  ] },
  { name: "Condomínio do Edifício Sol Nascente", address: "Avenida do Sol, 101, Centro, Fortaleza - CE", cnpj: "45678901000133", photos_urls: [
    "https://th.bing.com/th/id/OIP.lwrg-1Mu3KeQW38R--JKawHaEo?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/OIP.lwrg-1Mu3KeQW38R--JKawHaEo?rs=1&pid=ImgDetMain"
  ] },
  { name: "Residencial Vila das Acácias", address: "Rua das Acácias, 222, Jardim das Flores, Curitiba - PR", cnpj: "56789012000144", photos_urls: [
    "https://images.livemint.com/img/2020/08/24/600x338/podium_1561882272686_1598267634832.jpg",
    "https://images.livemint.com/img/2020/08/24/600x338/podium_1561882272686_1598267634832.jpg"
  ] },
  ]

condominios.each do |condominio_data|
  # Cria o condomínio
  condominium = Condominium.create(condominio_data.except(:photos_urls))

  # Baixa e anexa as fotos
  photos_urls = condominio_data[:photos_urls]

  photos_urls.each_with_index do |url, index|
    filename = "photo#{index + 1}.jpg"
    file = URI.open(url)
    condominium.photos.attach(io: file, filename: filename)
  end
end
