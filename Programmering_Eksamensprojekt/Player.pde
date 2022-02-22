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
    strokeWeight(7);
    line(23,-5,0,-60);
    line(-23,-5,0,-60);
    strokeWeight(5);
    circle(0,0,50);
    fill(127);
    strokeWeight(2);
    rect(-6,-54,12,-25);
    popMatrix();
  }
}
