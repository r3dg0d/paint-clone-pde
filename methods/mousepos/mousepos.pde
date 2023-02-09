void setup() {
 size(800, 600);
 background(255);
}

void draw() {
  // Load mouseX && mouseY Position in window
    text(mousePos(), 200, 200);
  println(mousePos());
}

String mousePos() {
 // Set mouseX && mouseY Data as a float
 float mousePosX = mouseX;
 float mousePosY = mouseY;
 
 // Set current mouse position string
 String mouseText = "Current mouse position: \n\t" + mousePosX + mousePosY;
 
 return(mouseText); 
}
  
