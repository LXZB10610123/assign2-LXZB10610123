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

float soldierX,soldierY;


float groundhogIdleX=0,groundhogIdleY=0;
float groundhogIdleSpeed = 80/16;
int groundhogIdleW = 70;
int groundhogIdleH = 80;

float cabbageX ,cabbageY ;

int SPACE = 80;

int life = 2;


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
   
   // soldier Floor
      soldierY = floor(random(2,6));
      
   // cabbage Floor
      cabbageX = floor(random(2,8));
      cabbageY = floor(random(2,6));
   
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
          }
       }else{
         gameState = GAME_START;
       }
       
       
    
    break;
    
    case GAME_RUN:
       //Image
       image(bgImg,0,0);
       image(soilImg,0,160);
       
       //eat Cabbage
       image(cabbageImg,cabbageX*80,cabbageY*80,80,80);
       if(groundhogIdleX+groundhogIdleW > cabbageX && groundhogIdleX < cabbageX+SPACE && groundhogIdleY+groundhogIdleH > cabbageY && groundhogIdleY > cabbageY+SPACE){
        
       
         image(cabbageImg,0,0,80,80);
       }
       
       // life in
       
       
       
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
       image(soldierImg,-100+soldierX,soldierY*80,80,80);
       
       //groundhogIdle Move
       image(groundhogIdleImg,310+groundhogIdleX,80+groundhogIdleY,groundhogIdleW,groundhogIdleH);

       
      if(downPressed){
        groundhogIdleY += groundhogIdleSpeed;
        groundHog = false;
        leftPressed = false; rightPressed = false;
        image(groundhogdownImg,310+groundhogIdleX,80+groundhogIdleY);
        if(groundhogIdleY + groundhogIdleH > 400) groundhogIdleY = 400 - groundhogIdleH;
      }
      if(leftPressed){
        groundhogIdleX -= groundhogIdleSpeed;
        groundHog = false;
        rightPressed = false; downPressed = false;
        image(groundhogleftImg,310+groundhogIdleX,80+groundhogIdleY);
        if(groundhogIdleX < -width/2 ) groundhogIdleX = -width/2;
      }
      if(rightPressed){
        groundhogIdleX += groundhogIdleSpeed;
        groundHog = false;
        downPressed = false; leftPressed = false;
        image(groundhogrightImg,310+groundhogIdleX,80+groundhogIdleY);
        if(groundhogIdleX+groundhogIdleW  > width/2) groundhogIdleX = width/2-groundhogIdleW;
      }
      
      // touch Sodiler
      
      if(groundhogIdleX > soldierX+80 && groundhogIdleX+80 > soldierX && groundhogIdleY < soldierY+80 && groundhogIdleY+80 > soldierY){
        gameState = GAME_LOSE;
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

void keyReleased(){
  switch(keyCode){
    case DOWN:
    downPressed = false;
    break;
    case RIGHT:
    rightPressed = false;
    break;
    case LEFT:
    leftPressed = false;
    break;
  }
}
