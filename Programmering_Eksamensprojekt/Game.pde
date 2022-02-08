boolean w,a,s,d,turnLeft,turnRight,shoot;
int value=0;

class Game{
  Player thePlayer;
  
  Game(){
    thePlayer = new Player();
  }
  
  void update(){
    thePlayer.update();
  }
  
  void controls(){
    if(w){
      
    }
    if(a){
      
    }
    if(s){
      
    }
    if(d){
      
    }
    if(shoot){
      
    }
    if(turnLeft){
      
    }
    if(turnRight){
      
    }
  }
  
  void draw(){
    controls();
  }
  
}





void keyPressed(){
if (key == 'w') {
    w = true;
    s = false;
  } 
  if (key == 's') {
    s = true;
    w = false;
  }
  if (key == 'a') {
    a = true;
    d = false;
  }
  if (key == 'd') {
    d = true;
    a = false;
  }
  if (keyCode == LEFT) {
    turnLeft = true;
    turnRight = false;
  }
  if (keyCode == RIGHT) {
    turnRight = true;
    turnLeft = false;
  }
  if (key == ' ')
  {
    shoot=true;
  }
}

void keyReleased(){
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
  if (key == 'w') {
    w = false;
  }
  if (key == 's') {
    s = false;
  }  
  if (key == 'a') {
    a = false;
  }  
  if (key == 'd') {
    d = false;
  }
  if (keyCode == LEFT) {
    turnLeft = false;
  }
  if (keyCode == RIGHT) {
    turnRight = false;
  }
  if (key == ' '){
    shoot=false;
  }
}
