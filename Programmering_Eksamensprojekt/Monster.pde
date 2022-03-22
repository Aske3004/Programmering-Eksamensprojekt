class Monster {
  PVector position;
  float life, speed, angle;
  String type;

  Monster(int typeOfMonster) {
    position = new PVector(random(0, width), random(0, height));
    if (typeOfMonster==0) {
      type = "normalZombie";
      speed = 0.8;
      life = 3;
    }
    if (typeOfMonster==1) {
      type = "bigZombie";
      speed = 0.6;
      life = 15;
    }
    if (typeOfMonster==2) {
      type="fastZombie";
      speed = 1.4;
      life=1;
    }
  }

  void update() {   
    angle = atan2(theGame.thePlayer.position.y-position.y, theGame.thePlayer.position.x-position.x);
    float newX = cos(angle) * speed + position.x;
    float newY = sin(angle) * speed + position.y;
    position.set(newX, newY, 0.);
  }

  void draw() {
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
      circle(0, 0, 50);
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
      circle(0, 0, 70);
      popMatrix();
    }

    //Fast zombie drawin
    if (type=="fastZombie") {
      pushMatrix();
      translate(position.x, position.y);
      rotate(angle-4.7);
      fill(44, 255, 86);
      line(20, 0, 20, -30);
      line(-20, 0, -20, -30);
      strokeWeight(5);
      circle(0, 0, 40);
      popMatrix();
    }
  }
}
