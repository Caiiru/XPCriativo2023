extends Node2D

var Room = preload("res://PROCGEN TEST/Room.tscn")

var tile_size = 16  # size of a tile in the TileMap
var num_rooms = 50  # number of rooms to generate
var min_size = 4  # minimum room size (in tiles)
var max_size = 10  # maximum room size (in tiles)
@onready var Map = $TileMap


func _ready():
	randomize()
	make_rooms()

func make_rooms():
	for i in range(num_rooms):
		var pos = Vector2(randf_range(-hspread, hspread), 0)
		var r = Room.instantiate()
		var w = min_size + randi() % (max_size - min_size)
		var h = min_size + randi() % (max_size - min_size)
		r.make_room(pos, Vector2(w, h) * tile_size)
		$Rooms.add_child(r)
	# wait for movement to stop
	await get_tree().create_timer(1.1).timeout
	# cull rooms
	var room_positions = []
	for room in $Rooms.get_children():
		if randf() < cull:
			room.queue_free()
		else:
			room.freeze = true
			room_positions.append(Vector2(room.position.x, room.position.y))
	await get_tree().process_frame
	# generate spanning tree (path)
	path = find_mst(room_positions)

func find_mst(nodes):
	# Prim's algorithm
	# Given an array of positions (nodes), generates a minimum
	# spanning tree
	# Returns an AStar object

	# Initialize the AStar and add the first point
	var path = AStar2D.new()
	path.add_point(path.get_available_point_id(), nodes.pop_front())

	# Repeat until no more nodes remain
	while nodes:
		var min_dist = INF  # Minimum distance found so far
		var min_p = null  # Position of that node
		var p = null  # Current position
		
		# Loop through the points in the path
		for p1 in path.get_point_ids():
			var p3
			p3 = path.get_point_position(p1)
			# Loop through the remaining nodes in the given array
			for p2 in nodes:
				# If the node is closer, make it the closest
				if p3.distance_to(p2) < min_dist:
					min_dist = p3.distance_to(p2)
					min_p = p2
					p = p3
		# Insert the resulting node into the path and add
		# its connection
		var n = path.get_available_point_id()
		path.add_point(n, min_p)
		path.connect_points(path.get_closest_point(p), n)
		# Remove the node from the array so it isn't visited again
		nodes.erase(min_p)
	return path

func _draw():
	for room in $Rooms.get_children():
		draw_rect(Rect2(room.position - room.size, room.size*2), Color(0, 1, 0), false)
	if path:
		for p in path.get_point_ids():
			for c in path.get_point_connections(p):
				var pp = path.get_point_position(p)
				var cp = path.get_point_position(c)
				draw_line(Vector2(pp.x, pp.y), Vector2(cp.x, cp.y), Color(1, 1, 0, 1), 15, true)

func make_map():
	# Creates a TileMap from the generated rooms & path
	# find_start_room()
	# find_end_room()
	Map.clear()

	# Fill TileMap with walls and carve out empty spaces
	var full_rect = Rect2()
	for room in $Rooms.get_children():
		var r = Rect2(room.position-room.size, room.get_node("CollisionShape2D").shape.extents*2)
		full_rect = full_rect.merge(r)
	var topleft = Map.local_to_map(full_rect.position)
	var bottomright = Map.local_to_map(full_rect.end)
	for x in range(topleft.x, bottomright.x):
		for y in range(topleft.y, bottomright.y):
			Map.set_cell(0, Vector2i(x, y), 1, Vector2i(0, 0), 0)

	# Carve rooms and corridors
	var corridors = []  # One corridor per connection
	for room in $Rooms.get_children():
		var s = (room.size / tile_size).floor()
		var pos = Map.local_to_map(room.position)
		var ul = (room.position/tile_size).floor() - s
		for x in range(2, s.x * 2-1):
			for y in range(2, s.y * 2-1):
				Map.set_cell(0, Vector2i(ul.x + x, ul.y + y), 1, Vector2i(0, 0), 0)

		# Carve corridors
		var p = path.get_closest_point(Vector2(room.position.x, room.position.y))
		for conn in path.get_point_connections(p):
			if not conn in corridors:
				var start = Map.local_to_map(Vector2(path.get_point_position(p).x, path.get_point_position(p).y))
				var end = Map.local_to_map(Vector2(path.get_point_position(conn).x, path.get_point_position(conn).y))
				carve_path(start, end)
		corridors.append(p)

func carve_path(pos1, pos2):
	# Carves a path between two points
	var x_diff = sign(pos2.x - pos1.x)
	var y_diff = sign(pos2.y - pos1.y)
	if x_diff == 0: x_diff = pow(-1.0, randi() % 2)
	if y_diff == 0: y_diff = pow(-1.0, randi() % 2)
	# Carve either x/y or y/x
	var x_y = pos1
	var y_x = pos2
	if (randi() % 2) > 0:
		x_y = pos2
		y_x = pos1
	for x in range(pos1.x, pos2.x, x_diff):
		Map.set_cell(0, Vector2i(x, x_y.y), 0, Vector2i(0, 0), 0);
		Map.set_cell(0, Vector2i(x, x_y.y + y_diff), 0, Vector2i(0, 0), 0);
		for y in range(pos1.y, pos2.y, x_diff):
			Map.set_cell(0, Vector2i(y_x.x, y), 0, Vector2i(0, 0), 0);
			Map.set_cell(0, Vector2i(y_x.x + x_diff, y), 0, Vector2i(0, 0), 0);

func _process(delta):
	queue_redraw()

func _input(event):
	if event.is_action_pressed('ui_select'):
		for n in $Rooms.get_children():
			n.queue_free()
		make_rooms()
	if event.is_action_pressed('ui_focus_next'):
		make_map()

var hspread = 400  # horizontal spread

var cull = 0.4 # chance to cull room

var path  # AStar pathfinding object
