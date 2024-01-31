@tool
@icon("Icons/icon_setter.png")
class_name PastaSetterComponent
extends Node
## Parent node for property setter components;
## Setter components record and apply properties of other nodes;

## Emitted when the component is applied.
signal applied()
## Emitted when the component is recorded.
signal recorded()



## Does nothing; 
## Overriden by the inheriting classes.
func apply() -> void:
	applied.emit()

## Does nothing; exists for inheritance
## Overriden by the inheriting classes.
func record() -> void:
	recorded.emit()
