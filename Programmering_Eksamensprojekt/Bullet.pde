class Bullet{
  PVector position;
  PVector velocity = new PVector(0,0);
  float angle;
  float life = 1;
  boolean hasBounced=false;
  
  Bullet(PVector pos,float angle){
    position=pos.copy();
    this.angle=angle;
    velocity.x = (float)Math.cos(angle);
    velocity.y = (float)Math.sin(angle);
    velocity.x*=3;
    velocity.y*=3;
  }
  
  void update(){
    
    position.add(velocity);
  }
  
  void draw(){
    pushMatrix();
    translate(position.x,position.y);
    rotate(angle);
    fill(255,0,0);
    strokeWeight(5);
    circle(0,0,5);
    popMatrix();
  }
}
