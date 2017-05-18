class Alien {
  
  float x;
  float y;
  float myWidth;
  float myHeight;
  float speed;
  
  Alien(float x, float y){
    speed=5;
    this.x=x;
    this.y=y;
    myWidth=20;
    myHeight=20;
    
    
    
  }
  
  void move(){
    
    x=x+speed;
   
    
  }
  
  void display(){
    
    PImage m=loadImage("enemy.png");
    m.resize(int(myWidth),int(myHeight));
    image(m,x,y);

    
  }
  
  
  
  
  
  
  
  
}
