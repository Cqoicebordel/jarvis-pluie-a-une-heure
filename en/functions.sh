#!/bin/bash

jv_pg_pluie_lang () {
    case "$1" in
        no_data) echo "No data available.";;
        already_raining) echo "It's already raining or it'll start in the next 5 minutes.";;
        rain_in) echo "It'll probably start to rain in the next $2 minutes.";;
        no_rain) echo "No rain predicted for the next hour.";;
    esac
} 
