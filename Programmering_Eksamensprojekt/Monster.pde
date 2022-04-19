class Monster {
  PVector position = new PVector();
  float life, speed, angle;
  String type;
  float size;

  Monster(int typeOfMonster) {
    int chooseHold = int(random(-1,2));
    int chooseSign = int(random(-1,2));
    
    if(chooseHold==0){
      if(chooseSign==0)position.x=-30;
      else position.x=width+30;
      position.y=random(-30,height+30);
    }
    else{
      if(chooseSign==0)position.y=-30;
      else position.y=height+30;
      position.x=random(-30,width+30);
    }
    
    if (typeOfMonster==0||typeOfMonster==2||typeOfMonster==3||typeOfMonster==4) {
      type = "normalZombie";
      speed = 0.8;
      life = 3;
      size=50;
    }
    if (typeOfMonster==5||typeOfMonster==6) {
      type = "bigZombie";
      speed = 0.6;
      life = 15;
      size=70;
    }
    if (typeOfMonster==7||typeOfMonster==8||typeOfMonster==9||typeOfMonster==1) {
      type="fastZombie";
      speed = 3;
      //speed = 1.4;
      life=1;
      size=50;
      //size=40;
    }
  }

  void update() {   
    angle = atan2(thePlayer.position.y-position.y, thePlayer.position.x-position.x);
    float newX = cos(angle) * speed + position.x;
    float newY = sin(angle) * speed + position.y;
    position.set(newX, newY, 0.);
  }

  void render() {
    //Normal zombie drawing
    if (type=="normalZombie") {
      pushMatrix();
      translate(position.x, position.y);
      rotate(angle-4.7);
      fill(34, 177, 76);
      strokeWeight(8);
      line(24, 0, 24, -30);
      line(-24, 0, -24, -30);
      strokeWeight(5);
      circle(0, 0, size);
      popMatrix();
    }

    //Big zombie drawing
    if (type=="bigZombie") {
      pushMatrix();
      translate(position.x, position.y);
      rotate(angle-4.7);
      fill(34, 177, 76);
      strokeWeight(5);
      rect(25, 0, 20, -50);
      rect(-25, 0, -20, -50);
      circle(35, 0, 20);
      circle(-35, 0, 20);
      circle(0, 0, size);
      popMatrix();
    }

    //Fast zombie drawin
    if (type=="fastZombie") {
      pushMatrix();
      translate(position.x, position.y);
      rotate(angle-4.7);
      fill(44, 255, 86);
      strokeWeight(5);
      line(20, 0, 20, -30);
      line(-20, 0, -20, -30);
      strokeWeight(5);
      circle(0, 0, size);
      popMatrix();
    }
  }
}
