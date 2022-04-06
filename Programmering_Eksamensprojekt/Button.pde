class Button {
  PVector pos, siz;
  int goToPage;

  Button(PVector position, PVector size, int action) {
    pos=position;
    siz=size;
    goToPage=action;
  }

  void update() {
    boolean cursorPressX = pos.x - siz.x/2 < theCursor.position.x && theCursor.position.x < pos.x + siz.x/2;
    boolean cursorPressY = pos.y - siz.y/2 < theCursor.position.y && theCursor.position.y < pos.y + siz.y/2;
    if (cursorPressX && cursorPressY) {
      if (goToPage==1) {
        controlScore = new ControlScore();
        thePlayer = new Player();
        countTheAmountOfFrames=0;
        thePlayer.life=5;
        monsters.add(new Monster(0));
        monsters.add(new Monster(0));
        monsters.add(new Monster(1));
        monsters.add(new Monster(2));
        monsters.add(new Monster(2));
        
        
        //for (int i = 0; i<5; i++) {
        //  monsters.add(new Monster(int(random(-1, 3))));
        //}
        for (int i = 0; i<3; i++) {
          powerups.add(new Powerup(int(random(-1, 3))));
        }
      }
      page = goToPage;
    }
  }
}
