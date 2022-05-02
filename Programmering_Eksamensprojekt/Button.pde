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
        killCounter=0;
        thePlayer = new Player();
        drawsUntilNextZombieSpawn=720;
        countTheAmountOfFrames=0;
        thePlayer.life=5;
        monsters.add(new Monster(0));
        monsters.add(new Monster(0));
        monsters.add(new Monster(5));
        monsters.add(new Monster(9));
        monsters.add(new Monster(9));
        for (int i = 0; i<3; i++) {
          powerups.add(new Powerup(int(random(-1, 3))));
        }
      }
      page = goToPage;
    }
  }
}
