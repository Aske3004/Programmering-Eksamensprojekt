class Bullet{
  PVector position;
  PVector velocity = new PVector(0,0);
  float angle;
  float life = 1;
  
  
  Bullet(PVector pos,float angle){
    position=pos.copy();
    this.angle=angle;
  }
  
  void update(){
    velocity.x = (float)Math.sin(radians(angle));
    velocity.y = -(float)Math.cos(radians(angle));
    velocity.x*=3;
    velocity.y*=3;
    position.add(velocity);
  }
  
  void draw(){
    pushMatrix();
    translate(position.x,position.y);
    rotate(radians(angle));
    fill(255,0,0);
    strokeWeight(5);
    circle(0,-75,5);
    popMatrix();
  }
}
