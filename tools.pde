void button(int x, int y, int w, int h, String label) {
    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY < y + h/2 && mouseY > y - h/2){
  strokeWeight(5);
  stroke(0);
} else {
  strokeWeight(1);
  stroke(0);
}
  fill(255);
  rect(x, y, w, h);
  fill(0);
  textSize(50);
  text(label, x, y);
}

boolean buttonPressed(int x, int y, int w, int h) {
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY < y + h/2 && mouseY > y - h/2) 
    return true;
  else 
    return false; 
}


void button(int x, int y, int w, int h, String label, int t, color f, color stroke) {
    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY < y + h/2 && mouseY > y - h/2){
  strokeWeight(5);
  stroke(stroke);
} else {
  strokeWeight(1);
  stroke(stroke);
}
  fill(255);
  rect(x, y, w, h);
  fill(f);
  textSize(t);
  text(label, x, y);
}
