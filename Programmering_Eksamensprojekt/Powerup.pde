int remainingDrawsWithFastFire = 0;
int remainingDrawsWithGoldenGun = 0;

class Powerup {
  String type;
  PVector position;
  int diameter = 40;
  int life=1;

  Powerup(int typeOfPowerup) {
    position = new PVector(random(0, width), random(0, height));
    if (typeOfPowerup==0) {
      type="Healing";
    }
    if (typeOfPowerup==1) {
      type="FastFire";
    }
    if (typeOfPowerup==2) {
      type="GoldenGun";
    }
  }

  void render() {
    //Healing
    if (type=="Healing") {
      pushMatrix();
      translate(position.x,position.y);
      strokeWeight(5);
      stroke(255);
      fill(0,150,0);
      circle(0,0,diameter);
      line(0,0,0,10);
      line(0,0,0,-10);
      line(0,0,10,0);
      line(0,0,-10,0);
      stroke(0);
      popMatrix();
    }

    //FastFire
    if (type=="FastFire") {
      pushMatrix();
      translate(position.x,position.y);
      strokeWeight(5);
      stroke(255);
      fill(255,76,91);
      circle(0,0,diameter);
      strokeWeight(3);
      line(0,-4,0,4);
      line(6,-4,6,4);
      line(-6,-4,-6,4);
      stroke(0);
      popMatrix();
    }

    //GoldenGun(more damage)
    if (type=="GoldenGun") {
      pushMatrix();
      translate(position.x,position.y);
      strokeWeight(5);
      stroke(255);
      fill(255,195,107);
      circle(0,0,diameter);
      strokeWeight(3);
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("2x",-1,6);
      stroke(0);
      textAlign(CORNER);
      popMatrix();
    }
  }
}
