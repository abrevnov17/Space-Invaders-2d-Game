//Anatoly Brevnov

GameManager game;

void setup(){
  size(1000,900);
  game = new GameManager();  
}


void draw(){
  background(0);
  game.update();
  game.display();
}

