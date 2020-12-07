class Asteroid extends GameObject {
  //1. Instance variables
  float rn = random(1);
  

  //2. Constructors
  Asteroid() {
    if (rn < 0.5) //TOP
      location = new PVector(random(width), 0);
    else 
    location = new PVector(0, random(height));
    velocity = new PVector (0, 1);
    velocity.rotate(random(TWO_PI) );
    size = random(40, 150);
    lives = 1;
  }
  Asteroid(float s, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector (0, 1);
    velocity.rotate(random(TWO_PI) );
    size = s;
    lives = 1;
  }




  //3. Behaviour Functions
  void show() {
    super.show();
  }

  void act() {
    super.act();

  
    if (location.x< 0) {
      location.x = width;
    }
    if (location.x > width) {
      location.x = 0;
    }
    if (location.y > height) {
      location.y = 0;
    }
    if (location.y < 0) {
      location.y = height;
    }

    //die to bullet
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Laser) {
        if ( dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          myObj.lives = 0;
          lives = 0;
          score = score + (200 - size);
           for (int k = 0; k <= size/3; k++) {  //particle effect
            myObjects.add(new Particle(location.x, location.y));
            }
          if (size > 40) {
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            myObjects.add(new Asteroid(size/2, location.x, location.y));
          }
        }
      }
      i++;
    }
  }
}
