
int page = 0;
boolean w,a,s,d,shoot;
int value=255;

ControlIO control;
ControlDevice stick;

Button controlsButton;
Button startGameButton;

ArrayList<Wall> walls = new ArrayList();
ArrayList<Monster> monsters = new ArrayList<Monster>();

class Game{
  Player thePlayer;
  ControlScore controlScore;
  
  
  Game(){
    controlScore = new ControlScore();
    thePlayer = new Player();
    monsters.add(new Monster(1));
    monsters.add(new Monster(0));
    monsters.add(new Monster(2));
    controlsButton = new Button(new PVector(750,521),new PVector(364,141),2);
    startGameButton = new Button(new PVector(750,706),new PVector(364,141),1);
    
    //controlsButton = new Button(new PVector(568,450),new PVector(364,141),2);
    //startGameButton = new Button(new PVector(568,635),new PVector(364,141),1);
    //monsters.add(new Monster(int(random(-1,3))));
    
    
    walls.add(new Wall(new PVector(206,184),35*2));
    walls.add(new Wall(new PVector(300,526),70*2));
    walls.add(new Wall(new PVector(527,746),33*2));
    walls.add(new Wall(new PVector(568,305),20*2));
    walls.add(new Wall(new PVector(863,548),52*2));
    walls.add(new Wall(new PVector(1010,162),74*2));
    walls.add(new Wall(new PVector(1114,743),32*2));
    walls.add(new Wall(new PVector(1319,151),10*2));
    walls.add(new Wall(new PVector(1310,489),36*2));
  }
  
  void update(){
    if(page==0){
      //MAINSCREENPAGE
      theCursor.update();
      
    }
    
    if(page==1){
      //GAMEPAGE
      background(165);
      collisionDetection();
    thePlayer.update();
    for (int i = 0; i < monsters.size(); i++) {
       Monster x = monsters.get(i);
      if (x.life > 0)
        x.update();
      else
        monsters.remove(i);
    }
    for (Wall theWall : walls){
      theWall.draw();
    }
    controlScore.update();
  }
  
  if(page==2){
    //CONTROLSPAGE
  }
  
  
  
  }
  

  
  void draw(){
    if(page==0){
      background(mainScreen);
      theCursor.draw();
    }
    
    
    
    if(page==1){
      //background(165);
     
    thePlayer.draw();
    for (int i = 0; i < bullets.size(); i++) {
       Bullet n = bullets.get(i);
      if (n.life > 0){
        n.draw();
      }
      else
        bullets.remove(i);
    }
    
    for (int i = 0; i < monsters.size(); i++) {
       Monster x = monsters.get(i);
      if (x.life > 0)
        x.draw();
      else
        monsters.remove(i);
    }
    controlScore.draw();
    text("Dine liv: "+thePlayer.life,width/2,50);
  }
  
  if(page==2){
    background(controlsScreen);
    
    //CONTROLSPAGE
  }
  }
  
  
  void collisionDetection(){
    
    for(Wall theWall : walls){
      //COLLISION MELLEM VÆG OG SPILLER
      if(collide(theWall.position.x,theWall.position.y,theWall.diameter/2,thePlayer.position.x,thePlayer.position.y,thePlayer.diameter/2)){
        PVector diffe = new PVector(thePlayer.position.x-theWall.position.x, thePlayer.position.y-theWall.position.y);
        thePlayer.position = PVector.add(theWall.position, diffe.normalize().mult(thePlayer.diameter/2+theWall.diameter/2));
      }
      
      
      //COLLISION HVOR MONSTRERNE ER INKLUDERET
      for(Monster theMonster : monsters){
        
        //COLLISION MELLEM MONSTER OG VÆG
        if(collide(theWall.position.x,theWall.position.y,theWall.diameter/2,theMonster.position.x,theMonster.position.y,theMonster.size/2)){
        PVector diffe = new PVector(theMonster.position.x-theWall.position.x, theMonster.position.y-theWall.position.y);
        theMonster.position = PVector.add(theWall.position, diffe.normalize().mult(theMonster.size/2+theWall.diameter/2));
      }
      
      //COLLISION MELLEM SPILLER OG MONSTRER
        if(collide(thePlayer.position.x,thePlayer.position.y,thePlayer.diameter/2,theMonster.position.x,theMonster.position.y,theMonster.size/2)){
          PVector diffe = new PVector(theMonster.position.x-thePlayer.position.x, theMonster.position.y-thePlayer.position.y);
          theMonster.position = PVector.add(thePlayer.position, diffe.normalize().mult(theMonster.size/2+thePlayer.diameter/2));
          if(thePlayer.drawsSinceLastHit>144){
            thePlayer.life--;
            thePlayer.drawsSinceLastHit=0;
            println("TOG SKADE");
          }
        }
      }
      
      //COLLISION HVOR BULLET ER INKLUDERET
      for(Bullet theBullet : bullets){
        //COLLISION MELLEM KANT OG BULLET
        if(theBullet.position.x<0||theBullet.position.x>width||theBullet.position.y<0||theBullet.position.y>height){
        theBullet.life--;
      }
        
        
        //COLLISION MELLEM VÆG OG BULLET
        if (collide(theWall.position.x, theWall.position.y, theWall.diameter/2, theBullet.position.x, theBullet.position.y, 5/2)){
        PVector diffe = new PVector(theBullet.position.x-theWall.position.x, theBullet.position.y-theWall.position.y);
        theBullet.position = PVector.add(theWall.position, diffe.normalize().mult((5/2)+(theWall.diameter/2)));
        PVector commonTangent = new PVector(theWall.position.y-theBullet.position.y, theBullet.position.x-theWall.position.x);
        float dotProduct = theBullet.velocity.dot(commonTangent);
        float tangentLength = commonTangent.dist(new PVector(0, 0));
        PVector projection = commonTangent.mult(dotProduct/(tangentLength*tangentLength)).add(theBullet.velocity.mult(-1));
        theBullet.velocity.mult(-1);
        theBullet.velocity.add(projection.mult(2));
      }
      
      }
    }
    
  
  for(Bullet bullet : bullets){
      for(Monster monster : monsters){
        
      if(collide(monster.position.x,monster.position.y,monster.size/2,bullet.position.x,bullet.position.y,5)){
      monster.life--;
      bullet.life--;
    }
    }
  }
  
  for(Monster Monster1 : monsters){
  for(Monster Monster2 : monsters){
    if(Monster1==Monster2){
     continue; 
    }
    if(collide(Monster1.position.x,Monster1.position.y,Monster1.size/2,Monster2.position.x,Monster2.position.y,Monster2.size/2)){
          PVector diffe = new PVector(Monster2.position.x-Monster1.position.x, Monster2.position.y-Monster1.position.y);
          Monster2.position = PVector.add(Monster1.position, diffe.normalize().mult(Monster2.size/2+Monster1.size/2));
        }
  }
}
}


boolean collide(float x1,float y1,float r1,float x2,float y2,float r2){
  float dist = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
  return(dist<r1+r2);
}

}
