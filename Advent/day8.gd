extends Node2D

onready var input_file = "res://assets/day8input.tres"
const TREE = preload("res://tree.tscn")
var lines = []

var size_x = null
var size_y = null

var visible_lr = 0
var end_lr = null

var visible_rl = 0
var end_rl = null

var visible_ud =  0
var end_ud = null

var visible_du = 0
var end_du = null


func _ready():
	read_input()
	size_x = lines[0].size()
	size_y = lines.size()
	create_grid()
	
func read_input():
	var file = File.new()
	file.open(input_file, File.READ)
	while not file.eof_reached():
		lines.append(file.get_line())
	file.close()

func create_grid():
	for line in lines:
		for t in line:
			var tree = create_tree()
			tree.size = int(line[t])
			tree.position = Vector2(t, line)
			
func create_tree():
	var t = TREE.instance()
	$trees.add_child(t)
	return t
	
func get_visibility(direction):
	var trees = $trees.get_children()
	
	# LEFT->RIGHT
	var line_0_tallest_lr = -1
	var line_1_tallest_lr = -1
	
	var col_0_tallest_ud = -1
	var col_1_tallest_ud = -1
	
	# RIGHT->LEFT / DOWN->UP
	var rl_vis = [].resize(10).fill(false)
	var du_vis = [].resize(10).fill(false)
	
	# SOMETHING
	var lr_top_tree = Vector2(tree)
	var rl_top_tree = Vector2(tree)
	var ud_top_tree = Vector2(tree)
	var du_top_tree = Vector2(tree)
		
	for n in range(size_y): # going through each line
		for c in lines[n]: # going through each char in each line
		
			var tree = int(lines[n][c])
			
			
			if tree > tallest_lr:
				visible_lr += 1
				tallest_lr == tree
				
			if tree > tallest_ud:
				visible_ud += 1
				tallest_ud_column_x = tree
			
			if tree == 4:
				rl_vis[4] = true
				
				for x in range(rl_vis.size()):
					if x < 4:
						rl_vis[x] = false
					if x == 4:
						continue
			
			2 4 8
			3 8 4
			2 1 8
			
