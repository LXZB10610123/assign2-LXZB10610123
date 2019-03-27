PImage bgImg,soilImg,lifeImg,soldierImg,cabbageImg;
PImage titleImg,startnormalImg,starthoveredImg;
PImage gameoverImg,restartnormalImg,restarthoveredImg;
PImage groundhogldleImg,groundhogdownImg,groundhogleftImg,groundhogrightImg;

int GAME_START = 0;
int GAME_RUN = 1;
int gameState = GAME_START;

boolean upPressed, downPressed, rightPressed, leftPressed;

int BUTTON_TOP = 250;
int BUTTON_BOTTOM = 310;
int BUTTON_LEFT = 360;
int BUTTON_RIGHT = 504;

float groundhogSpeed = 60;

void setup() {
	size(640, 480, P2D);
	// start
   titleImg = loadImage("img/title.jpg");
   startnormalImg = loadImage("img/startNormal.png");
   starthoveredImg = loadImage("img/startHovered.png");
   soldierImg = loadImage("img/soldier.png");
   bgImg = loadImage("img/bg.jpg");
   groundhogldleImg = loadImage("img/groundhogldle.png");
   groundhogdownImg = loadImage("img/groundhogDown.png");
   groundhogleftImg = loadImage("img/groundhogLeft.png");
   groundhogrightImg = loadImage("img/groundhogRight.png");
   lifeImg = loadImage("img/life.png");
   soilImg = loadImage("img/soil.jpg");
   cabbageImg = loadImage("img/cabbage.png");
   gameoverImg = loadImage("img/gameover.jpg");
   restartnormalImg = loadImage("img/restartNormal.png");
   restarthoveredImg = loadImage("img/restartHovered.png");
}

void draw() {
	// Switch Game State
		// Game Start
    switch(gameState){
    case GAME_START:
    
       background(0);
       image(titleImg,0,0);
       image(startnormalImg,248,360);
       image(starthoveredImg,248,360);
       
       if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
      && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
        image(starthoveredImg,250,360);
        if(mousePressed){
          gameState = GAME_RUN;
        }
      }else{
        image(startnormalImg,250,360);
      }
     break;

		// Game Run
    case GAME_RUN:
    
      image(bgImg,0,0);
      image(soilImg,0,160);
      
      //lifeImage
      image(lifeImg,10,10);
      image(lifeImg,80,10);

		// Game Lose
    case GAME_LOSE:
}


  
void keyPressed(){
  
}

void keyReleased(){
  
}
