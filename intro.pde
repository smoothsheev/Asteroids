void intro() {
  background(180);
  
  if (mouseX > 200 && mouseX < 400 && mouseY < 650 && mouseY > 550){
  strokeWeight(5);
  stroke(0);
} else {
  strokeWeight(1);
  stroke(0);
}
//highschore
text("Highscore: " + (int)highscore, width/2, height/2);
//drawing button
button(250, 600, 200, 100, "START");
button(550, 600, 200, 100, "QUIT");

  
}

void introClicks() {
  if (buttonPressed(300, 600, 200, 100)) {
   mode = GAME; 
  }
  if (buttonPressed(550, 600, 200, 100)) {
   exit();
  }  
}
