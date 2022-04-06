class Cursor{
  PVector position,velocity;
  float newX,newY;
  PImage cursorPhoto;
  
  Cursor(){
    cursorPhoto = loadImage("cursorPhoto.png");
    position = new PVector(width/2,height/2);
    newX=width/2;
    newY=height/2;
    velocity = new PVector(0,0);
  }
  
  void update(){    
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
    
    if(position.y>height)position.y=height;
    if(position.y<0)position.y=0;
    if(position.x>width)position.x=width;
    if(position.x<0)position.x=0;
  }
  
  void render(){
    image(cursorPhoto,position.x,position.y);
    circle(position.x,position.y,2);
  }
  
}
