int brushSize = 20;
int brushType = 0; // 0 = round, 1 = square

void setup() {
  size(400, 400);
  background(255);
  strokeWeight(brushSize);
}

void draw() {
  if (mousePressed) {
    switch (brushType) {
      case 0:
        // round brush
        stroke(0);
        point(mouseX, mouseY);
        break;
      case 1:
        // square brush
        noStroke();
        fill(0);
        rectMode(CENTER);
        rect(mouseX, mouseY, brushSize, brushSize);
        break;
    }
  }
}

void keyPressed() {
  // change brush size
  if (key == '+') {
    brushSize += 5;
  }
  if (key == '-') {
    brushSize -= 5;
  }

  // change brush type
  if (key == 'r') {
    brushType = 0;
  }
  if (key == 's') {
    brushType = 1;
  }

  // clear the canvas
  if (key == 'c') {
    background(255);
  }

  strokeWeight(brushSize);
}
