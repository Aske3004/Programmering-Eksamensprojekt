class Monster{
  PVector position;
  float angle;
  float life = 1;
  
  Monster(){
    position = new PVector(width/2,height/2);
  }
  
  void update(){
    
  }
  
  void draw(){
    //zombie drawing
    pushMatrix();
    translate(position.x,position.y);
    fill(34,177,76);
    strokeWeight(5);
    circle(0,0,40);
    line(20,0,20,-30);
    line(-20,0,-20,-30);
    popMatrix();
    
    //Big zombie
    
    //Fast zombie
    
    
    
    
    
  }
}
