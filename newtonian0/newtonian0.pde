//COSTANTS
float G = -random(1);

PGraphics pg;

float BGR = random(255), BGG = random(255), BGB = random(255);  //background colours
float BR = random(255), BG = random(255), BB = random(255);     //ball colours

System s;
int n = int(random(2, 10));  //number of planets
float size = random(50, 100);
float bf = 100; //buffer space from window edge
float maxva = 1; //maximum initial speed of each planet

void setup(){
  frameRate(30);
  size(1200, 700);
  s = new System(n);
  
  pg = createGraphics(1200, 700);
  
  drawBackground();
}

void draw(){
  drawBackground();
  s.update();
}

void keyPressed(){

  if(key == ' '){
  s = new System(n);

  BGR = random(255); BGG = random(255); BGB = random(255);  //background colours
  BR = random(100, 245); BG = random(100, 200); BB = random(200, 255);  //ball colours
  print(random(bf, width-bf), "bf: ", bf, ", height: ", height-bf, "\n");
  background(255, 200, 220);
  }

}

void drawBackground(){
  pg.beginDraw();
  pg.background(BGR, BGG, BGB, 5);
  pg.endDraw();
  image(pg, 0, 0);
}
