class Player{
  PVector position, velocity;
  float playerAngle = 180;
  float speed=0;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  
  Player(){
    position = new PVector(0,0);
    velocity = new PVector(0,0);
  }
  
  void update(){
    velocity.x = (float)Math.sin(radians(playerAngle));
    velocity.y = -(float)Math.cos(radians(playerAngle));
    velocity.x*=speed;
    velocity.y*=speed;
    position.add(velocity);
    for (int i = 0; i < bullets.size(); i++) {
      bullets.get(i).update();
    }
  }
  
  void draw(){
    for (int i = 0; i < bullets.size(); i++) {
       Bullet n = bullets.get(i);
      if (n.life > 0)
        n.draw();
      else
        bullets.remove(i);
    }
    pushMatrix();
    translate(position.x,position.y);
    rotate(radians(playerAngle));
    fill(128,64,0);
    strokeWeight(5);
    circle(0,0,50);
    fill(0);
    line(25,-5,0,-60);
    line(-25,-5,0,-60);
    fill(127);
    strokeWeight(2);
    rect(-4,-54,8,-20);
    popMatrix();
  }
}
