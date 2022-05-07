/obj/item/clothing/head/worn_overlays(mutable_appearance/standing, isinhands = FALSE)
	. = ..()
	if(isinhands)
		return

	if(damaged_clothes)
		. += mutable_appearance('icons/effects/item_damage.dmi', "damagedhelmet")
	if(HAS_BLOOD_DNA(src))
		var/mutable_appearance/bloody_helmet
		bloody_helmet.color = get_blood_dna_color(return_blood_DNA())
		if(clothing_flags & LARGE_WORN_ICON)
			bloody_helmet = mutable_appearance('icons/effects/64x64.dmi', "helmetblood_large")
		else
			bloody_helmet = mutable_appearance('modular_skyrat/modules/better_blood/icons/blood.dmi' "helmetblood")
		. += bloody_helmet
