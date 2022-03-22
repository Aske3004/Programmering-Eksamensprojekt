

boolean w,a,s,d,shoot;
int value=255;

ControlIO control;
ControlDevice stick;

class Game{
  Player thePlayer;
  ArrayList<Monster> monsters = new ArrayList<Monster>();
  
  Game(){
    thePlayer = new Player();
    monsters.add(new Monster(1));
    monsters.add(new Monster(0));
    monsters.add(new Monster(2));
    monsters.add(new Monster(int(random(-1,3))));
    
    
  }
  
  void update(){
    thePlayer.update();
    for (int i = 0; i < monsters.size(); i++) {
       Monster x = monsters.get(i);
      if (x.life > 0)
        x.update();
      else
        monsters.remove(i);
    }
  }
  
  void controls(){
    if(value==0){
      //thePlayer.bullets.add(new Bullet(thePlayer.position,thePlayer.playerAngle));
      value=255;
    }
  }
  
  void draw(){
    thePlayer.draw();
    controls();
    for (int i = 0; i < monsters.size(); i++) {
       Monster x = monsters.get(i);
      if (x.life > 0)
        x.draw();
      else
        monsters.remove(i);
    }
  }
}

void keyPressed(){
  if (key == ' ')
  {
    shoot=true;
    value=255;
  }
}

void keyReleased(){
  if (key == ' '){
    shoot=false;
    value=0;
  }
}
