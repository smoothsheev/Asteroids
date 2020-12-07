class Particle  extends GameObject {
  
  int transparency;
  
  
  Particle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector (random(0, 360), random(0,360));
    velocity.rotate(radians(180) + random(-10, 10));
    velocity.setMag(random(3,8));
    size = random(5, 15);
    lives = 1;
    transparency = 255;
    
  }
  
  void show() {
    strokeWeight(3);
    stroke(255, transparency);
    fill(0, transparency);
    rect(location.x, location.y, size, size);
    rect(location.x, location.y, size, size);
    transparency = transparency -10;
    if (transparency <= 0) lives = 0;
  }
  
  void act() {
    super.act();
    
  }
  
  
  
}
