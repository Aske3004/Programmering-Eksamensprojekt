class Player{
  PVector position, velocity;
  float angle;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  float newX=width/2,newY=height/2;
  float theDirectionx,theDirectiony;
  
  Player(){
    position = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
  }
  
  void update(){
    
    for (int i = 0; i < bullets.size(); i++) {
      bullets.get(i).update();
    }
    
    //Make the player turn if the stick is out of the deadzone
    if(direction.x<-0.2||direction.x>0.2||direction.y>0.4||direction.y<-0.4){
      theDirectionx=direction.x;
    }
    if(direction.y<-0.2||direction.y>0.2||direction.x>0.4||direction.x<-0.4){
      theDirectiony=direction.y;
    }
    angle = atan2(position.y+theDirectiony-position.y, position.x+theDirectionx-position.x);
    
    //Make the player move if the stick is out of the deadzone
    if(movement.x<-0.2||movement.x>0.2){
    newX =  position.x+px*2;
    }
    else movement.x=0;
    if(movement.y<-0.2||movement.y>0.2){
    newY =  position.y+py*2;
    }
    else movement.y=0;
    position.set(newX, newY, 0.);
  
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
    rotate(angle-4.7);
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
