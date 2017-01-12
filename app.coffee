# Learing resources 

# framerjs.com, codepen, framerjs.club, frmaer slack & facebook groups
  
# Imported sketch file "framer-course"
# By default framer stores the imported layer on a variable called sketch  
# How we organize our layers in our sketch file matters. Collapse the groups by appending an * to the end of the name. Also the way we arange our artboards will change the way they show up in framer. Put your landing page at x:0 and y:0 inside your sketch document to ensure it will be the first page reflected inside of your prototype 


sketch = Framer.Importer.load("imported/framer-course@1x")


# Always use this utility method, it will make it easier to work with layers and keep the code looking cleaner. By using this Utility method we can access the name of the layer simply by calling its name. Otherwise we would need to call a layer by using sketch.layerName.   
Utils.globalLayers(sketch)

# The Canvas is a global object made available through framer.js we can access properties on that object by using DOT notation. backgroundColor is a property on the Canvas object.  


#I use variables to store values in. This makes it easy to change values in one place and then have those values reflectedt throughout the rest of the application 
#The value to the left of the equal sign is our varibale. We can name this whatever we want (try to keep them simple and meanigful)
# The value to the right of the equal sign is the value thats being store in our varibale  

# Common colors and heights used inside domo 
fullW = Screen.width
fullH = Screen.height
domoBlue = "#99CCEE"
domoGray = "#333"
feedCardBG = "#555555"

# My anumation curve suggestions  
slideIn = "cubic-bezier(0.4, 0, 0.2, 1)"
slideOut = "cubic-bezier(0.8, 0, 0.6, 1)"
bounceIn = "cubic-bezier(0.4, 0, 0, 1.4)"
bounceOut = "cubic-bezier(0.4, -0.3, 0.4, 1)"
dashboardInOut = "cubic-bezier(0.6, -0.5, 0.2, 1.5)"

#I am refering to one of my variables above (domoBlue) notice I dont use "" quaotes. Thats because it's a variable not a string, if I did "domoBlue" this wouldn't work. I'll discuss more about stings in a later lesson. 

# https://framer.com/docs/#canvas.canvas   
Canvas.backgroundColor = domoBlue

# This will be the default animation options for all animations inside framer unless specified differently  
# https://framer.com/docs/#animation.animation 
Framer.Defaults.Animation =
	time: 0.35
#I am refering to one of my variables above (slideIn)   	
	curve: slideIn
	 
 
# If we want to use the flow componet to help us manage our views we just simply need to make a new one by calling new FlowComponent and set that value on a variable. In this example I am creating a variabled called flow and setting that equal to new FlowComponent  
# https://blog.framerjs.com/posts/introducing-framer-flows.html 
flow = new FlowComponent
# Set the homepage here by passing in the artboard home to the showNext method 
flow.showNext(home)	 


# https://framer.com/docs/#events.events 
# Common Events are Click,Tap,MouseOver,MouseOut, DoubleTap, Pinch, LongPress and Drag  
 	 
# Lets add an Click Event to our buy button  
details_button.on Events.Click, (e) ->	
# 	print "click"
# Lets switch the page using a built in framer utility called flow 	
# now when we click on the buy button it will take us to the details page 
	flow.showNext(details)
	

# Here I am passing in the events object of the layer where the event was fired (buy layer) this gives us valiuable insight into the enviroment that the event was fired in. I'll explain benefits of this in a later class
details_button.on Events.LongPress, (event) ->
	print event
 
detials_back_button.on Events.Click, () -> 
	flow.showPrevious()

# States are very powerful and help a ton with keeping the code readable and predictable 	
# Here I am adding two states to the menu layer (open, closed) open will position the menu at x:0 (right to the edge of the window on the left side)
# closed will remove the menu off the screen to a position of x:-500 (far left of the visual part of teh screen) now when the menu is shown it will slide in from the left  
menu.states.add	
	open:
		x:0
	closed:
		x:-500 
		
# Let's close the menu by default  
menu.states.switchInstant('closed')

# Add an Click Event to the HAM layer   
HAM.on Events.Click, () ->
# Now all we need to do to show the menu is call animate and pass in the state we want to switch to. In this case we want to switch the menu to the open position   	
	menu.animate('open')

# close the menu when the cross layer is clicked  
cross.on Events.Click,() ->
# Here we are swithing the state of the menu to closed when we click the cross layer 	
	menu.animate('closed')


_.each menu.subLayers, (layer,index) ->
	layer.on Events.MouseOver,() ->
		@.subLayers[0].animate
			properties:
				width:420
	layer.on Events.MouseOut,() ->
		@.subLayers[0].animate
			properties:
				width:0

	 


	 
	 
	 
	 
	 