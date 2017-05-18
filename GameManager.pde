class GameManager {
  int level;

  Player player;
  ArrayList<Alien> aliens;
  ArrayList<Bullet> bullets;
  ArrayList<Bomb> bombs;
  int gameMode;
  boolean firedBefore;
  int lives;
  boolean mousePressedBefore;
  int score;


  GameManager() {
        level=1;

    player=new Player(width/2-width/7, height-height/18, 2, width/7, height/18);
    bullets=new ArrayList();
    bombs=new ArrayList();
    aliens=new ArrayList();
    firedBefore=false;
    lives=3;
    mousePressedBefore=false;
    gameMode=0;
    score=0;

    for (int i=0; i<width/2; i=i+50) {
      for (int y=50; y<height/5; y=y+50) {
        Alien alien=new Alien(i, y);
        aliens.add(alien);
      }
    }
  }

  void display() {
    if (gameMode!=2) {
      player.display();
    }
    textSize(50);
    text("Lives: "+lives, width-200, 50);
    for (int i=0; i<bullets.size (); i++) {
      bullets.get(i).display();
    }
    for (int i=0; i<aliens.size (); i++) {
      aliens.get(i).display();
    }

    for (int i=0; i<bombs.size (); i++) {
      bombs.get(i).display();
    }
  }

  void update() {
    if (lives<=0){
      
      gameMode=2;
      
    }
    if (gameMode==0) {
      for (int i=0; i<bombs.size (); i++) {
        bombs.get(i).move();
      }
      if (keyPressed) {
        if (key=='f' &&firedBefore==false && bullets.size()<=5) {
          firedBefore=true;
          fill(255, 0, 0);
          Bullet bullet=new Bullet(player.x+player.myWidth/2, player.y-player.myHeight/2);
          game.bullets.add(bullet);
        }
      } else {
        firedBefore=false;
      }
      player.changeSpeed();
      player.move();
      for (int i=0; i<bullets.size (); i++) {

        bullets.get(i).move();
      }

      for (int i=0; i<aliens.size (); i++) {
         if (aliens.get(i).x+aliens.get(i).myWidth/2+aliens.get(i).speed>=width || (aliens.get(i).speed<0 && aliens.get(i).x-aliens.get(i).myWidth/2+aliens.get(i).speed<=0)){
      for (int y=game.aliens.size()-1;y>=0;y--){

          game.aliens.get(y).y=game.aliens.get(y).y+game.aliens.get(y).myHeight *3;
          game.aliens.get(y).speed=-1*game.aliens.get(y).speed;
          
    }
    }
  
        
      }
for (int i=0; i<aliens.size (); i++) {
        aliens.get(i).move();
        if (aliens.get(i).y>=height-aliens.get(i).myHeight || (aliens.get(i).x>=player.x && aliens.get(i).x<=player.x+player.myWidth && aliens.get(i).y>=player.y)) {
          aliens.remove(i);
          lives=lives-1;
          score=score-100;
          break;
        }
        
      }
  

      for (int i=aliens.size ()-1; i>=0; i--) {

        for (int b=bullets.size ()-1; b>=0; b--) {
          float x=aliens.get(i).x;
          float y=aliens.get(i).y;
          float x1=bullets.get(b).x;
          float y1=bullets.get(b).y;
          if (sqrt((x1-x)*(x1-x)+(y1-y)*(y1-y))<bullets.get(b).myHeight) {
            bullets.remove(bullets.get(b));
            aliens.remove(aliens.get(i));
            score=score+25;
            break;
          }
        }
      }


      int x=int(random(0, 2000));
      int z=int(random(0, aliens.size()-1));
      if (x>1950-level*5 && aliens.size()>0) {
        Bomb bomb = new Bomb(aliens.get(z).x, aliens.get(z).y);
        bombs.add(bomb);
      }

      for (int i = bombs.size ()-1; i>=0; i--) {

        if (bombs.get(i).y<=height && bombs.get(i).y>=player.y-player.myHeight/4 && bombs.get(i).x>player.x && bombs.get(i).x<player.x+player.myWidth) {

          bombs.remove(i);
          lives=lives-1;
        }
      }
    } else {
      if (gameMode==2){
      fill(255);
      textSize(150);
      text("Game Over", width/2-350, height/2);
      
      }
      
      textSize(50);
      if (frameCount%2==0 && gameMode==2){
        text("Press any button to play again", width/2-300,height/1.2);
      }
      if (keyPressed && gameMode==2){
          level=1;

    player=new Player(width/2-width/7, height-height/18, 2, width/7, height/18);
    bullets=new ArrayList();
    bombs=new ArrayList();
    aliens=new ArrayList();
    firedBefore=false;
    lives=3;
    mousePressedBefore=false;
    gameMode=0;
    score=0;

    for (int i=0; i<width/2; i=i+50) {
      for (int y=50; y<height/5; y=y+50) {
        Alien alien=new Alien(i, y);
        aliens.add(alien);
      }
    }
      }
    }
    
    if (aliens.size()<=0){
      
      player=new Player(width/2-width/7, height-height/18, 2, width/7, height/18);
    bullets=new ArrayList();
    bombs=new ArrayList();
    aliens=new ArrayList();
    firedBefore=false;
    lives=3;
    gameMode=0;
    paused=false;
    mousePressedBefore=false;
    level=level+1;
    int number=level;
    if (number>2){
      number=2;
    }
    int number2=level;
    if (number2>8){
      number=8;
    }
  
    for (int i=0; i<width/(2-number/4); i=i+50) {
      for (int y=50; y<height/(5-number2/3); y=y+50) {
        Alien alien=new Alien(i, y);
        alien.speed=alien.speed+level;
        aliens.add(alien);
      }
    }
      
      
      
      
    }
    
    fill(255);
    rect(15,15,5,25);
    rect(30,15,5,25);
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse(25,27,40,40);
    noStroke();
    
    if (mousePressed){
      
      if (mouseX>=10 && mouseX<=35 && mouseY>=10 && mouseY<=45 && mousePressedBefore==false){
        if (gameMode==1){
        gameMode=0;
        }
        else{
          gameMode=1;
        }
        mousePressedBefore=true;
      }
    }
        else{
          mousePressedBefore=false;
          
        }
        
        
      
    textSize(30);
    text("Level: "+level,width/2,30);
    text("Score: "+score,width/4,30);
    
    
  }
}

