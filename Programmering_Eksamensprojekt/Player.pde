class Player {
  PVector position, velocity;
  float angle;
  float newX, newY;
  float theDirectionx, theDirectiony;
  float shootingCooldown=60;
  float drawsSinceLastShot;
  float diameter=50;
  int life =5;
  int drawsSinceLastHit=72;

  Player() {
    position = new PVector(width/2, height/2);
    newX=width/2;
    newY=height/2;
    velocity = new PVector(0, 0);
  }

  void update() {
    for (int i = 0; i < bullets.size(); i++) {
      bullets.get(i).update();
    }

    //Make the player turn if the stick is out of the deadzone
    if (direction.x<-0.2||direction.x>0.2||direction.y>0.4||direction.y<-0.4) {
      theDirectionx=direction.x;
    }
    if (direction.y<-0.2||direction.y>0.2||direction.x>0.4||direction.x<-0.4) {
      theDirectiony=direction.y;
    }
    angle = atan2(position.y+theDirectiony-position.y, position.x+theDirectionx-position.x);


    //Make the player move if the stick is out of the deadzone
    if (movement.x<-0.2||movement.x>0.2) {
      newX =  position.x+px*2;
    } else movement.x=0;
    if (movement.y<-0.2||movement.y>0.2) {
      newY =  position.y+py*2;
    } else movement.y=0;
    position.set(newX, newY, 0.);

    if (position.y>height)position.y=height;
    if (position.y<0)position.y=0;
    if (position.x>width)position.x=width;
    if (position.x<0)position.x=0;

    if (remainingDrawsWithFastFire<0)shootingCooldown=60;
    else shootingCooldown = 30;

    if (R2>0.5&&drawsSinceLastShot>shootingCooldown) {
      Boolean isInsideWall = false;
      for (Wall theWall : walls) {
        if (theGame.collide(theWall.position.x, theWall.position.y, theWall.diameter/2, position.x+(75*cos(angle)), position.y+(75*sin(angle)), 5/2)) {
          isInsideWall=true;
        }
      }
      if (isInsideWall==false) {
        drawsSinceLastShot=0;
        bullets.add(new Bullet(new PVector(position.x+(75*cos(angle)), position.y+(75*sin(angle))), angle));
      }
    }
    drawsSinceLastShot++;
    drawsSinceLastHit++;
  }

  void render() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle-4.7);
    if (drawsSinceLastHit>72)fill(128, 64, 0);
    else fill(200, 64, 0);
    strokeWeight(7);
    line(23, -5, 0, -60);
    line(-23, -5, 0, -60);
    strokeWeight(5);
    circle(0, 0, diameter);
    fill(127);
    strokeWeight(2);
    rect(-6, -54, 12, -25);
    popMatrix();
  }
}
