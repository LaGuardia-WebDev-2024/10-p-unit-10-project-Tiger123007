var starXPos = [];
var starYPos = [];
var star = "⚽";
var starTotal = 100; // Number of soccer ball distractions

var ratXPos = [];
var ratYPos = [];
var rat = "🐀";
var ratTotal = 50; // Number of rat distractions

var planetXPos = [];
var planetYPos = [];
var planet = "🐐";
var planetTotal = 3; // Number of goats to find
var planetFound = 0; // Counter for found goats

var mySoccer = ["Ronaldos the Goat!", "Messis the Goat"]; // Array for soccer text


setup = function() { // Setup function initializes the canvas and calls reset
   size(600, 450); 

   reset();
}

draw = function(){ // Draw function handles key presses and displays the game
   
  
   if(keyPressed){
    if(key == 'r'){
      reset();
    }
   }

  display();
}


mouseClicked = function(){
  check(mouseX, mouseY);
}

var check = function(xClick, yClick){ // Check function detects if click is near a goat
  for(var i = 0; i < planetXPos.length; i++){
    if(dist(xClick - 5, yClick - 5, planetXPos[i], planetYPos[i])<15){
      planetXPos.splice(i, 1);
      planetYPos.splice(i, 1);
      planetFound++;
    }
  }
}

var display = function(){
  background(100,100,100);

  fill(255,0,0);
  text(mySoccer[0],40,40);
  text(mySoccer[1],40,50);

  fill(200,200,0);
  textSize(20);

  for(var i = 0; i < planetXPos.length; i ++){
    text(planet, planetXPos[i], planetYPos[i]);
  }

  for(var i = 0; i < starXPos.length; i ++){
    text(star, starXPos[i], starYPos[i]);
  }

  for(var i = 0; i < ratXPos.length; i ++){
    text(rat, ratXPos[i], ratYPos[i]);
  }

  fill(0,0,0);
  rect(0,400,600,50);
  fill(255,255,255);
  text("Find The " + planet + "s   |   " + planet + " " + planetFound + "/" + planetTotal, 0, 425);

  if(planetFound == planetTotal){
    fill(0, 200, 200);
    textSize(50);
    text("Press 'r' to restart \nthe game", 50, 200);
  }
}

var reset = function(){ // Reset function clears and reinitializes all positions
  starXPos = [];
  starYPos = [];
  ratXPos = [];
  ratYPos = [];
  planetXPos = [];
  planetYPos = [];
  planetFound = 0;


  for(var i = 0; i < starTotal; i++){
    starXPos.push(random(0,600));
    starYPos.push(random(0,400));
  }

  var i = 0; // While loop to place rats
  while (i < ratTotal) {
    ratXPos.push(random(0,600));
    ratYPos.push(random(0,400));
    i++;
  }

  for(var i = 0; i < planetTotal; i++){
    planetXPos.push(random(0,600));
    planetYPos.push(random(0,400));
  }
}