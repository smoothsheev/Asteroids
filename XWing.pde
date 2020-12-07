class XWing extends GameObject {
  //1. instance variables
  PVector direction;
  int shotTimer, threshold;
  int transparency;

  //2. Constructors
  XWing() {
    location = new PVector(width/2, height/2);
    direction = new PVector(0.1, 0);
    velocity = new PVector(0, 0);
    lives = 3;
    shotTimer = 0;
    threshold = 30;
    transparency = 255;
  }

  //3. Behaviour functions
  void show() {
    pushMatrix();
    strokeWeight(3);
    stroke(255, transparency);
    fill(0);
    translate(location.x, location.y);
    rotate(direction.heading());
    //wings
    quad(0, -10, 5, -25, 12, -25, 12, 0);
    quad(0, 10, 5, 25, 12, 25, 12, 0);
    //blasters
    line(12, -25, 28, -25);
    line(12, 25, 28, 25);
    //body
    quad(0, 7, 50, 2, 50, -2, 0, -7);


    popMatrix();
  }

  void act() {
    super.act();
    shotTimer++;

    if (akey) direction.rotate(-radians(5));
    if (dkey) direction.rotate(radians(5));
    if (wkey) velocity.add(direction);
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Laser());  
      shotTimer = 0;
    }

    if (velocity.mag() > 8) velocity.setMag(8);

    if (location.x > width + 25) {
      location.x = -25;
    }
    if (location.x < -25) {
      location.x = width + 25;
    }
    if (location.y < -25) {
      location.y = height + 25;
    }
    if (location.y > height + 25) {
      location.y = -25;
    }
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof EnemyLaser || myObj instanceof Asteroid || myObj instanceof TieFighter) {
        if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          myObj.lives = 0;
          lives = lives-1;
          for (int k = 0; k <= myObj.size/2; k++) {  //particle effect
            myObjects.add(new Particle(location.x, location.y));
          }
          //while (shotTimer < threshold) {
          //  transparency = 0;
          //  if (lives < lives) {
          //    lives = lives;
          //  }
          
        }
      }   
      i++;
    }

    if (lives == 0) {
      mode = GAMEOVER;
      lives = 3;
      score = 0;
    }
  }
}
