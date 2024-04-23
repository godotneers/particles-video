extends CharacterBody2D
var gravity:float = ProjectSettings.get_setting("physics/2d/gravity", 980)
@export var speed:float = 200
@onready var animated_sprite_2d:AnimatedSprite2D = %AnimatedSprite2D
@onready var animation_player:AnimationPlayer = %AnimationPlayer

func _ready():
	animation_player.play("hover")


func _physics_process(delta):
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		animated_sprite_2d.animation = "left"
	elif Input.is_action_pressed("right"):
		animated_sprite_2d.animation = "right"
		velocity.x = speed
	else:
		animated_sprite_2d.animation = "front"
		velocity.x = 0
	
	move_and_slide()
	
	if not is_on_floor():
		velocity.y = gravity
	else:
		velocity.y = 0
