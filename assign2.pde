PImage bgImg,soilImg,lifeImg,soldierImg,cabbageImg;
PImage titleImg,startnormalImg,starthoveredImg;
PImage gameoverImg,restartnormalImg,restarthoveredImg;
PImage groundhogIdleImg,groundhogdownImg,groundhogleftImg,groundhogrightImg;

int BUTTON_TOP = 360;
int BUTTON_BOTTOM = 420;
int BUTTON_LEFT = 248;
int BUTTON_RIGHT = 392;

boolean downPressed, rightPressed, leftPressed;
boolean groundHog = true;


int gameState = 0;
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_LOSE = 3;

int groundhogIdleX=310 , groundhogIdleY=80 ;
int groundhogIdleW , groundhogIdleH ;
int groundhogIdleSpeed = 5;

int soldierX = -80;
int soldierY = 160+80*floor(random(4));
int soldierSpeed = 5;
int soldierW , soldierH;

int cabbageX = 80*floor(random(8));
int cabbageY = 160+80*floor(random(4));
int cabbageW, cabbageH;

float life = 2;

void setup() {
  
  size(640, 480, P2D);
  // start
   titleImg = loadImage("img/title.jpg");
   startnormalImg = loadImage("img/startNormal.png");
   starthoveredImg = loadImage("img/startHovered.png");
   soldierImg = loadImage("img/soldier.png");
   bgImg = loadImage("img/bg.jpg");
   groundhogIdleImg = loadImage("img/groundhogIdle.png");
   groundhogdownImg = loadImage("img/groundhogDown.png");
   groundhogleftImg = loadImage("img/groundhogLeft.png");
   groundhogrightImg = loadImage("img/groundhogRight.png");
   lifeImg = loadImage("img/life.png");
   soilImg = loadImage("img/soil.png");
   cabbageImg = loadImage("img/cabbage.png");
   gameoverImg = loadImage("img/gameover.jpg");
   restartnormalImg = loadImage("img/restartNormal.png");
   restarthoveredImg = loadImage("img/restartHovered.png");

   
   gameState = GAME_START;
  
  
   
}

void draw() {
  // Switch Game State
    // Game Start
    
    switch(gameState){
      case GAME_START:
    //
       background(0);
       image(titleImg,0,0);
       image(startnormalImg,248,360);
       
       if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
       && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
        image(starthoveredImg,248,360);
        if(mousePressed){
          gameState = GAME_RUN;
          life = 2;
          }
       }else{
         gameState = GAME_START;
       }
       
       
       
    break;
    
    case GAME_RUN:
       //Image
       image(bgImg,0,0);
       image(soilImg,0,160);
       
       
       // life in
       
       if(life == 0){
         gameState = GAME_LOSE;
       }
       if(life == 1){
         image(lifeImg,10,10);
       }
       if(life == 2){
         for(int a=0; a<2; a++){
         image(lifeImg,10+a*70,10);
         }
       }
         if(life == 3){
         for(int a=0; a<3; a++){
         image(lifeImg,10+a*70,10);
         }
         }
         
         //eat Cabbage
       image(cabbageImg,cabbageX,cabbageY);
         
       groundhogIdleW = groundhogIdleX + 80; groundhogIdleH = groundhogIdleY + 80;
       cabbageW = cabbageX + 80; cabbageH = cabbageY + 80;
       if( groundhogIdleX < cabbageW && groundhogIdleW > cabbageX && groundhogIdleY < cabbageH && groundhogIdleH > cabbageY){
       life += 1;
       cabbageX = -80;
    }         
       
       // Sun Drawing
       stroke(255, 255, 0);
       strokeWeight(5);
       fill(253, 184, 19);
       ellipse(590,50,120,120);
       
       // Grass Drawing
       noStroke();
       fill(124, 204, 25);
       rect(0,145,640,15);
       
       // soldier Move
       soldierX=soldierX+5;
       soldierX %= 800;
       image(soldierImg,soldierX,soldierY,80,80);
       
       //groundhogIdle Move
       
      if(groundHog){
         image(groundhogIdleImg,groundhogIdleX,groundhogIdleY);
       }
       
      if(downPressed){
        groundhogIdleY += groundhogIdleSpeed;
        groundHog = false;
        leftPressed = false; rightPressed = false;
        groundHog = false;
        if(groundhogIdleY %80 ==0){
          downPressed = false; groundHog = true;
        }
        image(groundhogdownImg,groundhogIdleX,groundhogIdleY);
        if(groundhogIdleY + 80 > height){
          groundhogIdleY = 400; 
        }         
      }else{
        groundHog = true;        
      }
      
      if(leftPressed){
        groundhogIdleX -= groundhogIdleSpeed;
        groundHog = false;
        rightPressed = false; downPressed = false;
        image(groundhogleftImg,groundhogIdleX,groundhogIdleY);
        if(groundhogIdleX %80 ==0){
          leftPressed = false; groundHog = true;
        }
      if(groundhogIdleX< 0){
        groundhogIdleX = 0;
      }
        
      }
      if(rightPressed){
        groundhogIdleX += groundhogIdleSpeed;
        groundHog = false;
        downPressed = false; leftPressed = false;
        image(groundhogrightImg,groundhogIdleX,groundhogIdleY);
        if(groundhogIdleX %80 ==0){
          rightPressed = false; groundHog = true;
        }
        if(groundhogIdleX+80>width){
        groundhogIdleX = width-80;
        }  
      }
      // touch Sodiler
      
      soldierW = soldierX+80;
      soldierH = soldierY+80;
      if( groundhogIdleX < soldierW && groundhogIdleW > soldierX && groundhogIdleY < soldierH && groundhogIdleH > soldierY){
      groundhogIdleX = width/2;
      groundhogIdleY = 80;
      life -= 1;
      downPressed = false; leftPressed = false; rightPressed = false;
      groundHog = true;
    }
             
      break;
           
      case GAME_LOSE:
      
      background(0);
       image(gameoverImg,0,0);
       image(restartnormalImg,248,360);
       
       if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
       && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
        image(restarthoveredImg,248,360);
        if(mousePressed){
          gameState = GAME_START;
          life = 2;
          soldierX = -80;
          soldierY = 160+80*floor(random(4));
          cabbageX = 80*floor(random(8));
          cabbageY = 160+80*floor(random(4));
          
          }
       }else{
         gameState = GAME_LOSE;
       }

      break;
    }    
}
    


void keyPressed(){
  switch(keyCode){
    case DOWN:
    downPressed = true;
    break;
    case RIGHT:
    rightPressed = true;
    break;
    case LEFT:
    leftPressed = true;
    break;
  }
}

