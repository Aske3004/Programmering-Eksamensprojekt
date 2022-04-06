class Button{
  PVector pos,siz;
  int goToPage;
  
  Button(PVector position,PVector size,int action){
    pos=position;
    siz=size;
    goToPage=action;
  }
  
  void update(){
    rect(pos.x,pos.y,siz.x,siz.y);
    
    
      boolean cursorPressX = pos.x - siz.x/2 < theCursor.position.x && theCursor.position.x < pos.x + siz.x/2;
      boolean cursorPressY = pos.y - siz.y/2 < theCursor.position.y && theCursor.position.y < pos.y + siz.y/2;
      if (cursorPressX && cursorPressY) {
        page = goToPage;
      }
  }
}
