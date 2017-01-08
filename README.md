# weather-station
Vremenska postaja z mikrokrmilnikom NodeMCU


Te zanimajo pametni domovi? Želiš pobližje spoznati Internet stvari – IoT? Želiš svoj dom opremiti s senzorji temperature, vlage, gibanja, kakovosti zraka in podobnimi? Ali pa morda kar s portalom za upravljanje doma? Morda pa se le želiš naučiti nekaj novega?
V nadaljevanju bomo podrobno predstavili izdelavo vremenske postaja z mikrokrmilnikom, ki je pravi uvod na zgoraj zastavljena vpršanja. Postaja bo s pomočjo senzorjev merila temperaturo zraka, relativno zračno vlažnost in zračni tlak. Podatke bomo pošiljali na strežnik, kjer jih bomo obdelali in prikazali na računalniškem zaslonu.
Ciljna skupina so dijaki, ki že imajo vsaj malo znanja programiranja: srednja elektro šola, srednja računalniška šola, tehniška gimnazija in podbne.

Oprema
Za uspešno izvedbo delavnice potrebujemo mikrokrmilnik NodeMCU, ki je prilagojen za povezavo z internetom. Nanj bomo priklopili senzor temperature DHT-22 in zračnega tlaka BME-280. Podatke bomo pošiljali na strežnik, zato potrebujemo dostop do strežnika, ki ima nameščeno MySQL podatkov bazo in podporo za programski jezik PHP. Komponente bomo z žicami med seboj povezali na razvojni ploščici.
•	mikrokrmilnik NodeMCU CH340G ESP8266 v0.9
•	senzor DHT-22
•	senzor BME280
•	razvojna plošča
•	žice

Razvojno okolje
Delavnico pričnemo s pripravo razvojnega okolja. Potrebujemo dva različna orodja. Prvo je za instalacijo strojne programske opreme na mikrokrmilnik, drugo pa za programiranje mikrokrmilnika.
Nameščanje razvojnega okolja natančno vodimo in poskrbimo, da vsi udeleženci uspešno zaključijo nameščanje. Le tako bomo lahko izvedli drugi (ključni) del delavnic.

Strojna programska oprema
Strojno programsko opremo (firmware) za NodeMCU si pripravimo sami. Na spletni strani https://nodemcu-build.com/ enostavno izberemo katere knjižnice naj vsebuje, nato pa jo naložimo na napravo. Programsko opremo nam sistem po nekaj minutah pošlje na elektronsko pošto.
Za potrebe delavnice izberemo »branch dev <>« z naslednjimi moduli: bit, BME280, DHT, file, GPIO, HTTP, net, node, timer, UART, WiFI.
