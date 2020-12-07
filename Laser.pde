class Laser extends GameObject {
  //1. Instance variables


  //2. Constructors
  Laser() {
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y);
    velocity.setMag(5);
    size = 10;
    lives = 1;
  }


  void show() {
    stroke(255, 25, 25);
    fill(255);
    pushMatrix(); 
    translate(location.x, location.y);
    rotate (velocity.heading());
    line(0, 0, 10, 0);
    popMatrix();
  }

  //3. Behaviour Functions
  void act() {
    super.act();
    if (location.x < 0 || location.x > width ||  location.y < 0 || location.y > height) {
      lives = 0;
    }
  }
}
