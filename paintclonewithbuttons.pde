int brushSize = 20;
int brushType = 0; // 0 = round, 1 = square
color brushColor = 0;

void setup() {
  size(400, 400);
  background(255);
  strokeWeight(brushSize);
}

void draw() {
  // draw buttons
  drawButtons();

  if (mousePressed) {
    switch (brushType) {
      case 0:
        // round brush
        stroke(brushColor);
        point(mouseX, mouseY);
        break;
      case 1:
        // square brush
        noStroke();
        fill(brushColor);
        rectMode(CENTER);
        rect(mouseX, mouseY, brushSize, brushSize);
        break;
    }
  }
}

void drawButtons() {
  int buttonWidth = 50;
  int buttonHeight = 30;
  int gap = 10;
  int x = width - buttonWidth - gap;
  int y = height - buttonHeight - gap;

  fill(255);
  rect(x, y, buttonWidth, buttonHeight);
  fill(0);
  text("Black", x + gap, y + gap);

  y -= buttonHeight + gap;
  fill(255);
  rect(x, y, buttonWidth, buttonHeight);
  fill(0);
  text("Blue", x + gap, y + gap);

  y -= buttonHeight + gap;
  fill(255);
  rect(x, y, buttonWidth, buttonHeight);
  fill(0);
  text("Green", x + gap, y + gap);

  y -= buttonHeight + gap;
  fill(255);
  rect(x, y, buttonWidth, buttonHeight);
  fill(0);
  text("Red", x + gap, y + gap);
}

void mousePressed() {
  int buttonWidth = 50;
  int buttonHeight = 30;
  int gap = 10;
  int x = width - buttonWidth - gap;
  int y = height - buttonHeight - gap;

  // check if buttons have been clicked
  if (mouseX >= x && mouseX <= x + buttonWidth &&
      mouseY >= y && mouseY <= y + buttonHeight) {
    brushColor = 0;
  }
  y -= buttonHeight + gap;
  if (mouseX >= x && mouseX <= x + buttonWidth &&
      mouseY >= y && mouseY <= y + buttonHeight) {
    brushColor = color(0, 0, 255);
  }
  y -= buttonHeight + gap;
  if (mouseX >= x && mouseX <= x + buttonWidth &&
      mouseY >= y && mouseY <= y + buttonHeight) {
    brushColor = color(0, 255, 0);
  }
  y -= buttonHeight + gap;
  if (mouseX >= x && mouseX <= x + buttonWidth &&
      mouseY >= y && mouseY <= y + buttonHeight) {
    brushColor = color(255, 0, 0);
  }
}
