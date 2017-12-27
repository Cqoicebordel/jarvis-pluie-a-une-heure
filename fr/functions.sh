#!/bin/bash

jv_pg_pluie_lang () {
    case "$1" in
        no_data) echo "Pas de données disponibles.";;
        already_raining) echo "Il pleut déjà, ou il va pleuvoir dans les 5 prochaine minutes.";;
        rain_in) echo "Il va probablement pleuvoir dans approximativement $2 minutes.";;
        no_rain) echo "Pas de pluie prévue.";;
    esac
} 
