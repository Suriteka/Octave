# Octave
iOS App — Octave Master controller and the exercices ! ✨


## Scenarios

You can pass a JSON to create a scenario. The drone will do the actions you want.


* Exemple
```
{
    "name": "Exercice 1",
    "sequence" : [
        [
            {
                "movement" : "left",
                "speed": "3",
                "duration" : "1",
                "beforeAction": "takePicture",
                "afterAction": "takePicture",
            }
        ],
        [
            {
                "movement" : "left",
                "speed": "3",
                "duration" : "1"
            },
            {
                "movement" : "up",
                "speed": "3",
                "duration" : "6"
            }
        ],
        
    ],
    "repeatBack": true
}
```

The speed is in m.
Duration in s.


```
{
	"movement" : "left",
	"speed": "3",
	"duration" : "1"
}
```

Drone will go to left 3m in 1s.