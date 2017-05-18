//Anatoly Brevnov
//Intro to Comp Sci
//Space Invaders
//February 5, 2015

GameManager game;

void setup(){
  size(1000,800);
  game = new GameManager();  
}


void draw(){
  background(0);
  game.update();
  game.display();
}

