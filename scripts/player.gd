extends Area2D

const GRAVITY := Vector2(0, 6.674)

var velocity: Vector2 = Vector2(0, 0)
var max_angle: float = deg_to_rad(35.0)
var angle_move: float = deg_to_rad(80.0)
var fast_move: float = deg_to_rad(80.0)

# Called when the node enters the scene tree for the first time.
func _ready():
  pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  if Input.is_key_pressed(KEY_SPACE):
    $AnimatedSprite2D.play("flap")
    self.velocity = Vector2(0, -5)
  else:
    self.velocity += GRAVITY * delta

  var dir = 1 if self.velocity.y > 0 else -1

  if self.rotation > 0 and dir < 0:  
    self.rotation = clampf(
      self.rotation + dir * fast_move * delta, 
      -max_angle, max_angle)
  elif self.rotation < 0 and dir > 0:
    self.rotation = clampf(
      self.rotation + dir * fast_move * delta, 
      -max_angle, max_angle)
  else:
    self.rotation = clampf(
      self.rotation + dir * angle_move * delta, 
      -max_angle, max_angle)

  self.position += self.velocity
