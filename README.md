# Octave
iOS App — Octave Master controller and the exercices ! ✨

## Creation of the JSON

This is an example of the JSON you need to have to manipulate the drone.

```[
    {
        "duration" : "0.1",
        "actions" : [
            {
                "actionType" : ".sparkDirectionHorizontal",
                "actionTypeName" : ".left"
				"speed" : "0.1",
            },
            {
                "actionType" : ".sparkDirectionHorizontal",
                "actionTypeName" : ".top"
				"speed" : "0.1",
            }
        ]
    },
    {
        "duration" : "0.1",
        "actions" : [
            {
                "actionType" : ".sparkDirectionVertical",
                "actionTypeName" : ".top"
				"speed" : "0.1",
            },
            {
                "actionType" : ".sparkDirectionVertical",
                "actionTypeName" : ".right"
				"speed" : "0.1",
            }
        ]
    }
]
```

### Parameters

#### Horizontal Direction
To create an action that move the drone horizontaly, you need to create ```"actionType" : ".sparkDirectionHorizontal"```
For ```actionTypeName``` there is these values.


|     Parameters 	|
|---------------	|
| .forward       	|
| .backward      	|
| .left          	|
| .right         	|
| .forwardleft   	|
| .forwardright  	|
| .backwardleft  	|
| .backwardright 	|

#### Vertical Direction
To create an action that move the drone horizontaly, you need to create ```"actionType" : ".sparkDirectionVertical"```
For ```actionTypeName``` there is these values.


|     Parameters 	|
|---------------	|
| .top       	|
| .bottom      	|


#### Rotation
To create an action that move the drone horizontaly, you need to create ```"actionType" : ".sparkRotation"```
For ```actionTypeName``` there is these values.


|     Parameters 	|
|---------------	|
| .left       	|
| .right      	|


#### Event
To create an action that move the drone horizontaly, you need to create ```"actionType" : ".event"```
For ```actionTypeName``` there is these values.

|     Parameters 	|
|---------------	|
| .landing       	|
| .takeOff      	|

#### Gimbal
To create an action that move the drone horizontaly, you need to create ```"actionType" : ".gimbal"```
For ```actionTypeName``` there is these values.

|     Parameters 	|
|---------------	|
| .top       	|
| .bottom      	|

#### Camera
To create an action that move the drone horizontaly, you need to create ```"actionType" : ".camera"```
For ```actionTypeName``` there is these values.

|     Parameters 	|
|---------------	|
| .takePicture      |