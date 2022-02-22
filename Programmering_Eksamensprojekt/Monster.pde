class Monster {
  PVector position;
  float life;
  float speed;
  float angle;

  Monster() {
    position = new PVector(width/2, height/2);
    speed = 0.8;
    life = 1;
  }

  void update() {   
    angle = atan2(theGame.thePlayer.position.y-position.y, theGame.thePlayer.position.x-position.x);
    float newX = cos(angle) * speed + position.x;
    float newY = sin(angle) * speed + position.y;
    position.set(newX,newY,0.);
  }

  void draw() {
    //zombie drawing
    pushMatrix();
    translate(position.x,position.y);
    rotate(angle-4.7);
    fill(34, 177, 76);
    strokeWeight(5);
    circle(0, 0, 40);
    line(20, 0, 20, -30);
    line(-20, 0, -20, -30);
    popMatrix();

    //Big zombie drawing

    //Fast zombie drawin
  }
}
