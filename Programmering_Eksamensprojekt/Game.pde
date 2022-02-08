boolean w,a,s,d,shoot;
int value=255;

class Game{
  Player thePlayer;
  
  Game(){
    thePlayer = new Player();
  }
  
  void update(){
    thePlayer.update();
    thePlayer.draw();
  }
  
  void controls(){
    if(w){
      thePlayer.speed=2;
    }
    if(a){
      thePlayer.playerAngle-=2;
    }
    if(s){
      thePlayer.speed=-2;
    }
    if(d){
      thePlayer.playerAngle+=2;
    }
    if(value==0){
      thePlayer.bullets.add(new Bullet(thePlayer.position,thePlayer.playerAngle));
      value=255;
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
  if (key == ' ')
  {
    shoot=true;
    value=255;
  }
}

void keyReleased(){
  if (key == 'w') {
    w = false;
    theGame.thePlayer.speed=0;
  }
  if (key == 's') {
    s = false;
    theGame.thePlayer.speed=0;
  }  
  if (key == 'a') {
    a = false;
  }  
  if (key == 'd') {
    d = false;
  }
  if (key == ' '){
    shoot=false;
    value=0;
  }
}
