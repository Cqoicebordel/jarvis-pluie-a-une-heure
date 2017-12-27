#!/bin/bash


jv_pg_pluie_dans_lheure() {
	local sum=0
	local has_unknowns=false
	local has_rain=false
	local iteration=0
	local iter_of_first_rain=0
	local pluie_code_insee='75111'
	
	local infos="$(curl -s http://www.meteofrance.com/mf3-rpc-portlet/rest/pluie/${pluie_code_insee}0 | jq '.["dataCadran"][]["niveauPluie"]')"
	jv_debug $infos
	
	for row in $infos; do
		if [ $row -eq 0 ]
		then
			has_unknowns=true
		fi
		
		if [ $row -ge 2 ] && ! $has_rain
		then
			has_rain=true
			iter_of_first_rain=$iteration
		fi
		
		let iteration=iteration+1
		let sum=sum+row
	done


	if [ $sum -eq 0 ]
	then
		say "$(jv_pg_pluie_lang no_data)"
		return 0
	fi
	
	if $has_rain && [ $iter_of_first_rain -eq 0 ]
	then
		say "$(jv_pg_pluie_lang already_raining)"
		return 0
	fi
	
	if $has_rain
	then
		say "$(jv_pg_pluie_lang rain_in $((5*$iter_of_first_rain)))"
		return 0
	fi
	
	say "$(jv_pg_pluie_lang no_rain)"
	return 0

}
