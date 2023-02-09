import javax.swing.*;
import java.awt.*;

//obiekty
//int pid, int pposx, int pposy, int psize

Col colour = new Col(5,310,550);

Brush[] buttons = {
  new Brush(0,50,550,20),
  new Brush(1,102,550,15),
  new Brush(2,154,550,10),
  new Brush(3,206,550,5),
  new Brush(4,258,550,3)
};
Save saveButton;

Cursor crs = new Cursor();

//zmienne
int menuBarSize = 100;


//setup
void setup(){
  noSmooth();
  println(year());
  size(800,600);
  saveButton = new Save(width-52, 547, "floppy.png");
  drawButtons();
  //gui.createAndShowGUI();
  colour.file();
}

//draw
void draw(){

  drawButtons();

}

void mouseDragged(){

  if(mouseY < 500 && crs.selectedSize < 5){
    fill(colour.c);
    noStroke();
    ellipse(mouseX, mouseY, buttons[crs.selectedSize].size, buttons[crs.selectedSize].size);
    stroke(0);
  }
}

void mouseClicked(){
  if(mouseY>=550){
    if(mouseX < width-52){
      if((mouseX-50)/52 == 5)
        colour.action();
      else
        crs.selectedSize = (mouseX-50)/52;
    }
    else
      saveButton.action();
    }
}

void drawButtons(){
  for(int z = 0; z < 5; z++){
    buttons[z].drawSelf();
  }
  saveButton.drawSelf();
  colour.drawSelf();
}

class Cursor{

  int selectedSize = 0;

}
class Buttons{ //wszystkie opcje

  int posx;
  int posy;
  int id;

}

class Brush extends Buttons{

  int size;

  Brush(int pid, int pposx, int pposy, int psize){
    id = pid;
    size = psize;
    posx = pposx;
    posy = pposy;
  }

  void drawSelf(){

    if(crs.selectedSize == id)
    fill(125);
    else
    fill(255);

    rect(posx,posy,50,25);
    ellipse(posx+25,posy+12.5,size,size);
  }

}

class Col extends JFrame{

  int posx;
  int posy;
  int id;
  color c = color(255,255,255);

  Col(int pid, int pposx, int pposy){
    id = pid;
    posx = pposx;
    posy = pposy;
  }

  void drawSelf(){
    fill(c);
    rect(posx,posy,50,25);
  }

  void action(){
    Color javacolor = JColorChooser.showDialog(this,"Choose a color",Color.RED);
    c = color(javacolor.getRed(),javacolor.getGreen(),javacolor.getBlue());
  }

  void file(){
    //JFileChooser.showDialog(this,"Choose a color");
  }

}

class Save extends Buttons{

  int size;
  PImage img;

  Save(int pposx, int pposy, String imgName){
    posx = pposx;
    posy = pposy;
    img = loadImage(imgName);
    /*
    if(img == NULL)
      println("Can't load texture");
      */
  }

  void drawSelf(){
    image(img,posx,posy, 50, 50);
  }

  void action(){
    surface.setSize(width, height - menuBarSize);
    save("lol.png");
    surface.setSize(width, height + menuBarSize);
    //drawButtons();
  }

}
