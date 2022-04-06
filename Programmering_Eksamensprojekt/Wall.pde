class Wall{
  float diameter;
  PVector position;
  
  Wall(PVector position_,float diameter_){
    diameter=diameter_;
    position=position_;
  }
  
  void draw(){
    fill(178,104,0);
    pushMatrix();
    strokeWeight(5);
    translate(position.x,position.y);
    circle(0,0,diameter);
    popMatrix();
    
  }
}
