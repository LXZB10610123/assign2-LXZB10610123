PImage bgImg,soilImg,lifeImg,soldierImg,cabbageImg;
PImage titleImg,startnormalImg,starthoveredImg;
PImage gameoverImg,restartnormalImg,restarthoveredImg;
PImage groundhogIdleImg,groundhogdownImg,groundhogleftImg,groundhogrightImg;

int BUTTON_TOP = 360;
int BUTTON_BOTTOM = 420;
int BUTTON_LEFT = 248;
int BUTTON_RIGHT = 392;

boolean upPressed, downPressed, rightPressed, leftPressed;

int gameState = 0;
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_RUN_SEC = 2;
final int GAME_LOSE = 3;

float soldierX,soldierY;

float groundhogIdleX=0,groundhogIdleY=0;
float groundhogIdleSpeed = 5;
float groundhogIdleWidth = 70;
float groundhogIdleHeight = 80;

float cabbageX,cabbageY;

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
        image(starthoveredImg,250,360);
       }
       
       if(mousePressed){
         gameState = GAME_RUN;
       }
    
    break;
    
    case GAME_RUN:
       //Image
       image(bgImg,0,0);
       image(soilImg,0,160);
       
       //cabbage
       image(cabbageImg,cabbageX*80,cabbageY*80);
       
       //lifeImage
       image(lifeImg,10,10);
       image(lifeImg,80,10);
       
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
       image(soldierImg,-100+soldierX,soldierY*80);
       
       //groundhogIdle Move
       image(groundhogIdleImg,310+groundhogIdleX,80+groundhogIdleY);

       if(upPressed){
        groundhogIdleY -= groundhogIdleSpeed;
        if(groundhogIdleY < 0) groundhogIdleY = 0;
      }
      if(downPressed){
        groundhogIdleY += groundhogIdleSpeed;
        image(groundhogdownImg,310+groundhogIdleX,80+groundhogIdleY);
        if(groundhogIdleY + groundhogIdleHeight > 400) groundhogIdleY = 400 - groundhogIdleHeight;
      }
      if(leftPressed){
        groundhogIdleX -= groundhogIdleSpeed;
        image(groundhogleftImg,310+groundhogIdleX,80+groundhogIdleY);
        if(groundhogIdleX < -width/2 ) groundhogIdleX = -width/2;
      }
      if(rightPressed){
        groundhogIdleX += groundhogIdleSpeed;
        image(groundhogrightImg,310+groundhogIdleX,80+groundhogIdleY);
        if(groundhogIdleX+groundhogIdleWidth  > width/2) groundhogIdleX = width/2-groundhogIdleWidth;
      }
      
      if(groundhogIdleX >= soldierX
      && groundhogIdleY >= soldierY){
        gameState = GAME_RUN_SEC;
      }
      
      break;
      
      case GAME_RUN_SEC:
       //Image
       image(bgImg,0,0);
       image(soilImg,0,160);
       
       //cabbage
       image(cabbageImg,cabbageX*80,cabbageY*80);
       
       //lifeImage
       image(lifeImg,10,10);
       
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
       image(soldierImg,-100+soldierX,soldierY*80);
       
       //groundhogIdle Move
       image(groundhogIdleImg,310+groundhogIdleX,80+groundhogIdleY);

       if(upPressed){
        groundhogIdleY -= groundhogIdleSpeed;
        if(groundhogIdleY < 0) groundhogIdleY = 0;
      }
      if(downPressed){
        groundhogIdleY += groundhogIdleSpeed;
        image(groundhogdownImg,310+groundhogIdleX,80+groundhogIdleY);
        if(groundhogIdleY + groundhogIdleHeight > 400) groundhogIdleY = 400 - groundhogIdleHeight;
      }
      if(leftPressed){
        groundhogIdleX -= groundhogIdleSpeed;
        image(groundhogleftImg,310+groundhogIdleX,80+groundhogIdleY);
        if(groundhogIdleX < -width/2 ) groundhogIdleX = -width/2;
      }
      if(rightPressed){
        groundhogIdleX += groundhogIdleSpeed;
        image(groundhogrightImg,310+groundhogIdleX,80+groundhogIdleY);
        if(groundhogIdleX+groundhogIdleWidth  > width/2) groundhogIdleX = width/2-groundhogIdleWidth;
      }
      
      if(groundhogIdleX >= soldierX
      && groundhogIdleY >= soldierY){
        gameState = GAME_LOSE;
      }
      
      break;
      
      case GAME_LOSE:
      
      background(0);
       image(gameoverImg,0,0);
       image(restartnormalImg,248,360);
       
       if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
       && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
        image(restarthoveredImg,250,360);
       }
       
       if(mousePressed){
         gameState = GAME_START;
         }
      
      break;
    }
    
}

void keyPressed(){
  switch(keyCode){
    case UP:
    upPressed = true;
    break;
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
    case UP:
    upPressed = false;
    break;
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
