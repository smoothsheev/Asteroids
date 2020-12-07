void pause() {
  background(180);
  button(400, 400, 400, 150, "UNPAUSE", 70, 0, 0);
}

void pauseClicks() {
    if (buttonPressed(400, 400, 400, 150)) {
      mode = GAME;
    }
}
