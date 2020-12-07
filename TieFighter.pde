class TieFighter extends GameObject {
  //1. instance variables
  PVector direction;
  int shotTimer, threshold;
  float rn = random(1);
  //2. Constructors
  TieFighter () {
    if (rn < 0.5) //TOP
      location = new PVector(random(width), 0);
    else 
    location = new PVector(0, random(height));
    direction = new PVector(0.05, 0);
    velocity = new PVector(0, 0);
    lives = 1;
    shotTimer = 0;
    threshold = 60;
    size = 50;
  }


  //3. Behaviour Functions
  void show() {
    pushMatrix();
    strokeWeight(3);
    stroke(255);
    fill(0);
    translate(location.x, location.y);
    rotate(direction.heading());
    //design
    circle(0, 0, 20);
    circle(0, 0, 8);
    line(10, 0, 20, 0);
    line(-10, 0, -20, 0);
    line(20, 20, 20, -20);
    line(-20, -20, -20, 20);
    



    popMatrix();
  }

  void act() {
    super.act();

    //shooting
    shotTimer++;
    if (shotTimer > threshold) {
      myObjects.add(new EnemyLaser(location.x, location.y));
      shotTimer = 0;
    }

    //movement
    velocity.add(direction);
    if (velocity.mag() > 4) velocity.setMag(4);

    if (location.x > myShip.location.x) {
      direction.rotate(radians(1));
    }

    if (location.x < myShip.location.x) {
      direction.rotate(radians(-1));
    }


    //loop
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

    //dying
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Laser) {
        if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          for (int k = 0; k <= size/3; k++) {  //particle effect
            myObjects.add(new Particle(location.x, location.y));
            }
          myObj.lives = 0;
          lives = 0;
          score = score + 1000;
        }
      }
      i++;
    }
  }
}
