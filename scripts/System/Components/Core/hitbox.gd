class_name Hitbox
extends Area2D

signal hit(hurt_boxes: Array[Hurtbox])

func trigger() -> Array[Hurtbox]:
	#wait for area update
	await get_tree().physics_frame
	await get_tree().physics_frame
	
	var hurt_boxes_in_hit : Array[Hurtbox]

	for area in get_overlapping_areas():
		if area is Hurtbox:
			var _area : Hurtbox = area
			if !area.active: continue
			hurt_boxes_in_hit.append(area)

	if hurt_boxes_in_hit.size():
		hit.emit(hurt_boxes_in_hit)

	return hurt_boxes_in_hit
