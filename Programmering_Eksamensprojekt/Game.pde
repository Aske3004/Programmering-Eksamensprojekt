
int page = 0;
boolean w, a, s, d, shoot;
int value=255;

ControlIO control;
ControlDevice stick;

Button controlsButton;
Button startGameButton;

ArrayList<Wall> walls = new ArrayList();
ArrayList<Monster> monsters = new ArrayList<Monster>();
ArrayList<Powerup> powerups = new ArrayList<Powerup>();
Player thePlayer;
ControlScore controlScore;

float lastRoundScore;

int countTheAmountOfFrames;
int drawsSinceLastPowerup;
int drawsUntilNextZombieSpawn=720;
int currentZombieDrawCount;
int killCounter;

class Game {



  Game() {
    controlScore = new ControlScore();
    controlsButton = new Button(new PVector(750, 521), new PVector(364, 141), 2);
    startGameButton = new Button(new PVector(750, 706), new PVector(364, 141), 1);

    walls.add(new Wall(new PVector(206, 184), 35*2));
    walls.add(new Wall(new PVector(300, 526), 70*2));
    walls.add(new Wall(new PVector(527, 746), 33*2));
    walls.add(new Wall(new PVector(568, 305), 20*2));
    walls.add(new Wall(new PVector(863, 548), 52*2));
    walls.add(new Wall(new PVector(1010, 162), 74*2));
    walls.add(new Wall(new PVector(1114, 743), 32*2));
    walls.add(new Wall(new PVector(1319, 151), 10*2));
    walls.add(new Wall(new PVector(1310, 489), 36*2));
  }

  void update() {
    //STARTSCREEN
    if (page==0) {
      theCursor.update();
    }

    //GAMEPAGE
    if (page==1) {
      if (drawsSinceLastPowerup>=1008&&powerups.size()<3) {
        powerups.add(new Powerup(int(random(-1, 3))));
        drawsSinceLastPowerup=0;
      }
      if(currentZombieDrawCount>=drawsUntilNextZombieSpawn){
        if(monsters.size()<30){
          monsters.add(new Monster(int(random(-1, 10))));
        monsters.add(new Monster(int(random(-1, 10))));
        }
        else{
        monsters.remove(0);
        monsters.add(new Monster(int(random(-1, 10))));
      }
        
        if(drawsUntilNextZombieSpawn>144)drawsUntilNextZombieSpawn-=40;
        currentZombieDrawCount=0;
      }
      
      
      collisionDetection();
      thePlayer.update();
      for (int i = 0; i < monsters.size(); i++) {
        Monster x = monsters.get(i);
        if (x.life > 0)
          x.update();
        else{
          monsters.remove(i);
          killCounter++;
          println(killCounter);
        }
      }
      controlScore.update();
      remainingDrawsWithFastFire--;
      remainingDrawsWithGoldenGun--;
      countTheAmountOfFrames++;
      drawsSinceLastPowerup++;
      currentZombieDrawCount++;
      if (thePlayer.life==0) {
        lastRoundScore=controlScore.currentScore;
        page=3;
        monsters.clear();
        bullets.clear();
        powerups.clear();
      }
    }

    if (page==2) {
      //CONTROLSPAGE
    }

    if (page==3) {
      //DeathScreen
    }
  }

  void render() {
    if (page==0) {
      background(mainScreen);
      theCursor.render();
      textAlign(CENTER);
      textSize(50);
      fill(255);
      text("Sidste runde var din score: "+int(lastRoundScore), width/2, height-80);
      text("Din highscore er: "+int(controlScore.highScore), width/2, height-20);
      textAlign(CORNER);
    }



    if (page==1) {
      background(165);



      thePlayer.render();
      for (int i = 0; i < bullets.size(); i++) {
        Bullet n = bullets.get(i);
        if (n.life > 0) {
          n.render();
        } else
          bullets.remove(i);
      }

      for (int i = 0; i < monsters.size(); i++) {
        Monster x = monsters.get(i);
        if (x.life > 0)
          x.render();
        else monsters.remove(i);
      }
      for (int i = 0; i < powerups.size(); i++) {
        Powerup p = powerups.get(i);
        if (p.life > 0)
          p.render();
        else
          powerups.remove(i);
      }
      for (Wall theWall : walls) {
        theWall.render();
      }

      controlScore.render();
      textAlign(CENTER);
      text("Dine liv: "+thePlayer.life, width/2, height-50);
      text("Zombie drab: "+killCounter,width-200,50);
      textAlign(CORNER);
    }

    if (page==2) {
      background(controlsScreen);

      //CONTROLSPAGE
    }

    if (page==3) {
      //DEATHSCREEN
      background(deathScreen);
      textAlign(CENTER);
      textSize(130);
      fill(0);
      text(int(lastRoundScore), width/2, 570);
      textAlign(CORNER);
    }
  }


  void collisionDetection() {

    for (Wall theWall : walls) {
      //COLLISION MELLEM VÆG OG SPILLER
      if (collide(theWall.position.x, theWall.position.y, theWall.diameter/2, thePlayer.position.x, thePlayer.position.y, thePlayer.diameter/2)) {
        PVector diffe = new PVector(thePlayer.position.x-theWall.position.x, thePlayer.position.y-theWall.position.y);
        thePlayer.position = PVector.add(theWall.position, diffe.normalize().mult(thePlayer.diameter/2+theWall.diameter/2));
      }


      //COLLISION HVOR MONSTRERNE ER INKLUDERET
      for (Monster theMonster : monsters) {

        //COLLISION MELLEM MONSTER OG VÆG
        if (collide(theWall.position.x, theWall.position.y, theWall.diameter/2, theMonster.position.x, theMonster.position.y, theMonster.size/2)) {
          PVector diffe = new PVector(theMonster.position.x-theWall.position.x, theMonster.position.y-theWall.position.y);
          theMonster.position = PVector.add(theWall.position, diffe.normalize().mult(theMonster.size/2+theWall.diameter/2));
        }

        //COLLISION MELLEM SPILLER OG MONSTRER
        if (collide(thePlayer.position.x, thePlayer.position.y, thePlayer.diameter/2, theMonster.position.x, theMonster.position.y, theMonster.size/2)) {
          PVector diffe = new PVector(theMonster.position.x-thePlayer.position.x, theMonster.position.y-thePlayer.position.y);
          theMonster.position = PVector.add(thePlayer.position, diffe.normalize().mult(theMonster.size/2+thePlayer.diameter/2));
          if (thePlayer.drawsSinceLastHit>72) {
            thePlayer.life--;
            thePlayer.drawsSinceLastHit=0;
          }
        }
      }

      //COLLISION HVOR BULLET ER INKLUDERET
      for (Bullet theBullet : bullets) {
        //COLLISION MELLEM KANT OG BULLET
        if (theBullet.position.x<0||theBullet.position.x>width||theBullet.position.y<0||theBullet.position.y>height) {
          theBullet.life--;
        }


        //COLLISION MELLEM VÆG OG BULLET
        if (collide(theWall.position.x, theWall.position.y, theWall.diameter/2, theBullet.position.x, theBullet.position.y, 5/2)) {
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

      for (Powerup thePowerup : powerups) {
        if (collide(theWall.position.x, theWall.position.y, theWall.diameter/2, thePowerup.position.x, thePowerup.position.y, thePowerup.diameter/2)) {
          thePowerup.position = new PVector (random(0, width), random(0, height));
        }
        if (collide(thePlayer.position.x, thePlayer.position.y, thePlayer.diameter/2, thePowerup.position.x, thePowerup.position.y, thePowerup.diameter/2)) {
          //HVAD DER SKAL SKE HVIS DET ER EN HEALING MAN COLLIDER MED
          if (thePowerup.type=="Healing") {
            thePlayer.life=5;
            thePowerup.life=0;
          }


          //HVAD DER SKAL SKE HVIS DET ER EN FASTFIRE MAN COLLIDER MED
          if (thePowerup.type=="FastFire") {
            remainingDrawsWithFastFire = 720;
            thePowerup.life=0;
          }


          //HVAD DER SKAL SKE HVIS DET ER EN GOLDENGUN MAN COLLIDER MED
          if (thePowerup.type=="GoldenGun") {
            remainingDrawsWithGoldenGun = 720;
            thePowerup.life=0;
          }
        }
      }
    }


    for (Bullet bullet : bullets) {
      for (Monster monster : monsters) {

        if (collide(monster.position.x, monster.position.y, monster.size/2, bullet.position.x, bullet.position.y, 5)) {
          monster.life-=bullet.bulletDamage;
          bullet.life--;
        }
      }
    }

    for (Monster Monster1 : monsters) {
      for (Monster Monster2 : monsters) {
        if (Monster1==Monster2) {
          continue;
        }
        if (collide(Monster1.position.x, Monster1.position.y, Monster1.size/2, Monster2.position.x, Monster2.position.y, Monster2.size/2)) {
          PVector diffe = new PVector(Monster2.position.x-Monster1.position.x, Monster2.position.y-Monster1.position.y);
          Monster2.position = PVector.add(Monster1.position, diffe.normalize().mult(Monster2.size/2+Monster1.size/2));
        }
      }
    }
  }


  boolean collide(float x1, float y1, float r1, float x2, float y2, float r2) {
    float dist = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
    return(dist<r1+r2);
  }
}
