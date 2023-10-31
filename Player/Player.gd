extends CharacterBody2D

@export var health: float = 100.0
@export var coins: int = 0
const SPEED = 125.0

func _ready():
	pass

func _process(delta):
	if coins >= 10:
		Global.next_level()
	$Coins.text = str(coins)+"/10"
	$ProgressBar.value = health

func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	if Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
	move_and_slide()

func _on_area_2d_body_entered(body):
	if "Coin" in body.name or body.name == "Coin":
		coins += 1
		body.queue_free()
