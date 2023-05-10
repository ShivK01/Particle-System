class Particle {
  //Vector variable that store the velocity, the location, and the acceleration of each particle.
  PVector velocity, location, acceleration;
  //Variables that hold the initial size, the frames after being drawn, and the lifetime(duration of the particle being on the window) of each particle.
  int size, frames, lifetime;
  //Boolean value that holds whether the particle should be drawn or not(if it's false, particle is removed from window).
  boolean a;
  //Colour variable that holds the colour of each particle.
  color fill;

  //The class constructor whose parameters are the initial position of where the particle should first be drawn.
  Particle(float x, float y) {
    rectMode(CENTER);
    //Change colour mode to HSB.
    colorMode(HSB, 360, 100, 100);
    //Set initial velocity to random between certain values.
    velocity = new PVector(random(-2, 2), random(-2, 2));
    //Set initial location to the values passed in(mouse position).
    location = new PVector(x, y);
    //Set acceleration to this specific value.
    acceleration = new PVector(0, 0.25);
    //Set size of the particle to a random value between 10 and 60.
    size = int(random(10, 60));
    //Set frames value to 0.
    frames = 0;
    //Set lifetime variable to random value between 75 and 150.
    lifetime = int(random(125, 200));
    a = true;
    //Set the colour(in HSB) of the particle according the mouse position.
    fill = color(map(mouseX, 0, width, 0, 345), 100, map(mouseY, 0, height, 100, 25));
  }

  //Function that moves the particle.
  void move() {
    //Add the velocity to the location so that the location changes. 
    location.add(velocity);
    //Add the constant acceleration to the velocity so that the velocity changes.
    velocity.add(acceleration);
    frames++;
    //When the frames variable is greater than the set lifetime, change the boolean value a to false.
    if (frames > lifetime) {
      a = false;
    }
    display();
  }

  //Function that displays the particle.
  void display() {
    //Layer a coordinate system with origin where the x and y location of the particle is.
    pushMatrix();
    translate(location.x, location.y);  
    //Rotate the particle.
    rotate(radians(frames * 5));
    //Scale the particle so as time goes on and the frames variable nears its respective lifetime variable, the particle shrinks.
    scale(map(frames, 0, lifetime, 1, 0));
    noStroke();
    fill(fill);
    //Draw the particle(square) with dimensions of the variable size that also has rounded corners with radius of 10.
    rect(0, 0, size, size, 10);
    popMatrix();
  }
}
