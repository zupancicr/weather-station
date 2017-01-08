--Vremenska postaja--

--nastavitev internetne povezave
wifi_SSID = "zupancic17"
wifi_password = "*******"

--nastavitev strežnika
server_url = 'http://vreme.suhokranjske-novice.com/record.php?'

--čas med do neselednjega merjenja
sleep_time_controller = 7000

--nastavitev načina povezave
-- wifi.PHYMODE_B 802.11b, dalši doseg, počasnejši prenos in večja poraba
-- wifi.PHYMODE_G 802.11g, srednji doseg, srednja povezava, srednja poraba
-- wifi.PHYMODE_N 802.11n, krajši doseg, bolša povezava, manjša poraba
wifi_signal_mode = wifi.PHYMODE_N

--nastavitev DHT senzorja 
DHT_pin = 4
BME_pin1 = 2;
BME_pin2 = 3;


--start in delovanje vremenske postaje
function weather_station()

--Povežem se na WIFI
--v konsolo izpišem IP
--v primeru da imamo ročno nastavitev IPja jo nastavim
    wifi.setmode(wifi.STATION) 
    wifi.setphymode(wifi_signal_mode)
    wifi.sta.config(wifi_SSID, wifi_password) 
    wifi.sta.connect()
    print(client_ip)
    if client_ip ~= "" then
        wifi.sta.setip({ip=client_ip,netmask=client_netmask,gateway=client_gateway})
    end

--inicializacija senzorja za tlak
    --bmp085.init(2, 3)
   bme280.init(BME_pin1, BME_pin2)


    tmr.alarm(0, sleep_time_controller, 1, function() loop() end)
end

weather_station()
 


---funkcija za branje podatkov iz senzorja
function loop() 
--če sem povezan na interne pošljem podatke iz senzorja
--če nisem povezan na interne potem izpišem napako

    if wifi.sta.status() == 5 then
         get_sensor_Data() 
     
    else
        print("Neuspešna povezava na internet")
    end
end

-- DHT22 sensor logic
function get_sensor_Data() 
--pridobim podatke iz senzorja
--če so podatki OK,m potem izpišem podatke v konzolo in pošljem na strežnik
    status, temp, humi, temp_dec, humi_dec = dht.read(DHT_pin)
    P, T = bme280.baro()  

    if status == dht.OK then

        if (temp_dec < 0) then
            temp_dec =(-1)*temp_dec 
        end        
        
        temperature =string.format("%d.%01d", math.floor(temp),temp_dec)
        humidity =string.format("%d.%01d", math.floor(humi),humi_dec)
        tlak = P/1000 --deli ga s 1000
        
        print("Temperatura:"..temperature..";Vlaga:"..humidity..";Tlak="..tlak.."\r\n")
         --print(server_url.."temperatura="..temperature.."&vlaga="..humidity.."&tlak=0.0")
        http.get(server_url.."temperatura="..temperature.."&vlaga="..humidity.."&tlak="..tlak,
        'Content-Type: application/text',
        function(code, data)
             if (code < 0) then
                print("Neuspešna izvedba HTTP zahtevka")
            else
                print("Uspešno pošiljanje")
                --print(data)
            end
         end)     

    elseif status == dht.ERROR_CHECKSUM then
        print( "Napaka pri branju DHT senzorja" )
    elseif status == dht.ERROR_TIMEOUT then
        print( "DHT senzor ni dosegljiv" )
    end
end
