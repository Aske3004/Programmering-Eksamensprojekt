import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

Game theGame;

float px,py,pxRotation,pyRotation,R2;
PVector direction,movement;

void setup(){
  size(1500,900);
  frameRate(144);
  control = ControlIO.getInstance(this);
  stick = control.filter(GCP.STICK).getMatchedDevice("TheUser");
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
  px = map(stick.getSlider("X position").getValue(), -1, 1, 0, 2)-1;
  py = map(stick.getSlider("Y position").getValue(), -1, 1, 0, 2)-1;
  pxRotation = map(stick.getSlider("RotationX").getValue(), -1, 1, 0, 2)-1;
  pyRotation = map(stick.getSlider("RotationY").getValue(), -1, 1, 0, 2)-1;
  R2 = map(stick.getSlider("Shoot").getValue(), -1, 1, 0, 1);
  //println(R2);
  println(pxRotation);
  direction = new PVector(pyRotation,pxRotation);
  movement = new PVector(px,py);
}

void confirm(){
  println("hejsa");
}
