  int asteroidTimer = 0;
  int asteroidThreshold = 500;
  int tieTimer = 0;
  int tieThreshold = 1200;


void game() {

  background(0);
  myShip.show();
  myShip.act();
  fill(255);
  text("score: " + int(score), 100, 20);
    text("lives: " + (myShip.lives), 100, 50);

  print(asteroidTimer);
  int i = 0;
  while (i < myObjects.size() ) {
    GameObject obj = myObjects.get(i);
    if (obj.lives > 0) {
      obj.act();
      obj.show();
      i++;
    } else {
      myObjects.remove(i);
    }
  }

  //spawning Asteroids
  asteroidTimer++;
 
  if (asteroidTimer > asteroidThreshold) {
    myObjects.add(new Asteroid());  
    asteroidTimer = 0;
  }
  //spawning Tie Fighters
  tieTimer++;


  if (tieTimer > tieThreshold) {
    myObjects.add(new TieFighter());
    tieTimer = 0;
    tieThreshold = tieThreshold - 50;
  }

  button(width - 150, 50, 100, 50, "PAUSE", 25, 0, 0);
  if (score > highscore) {
    highscore = score;
  }
}

void gameClicks() {
  if (buttonPressed(100, 50, 100, 50)) {
    mode = PAUSE;
  } else
    mode = GAMEOVER;
}
