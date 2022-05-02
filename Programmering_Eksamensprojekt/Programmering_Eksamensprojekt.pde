import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

Game theGame;
Cursor theCursor;

float px, py, pxRotation, pyRotation, R2;
PVector direction, movement;
ArrayList<Bullet> bullets = new ArrayList();
PImage mainScreen, controlsScreen, deathScreen;

void setup() {
  size(1500, 900);
  frameRate(144);
  imageMode(CENTER);
  mainScreen = loadImage("Design programmerings projekt.png");
  controlsScreen = loadImage("ControlsScreen.png");
  deathScreen = loadImage("DeathScreen.png");
  background(mainScreen);
  control = ControlIO.getInstance(this);
  stick = control.filter(GCP.STICK).getMatchedDevice("TheUser");
  stick.getButton("X-key").plug(this, "confirm", ControlIO.ON_RELEASE);
  stick.getButton("O-key").plug(this, "goBack", ControlIO.ON_RELEASE);
  theGame = new Game();
  theCursor = new Cursor();
}

void draw() {
  getUserInput();
  theGame.update();
  theGame.render();
}

void getUserInput() {
  px = map(stick.getSlider("X position").getValue(), -1, 1, 0, 2)-1;
  py = map(stick.getSlider("Y position").getValue(), -1, 1, 0, 2)-1;
  pxRotation = map(stick.getSlider("RotationX").getValue(), -1, 1, 0, 2)-1;
  pyRotation = map(stick.getSlider("RotationY").getValue(), -1, 1, 0, 2)-1;
  R2 = map(stick.getSlider("Shoot").getValue(), -1, 1, 0, 1);
  direction = new PVector(pxRotation, pyRotation);
  movement = new PVector(px, py);
}

void confirm() {
  if (page==0) {
    controlsButton.update();
    startGameButton.update();
  }
}

void goBack() {
  if (page==2)page=0;
  if (page==3)page=0;
}
