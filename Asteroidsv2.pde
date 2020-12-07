int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
float highscore = 0;

XWing myShip;
ArrayList<GameObject> myObjects;

boolean wkey, akey, skey, dkey, spacekey;
float score = 0;

void setup() {
  mode = INTRO;
 size(1200, 800);
  rectMode(CENTER); 
  textAlign(CENTER, CENTER);
  myShip  = new XWing();

  wkey = akey = skey = dkey = spacekey = false;
  myObjects = new ArrayList<GameObject>();
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());

  myObjects.add(new TieFighter());
  myObjects.add(new TieFighter());
  myObjects.add(new TieFighter());
 
}

void draw() {
 if (mode == INTRO) {
   intro();
 } else if (mode == GAME) {
   game();
 } else if (mode == PAUSE) {
   pause();
 } else if (mode == GAMEOVER) {
   gameover();
 } else {
   println("ERROR! Mode is " + mode);
 }
}
