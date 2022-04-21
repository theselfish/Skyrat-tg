/obj/effect/abstract/ripple
	name = "hyperspace ripple"
	desc = "Something is coming through hyperspace, you can see the \
		visual disturbances. It's probably best not to be on top of these \
		when whatever is tunneling comes through."
	icon = 'icons/effects/effects.dmi'
	icon_state = "medi_holo"
	anchored = TRUE
	density = FALSE
	layer = RIPPLE_LAYER
	plane = ABOVE_GAME_PLANE
	mouse_opacity = MOUSE_OPACITY_ICON
	alpha = 0
	// SKYRAT EDIT ADDITION
	/// The mobile docking_port these ripples were created for
	var/obj/docking_port/mobile/incoming_shuttle
	/// Unset by docking to prevent stray gibbings
	var/can_gib = TRUE
	// SKYRAT EDIT END

/obj/effect/abstract/ripple/Initialize(mapload, obj/docking_port/mobile/incoming_shuttle, time_left) // SKYRAT EDIT CHANGE
	. = ..()
	animate(src, alpha=255, time=time_left)
	addtimer(CALLBACK(src, .proc/stop_animation), 8, TIMER_CLIENT_TIME)
	addtimer(CALLBACK(src, .proc/actualize), time_left, TIMER_CLIENT_TIME) // SKYRAT EDIT ADDITION

/obj/effect/abstract/ripple/proc/stop_animation()
	icon_state = "medi_holo_no_anim"

// SKYRAT EDIT ADDITION
/// Make the ripple dense, and act as a crush for the turf it resides on
/obj/effect/abstract/ripple/proc/actualize()
	density = TRUE
	if(can_gib)
		var/turf/our_turf = get_turf(src)
		our_turf.shuttle_gib(incoming_shuttle)
// SKYRAT EDIT END
