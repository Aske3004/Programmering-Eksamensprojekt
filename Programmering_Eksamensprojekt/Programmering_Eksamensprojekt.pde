import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

Game theGame;

float px,py,pzRotation,pzAkse,R2;
PVector direction,movement;

void setup(){
  size(1500,900);
  frameRate(144);
  control = ControlIO.getInstance(this);
  stick = control.filter(GCP.STICK).getMatchedDevice("ControlsForMan");
  stick.getButton("X-key").plug(this, "confirm", ControlIO.ON_RELEASE);
  
  
  
  
  theGame = new Game();
}

void draw(){
  background(255);
  getUserInput();
  theGame.update();
  theGame.draw();
}

void getUserInput(){
  px = map(stick.getSlider("X").getValue(), -1, 1, 0, 2)-1;
  py = map(stick.getSlider("Y").getValue(), -1, 1, 0, 2)-1;
  pzRotation = map(stick.getSlider("Z-rotation").getValue(), -1, 1, 0, 2)-1;
  pzAkse = map(stick.getSlider("Z-akse").getValue(), -1, 1, 0, 2)-1;
  R2 = map(stick.getSlider("R2").getValue(), -1, 1, 0, 1);
  println(R2);
  direction = new PVector(pzAkse,pzRotation);
  movement = new PVector(px,py);
}

void confirm(){
  println("hejsa");
}
