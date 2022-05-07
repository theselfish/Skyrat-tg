GLOBAL_LIST_INIT(blood_types, generate_blood_types())

/proc/generate_blood_types()
	. = list()
	for(var/path in subtypesof(/datum/blood_type))
		var/datum/blood_type/new_type = new path()
		.[new_type.name] = new_type

/proc/get_blood_dna_color(list/blood_dna)
	var/blood_print = blood_dna[length(blood_dna)]
	var/datum/blood_type/blood_type = blood_dna[blood_print]
	return blood_type.color

/proc/random_blood_type()
	return get_blood_type(pick(4;"O-", 36;"O+", 3;"A-", 28;"A+", 1;"B-", 20;"B+", 1;"AB-", 5;"AB+"))

/proc/get_blood_type(type)
	return GLOB.blood_types[type]

/obj/effect/decal/cleanable/blood/add_blood_DNA(list/blood_dna, list/datum/disease/diseases)
	. = ..()
	if(blood_dna)
		color = get_blood_dna_color(blood_dna)
