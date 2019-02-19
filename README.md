# Octave
iOS App — Octave Master controller and the exercices ! ✨

## Architecture

![Image](https://lh4.googleusercontent.com/IGGKtcFJ9lbS_r3s9geLcVXQ6vA5LuPTYTLO9ZzckFz9inBrpdH_yCOB0VmR2f6sMLB5BjgKZjESCyUMtbGu=w2880-h1344-rw)


## Exercices

Here is the link to see the videos ⭐️: https://www.youtube.com/playlist?list=PLRjR1-0k_4swVZawVdHsnaWpcQ58BcR5B

The scenarios of the exercices are in the folder Octave/Scenarios

## Config

At the root of the project, there is a ```config.json```.
You can pass the application to the mode debug and change the url of the socket server. 

```
{
    "debug": "true",
    "serverUrl": "https://octaserve.suriteka.website"
}
```


## Creation of the JSON

This is an example of the JSON you need to have to manipulate the drone.

```
[
    {
        "duration" : "6",
        "actions" : [
            {
                "actionType" : ".sparkEvent",
                "actionName" : ".takeOff"
            }
        ]
    },
    {
        "duration" : "4",
        "actions" : [
            {
                "actionType" : ".sparkDirectionVertical",
                "actionName" : ".top",
                "speed" : "0.25"
            },
            {
                "actionType" : ".sparkRotation",
                "actionName" : ".clockwise",
                "speed" : "0.78"
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
| .forwardLeft   	|
| .forwardRight  	|
| .backwardLeft  	|
| .backwardRight 	|

#### Vertical Direction
To create an action that move the drone horizontaly, you need to create ```"actionType" : ".sparkDirectionVertical"```
For ```actionTypeName``` there is these values.


|     Parameters 	|
|---------------	|
| .top       	|
| .bottom      	|


#### Rotation
To create an action that change the rotation of the drone, you need to create ```"actionType" : ".sparkRotation"```
For ```actionTypeName``` there is these values.


|     Parameters 	|
|---------------	|
| .clockwise       	|
| .counterClockwise |
| .speed            |


#### Event
To create an action that move the drone horizontaly, you need to create ```"actionType" : ".sparkEvent"```
For ```actionTypeName``` there is these values.

|     Parameters 	|
|---------------	|
| .landing       	|
| .takeOff      	|
| .stop			|


#### Gimbal
To create an action that move the drone horizontaly, you need to create ```"actionType" : ".sparkGimbalRotation"```
For ```actionTypeName``` there is these values.

|     Parameters 	|
|---------------	|
| .top       	|
| .bottom      	|
| .speed	| 


#### GimbalEvent
To create an action that move the drone horizontaly, you need to create ```"actionType" : ".sparkGimbalEvent"```
For ```actionTypeName``` there is these values.

|     Parameters 	|
|---------------	|
| .takePictureFirst      |
| .takePictureSecond      |

GimbalEvent is probably gonna change one day !
.takePictureFirst and second was easy to do the exercices. We'll change this one day.
