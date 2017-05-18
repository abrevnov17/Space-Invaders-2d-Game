class Bomb {
  
  float x;
  float y;
  int myWidth;
  int myHeight;
  
  Bomb (float x, float y){
    
    this.x=x;
    this.y=y;
    myWidth=20;
    myHeight=20;
  }
  
  void move(){
    y=y+1;
  }
  
  void display(){
    fill(0,0,255);
    PImage m=loadImage("bomb.png");
    m.resize(myWidth,myHeight);
    image(m,x,y);
  }
  
  
  
  
  
  
}
