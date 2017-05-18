class Bullet {
  float x;
  float y;
  float speed;
  float myWidth;
  float myHeight;
  
  Bullet(float x, float y){
    this.x=x;
    this.y=y;
    speed=4;
    myWidth=10;
    myHeight=45;
    
  }
  
  void move(){
    y=y-speed;
    if (y<=0-myHeight){
      
      game.bullets.remove(this);
      
    }
  }
  
  void display(){
    fill(255,0,0);
    ellipse(x,y,myWidth,myHeight);
    
  }
  
  
  
  
  
  
  
}
