class Player {
  
  float x;
  float y;
  float speed;
  int lives;
  int score;
  int myWidth;
  int myHeight;
  boolean firedBefore;
  
  Player (float x, float y, float speed, int myWidth, int myHeight){
    
    this.x=x;
    this.y=y;
    this.speed=speed;
    this.lives=lives;
    score=0;
    lives=3;
    this.myWidth=myWidth;
    this.myHeight=myHeight;
    firedBefore=false;
    
  }
  
  void move(){
    if (x+speed>=0 && x+speed+myWidth<=width){
    x=x+speed;
    }
  }
  
  void display(){
    fill(0,255,0);
      PImage m=loadImage("player.png");
      m.resize(myWidth,myHeight);
      image(m,x,y);

    
  }
  
  void changeSpeed(){
    
    if (x+myWidth+speed>=width || x+speed<=0){
      speed=0;
      
    }
    
    if (keyPressed){
        
         if (key!='f'){
           firedBefore=false;
         }
         if (key=='d'){
           speed=2;
           println("a");

          
        }
        
        else if (key=='a'){
          
          speed=-2;
          
        }
        else if (key=='s'){
          speed=0;
        }
        
        /*else if (key=='f'&&firedBefore==false && game.bullets.size()<=5){
          firedBefore=true;
          fill(255,0,0);
          Bullet bullet=new Bullet(x+myWidth/2,y-myHeight/2);
          game.bullets.add(bullet);
          
        }
        */
        
        
      }
    else {
      
      firedBefore=false;
      
    }
    
    
  }
  
  }
  
  
  
  
  
  

