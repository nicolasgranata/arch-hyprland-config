#!/bin/bash

exec 2>/dev/null

if ! command -v jq &> /dev/null
then
   echo "❌ ERROR: The 'jq' dependency is not installed."
   echo "Please install it using your package manager (e.g: sudo apt install jq)."
   exit 1
fi

# echo "🌍 Getting your location..."
locationResponse=$(curl -s 'http://ip-api.com/json/')
latitude=$(echo "$locationResponse" | jq -r '.lat' | tr -d '\n')
longitude=$(echo "$locationResponse" | jq -r '.lon'| tr -d '\n')
city=$(echo "$locationResponse" | jq -r '.city'| tr -d '\n')
country=$(echo "$locationResponse" | jq -r '.country'| tr -d '\n')

# echo "📍 Detected location: $city, $country"
# echo "📐 Coordinates: $latitude, $longitude"

apiResponse=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,weather_code&timezone=auto&forecast_days=1")

temperature=$(echo "$apiResponse" | jq '.current.temperature_2m' | tr -d '\n')
weather_code=$(echo "$apiResponse" | jq '.current.weather_code' | tr -d '\n')

current_hour=$(date +%H)

day_hour=7
night_hour=19

set_day_night_icon() {
    local day_icon=$1
    local night_icon=$2
    
    if (( current_hour >= day_hour && current_hour < night_hour )); then
        weather_icon="$day_icon"
    else
        weather_icon="$night_icon"
    fi
}


case $weather_code in
   0)          
      set_day_night_icon "" ""
      weather_desc="Cielo despejado" ;;
   1)   
      set_day_night_icon "🌤️" ""
      weather_desc="Mayormente despejado" ;;
   2)          
      set_day_night_icon "⛅" ""
      weather_desc="Parcialmente nublado" ;;
   3)          
      weather_icon="☁️"
      weather_desc="Nublado" ;;
   45|48)     
      weather_icon="🌫️"
      weather_desc="Niebla" ;;
   5[1-5])     
      set_day_night_icon "🌦️" ""
      weather_desc="Llovizna" ;;
   6[1-5])     
      weather_icon=""
      weather_desc="Lluvia" ;;
   7[1-5])     
      weather_icon="🌨️"
      weather_desc="Nieve" ;;
   8[0-2])     
      weather_icon="🌩️"
      weather_desc="Tormenta eléctrica" ;;
   *)          
    weather_desc="Clima desconocido"
    weather_icon="❓"
    ;;
esac


jq -n -c\
 --arg temp "$temperature" \
 --arg desc "$weather_desc" \
 --arg loc "$city" \
 --arg weather_icon "$weather_icon" \
 '{
   "text": "\($weather_icon) \($temp)°C",
   "tooltip": "Clima actual en \($loc)\nTemperatura: \($temp)°C\nCondición: \($desc)",
   "location": $loc,
   "temperature": $temp,
   "desc": $desc,
   "weather_icon": $weather_icon
  }'

