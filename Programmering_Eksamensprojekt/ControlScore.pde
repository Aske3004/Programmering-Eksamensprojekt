class ControlScore{
  float highScore,currentScore;
  
  ControlScore(){
    BufferedReader reader = createReader("highscore.txt");
    String line = null;
    try {
      while ((line = reader.readLine()) != null) {
        String[] pieces = split(line, TAB);
        highScore = int(pieces[0]);
      }
      reader.close();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  float update(){
    if (frameCount >= 144) {
      currentScore +=1;
      frameCount = 0;
    }
    if (currentScore > highScore) {
      highScore = currentScore;
      PrintWriter writer = createWriter("highscore.txt");
      writer.println(highScore);
      writer.flush();
      writer.close();
    }
    return currentScore;
  }
  
  void render(){
    textSize(30);
    fill(255);
    text("Nuværende score: "+int(currentScore), 15, 90);
    text("HighScore: "+int(highScore), 15, 50);
  }
  
}
