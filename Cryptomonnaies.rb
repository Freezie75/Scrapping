require 'nokogiri'
require 'open-uri'

tab = []

loop do # On fait une boucle infini
  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/')) # On met cette ligne dans la boucle pour que la page
  doc.css('a.currency-name-container').each_with_index do |monnaie, nb| # s'actualise
    tab[nb] = Hash.new(0) # On range un nouveaux hash dans le tableau afin d'y stocker nom et montant de chaque cryptomonnaies
    tab[nb][monnaie.text] = doc.css('a.price')[nb].text
    sleep 0.5 # Sleep pour que l'affichage aille plus lentement
    puts tab[nb]
  end
  puts "Ce programme s'actualise toute les heures, veuiller patienter..."
  sleep (3600 - 1584) # Un autre sleep pour que le programme s'actualise chaque heure; par contre comme on met une seconde entre chaque affichage, je soustrait le
end # nombre de monnaie qu'il y a au nombre de seconde qu'il y a dans une heure. Comme ça l'affichage s'actualise toutes les heures
