# TurtlePvp
Turtle pvp is an addon designed to facilitate world pvp to the small collection turtles who are interested in that sort of thing.  

<h1>Features</h1> 

This is done through the following implemented features:  
* You are able to find on the continental map, zones in which players of the opposite faction who are interested in world pvp reside(they also need the addon)
* You are able to find on the regional map a specific area where a player of the opposite faction resided. These regions are color coded to tell you if the player is within your level range. Hovering over the region gives additional info
* When two players of similar level range +/- 4 levels of the opposite faction(and both with the addon) are in the same rough location, they are flagged for pvp temporarily  

The following features are still planned:
* Having an in-game UI to toggle the functionality of the addon, for when you don't want to world pvp
* Removing the ability to flag yourself against opposite-faction members that are in your party 


<h1>Development Timeline</h1>  
This is the rough ordered timeline of how this addon will be developped from the current point of development:  

<h2>Alpha</h2>  

* Add namespacing for all variables  
* Add a config lua file that is easy to parse, for people looking to tweak options  
* Add an in-game minimap bottom to toggle addon features  

<h2>Beta</h2>  

* Improve the auto-flagging feature such that members of the opposite faction flag at roughly the same time. At the moment there is some amount of delay  
* Identify bugs and make improvements regarding drawing, and removing, elements on the map