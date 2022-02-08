Game theGame;


void setup(){
  size(1500,900);
  theGame = new Game();
}

void draw(){
  background(255);
  theGame.update();
  theGame.draw();
}
