/*
 Square Particle System
 Shiv Krishnaswamy
 April 10, 2020
 
 This program has a class(Particle) draw a bunch of rounded squares that are all emmited from the mouses position on the window. The particles
 all have a random initial velocity and a random lifetime. The particles are than dragged downwards by a simulated gravity and when the hit the bottom 
 of the window, they bounce upwards. They then fall back down and so on. The particles continously rotate a certain amount each time and also shrink(scaled down)
 as time goes on. After each frame, the independent lifetime variable of each particle decreases and when at 0, the particle is removed off the screen. The colour 
 of each particle depends on the mouses location on the window. The colour can change by dragging the mouse right and left and the brightness of the particle can 
 be changed by dragging the mouse up and down. Also, the colour of the background can be switch between white and black if the user clicks the mouse.
*/

//Array list that contains the particles.
ArrayList<Particle> particles = new ArrayList<Particle>();
//Boolean value that, when true, background is white, and when false, background is black.
boolean backCol = true;

void setup() {
  size(1000, 1000);
}

void draw() {
  //Controls the background colour.
  if (backCol) {
    background(0, 0, 100);
  } else {
    background(0);
  }
  //Adds a particle to the window at current mouse position.
  particles.add(new Particle(mouseX, mouseY));
  for (int i = 0; i < particles.size(); i++) {
    //When boolean value a is false(which means frames is greater than lifetime), remove the particle from the screen.
    if (particles.get(i).a == false) {
      particles.remove(i);
    }
    //When the particle hits the bottom of the window, have the y-component of its velocity invert so it bounces back up, and set the position to the bottom of the screen.
    if (particles.get(i).location.y >= height) {
      particles.get(i).velocity.set(particles.get(i).velocity.x, particles.get(i).velocity.y * -0.7);
      particles.get(i).location.set(particles.get(i).location.x, height);
    }
    //Calls the move class function to move each particle.
    particles.get(i).move();
  }
}

//When mouse is pressed, invert boolean value of backCol to switch background colour.
void mousePressed() {
  backCol = !backCol;
}
