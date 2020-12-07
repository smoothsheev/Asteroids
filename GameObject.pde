class GameObject {
  //1. Instance
  PVector location;
  PVector velocity;
  float size;
  int lives;

  //2. Constructor
  GameObject() {
    
  }
  //3. Behaviour Functions
  void show() {
    strokeWeight(3);
    stroke(255);
    fill(0);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
     location.add(velocity);
  
  }
}
