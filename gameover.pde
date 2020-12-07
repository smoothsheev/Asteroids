void gameover() {
  background(10);
  button(200, 400, 375, 150, "RETRY");
  button(600, 400, 375, 150, "QUIT");
}
void gameoverClicks() {
   if (buttonPressed(200, 400, 375, 150)) {
      mode = INTRO;
      setup();
    }
    if (buttonPressed(600, 400, 375, 150)) {
      exit();
    }
}
