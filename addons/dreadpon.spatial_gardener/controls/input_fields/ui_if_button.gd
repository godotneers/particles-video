@tool
extends "ui_input_field.gd"


#-------------------------------------------------------------------------------
# Emits a signal when button is pressed
#-------------------------------------------------------------------------------


var button:Button = null


signal pressed




#-------------------------------------------------------------------------------
# Lifecycle
#-------------------------------------------------------------------------------


func _init(__init_val, __labelText:String = "NONE", __prop_name:String = "", settings:Dictionary = {}):
	super(__init_val, __labelText, __prop_name, settings)
	
	set_meta("class", "UI_IF_Button")
	
	button = Button.new()
	button.name = "button"
	button.size_flags_horizontal = SIZE_EXPAND_FILL
	button.size_flags_vertical = SIZE_SHRINK_CENTER
	button.text = settings.button_text
	button.pressed.connect(on_pressed)
	button.theme_type_variation = "InspectorButton"
	
	container_box.add_child(button)


func _cleanup():
	super()
	if is_instance_valid(button):
		button.queue_free()





#-------------------------------------------------------------------------------
# Button presses
#-------------------------------------------------------------------------------


func on_pressed():
	pressed.emit()
