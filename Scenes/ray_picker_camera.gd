extends Camera3D

@export var gridmap : GridMap

@onready var ray_cast_3d = $RayCast3D

# This is some bulshit trigonometry stuff to get pay projected properly. (I don't understand it.)
@export var ray_power : float = 100.0

func _process(delta):
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * ray_power
	
	# To rapidly update the ray.
	ray_cast_3d.force_raycast_update()
	
	if ray_cast_3d.is_colliding():
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap:
			var collision_point = ray_cast_3d.get_collision_point()
			var cell = gridmap.local_to_map(collision_point)
			
			# Sometime non base cells are also marked as red. So before setting cell item we are
			# checking if there is a cell item and it's value is 0. Here 0 means white tile
			if Input.is_action_pressed("click"):			
				if gridmap.get_cell_item(cell) == 0:
					gridmap.set_cell_item(cell, 1)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
