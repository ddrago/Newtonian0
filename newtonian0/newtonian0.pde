//COSTANTS
float G = -random(2, 10);

PGraphics pg;

float BGR = random(255), BGG = random(255), BGB = random(255);
float BR = random(255), BG = random(255), BB = random(255);

System s;
int n = 5;
float bf = 100;
float maxva = 1;

void setup(){
  frameRate(20);
  size(1200, 700);
  s = new System(n);
  background(BGR, BGG, BGB);
  
  pg = createGraphics(1200, 700);
}

void draw(){
  pg.beginDraw();
  pg.background(BGR, BGG, BGB, 5);
  pg.endDraw();
  image(pg, 0, 0);
  s.update();
  
  //b.printInfo();
  
}

void keyPressed(){

  if(key == ' '){
  s = new System(n);
  BR = random(100, 245); BG = random(100, 200); BB = random(200, 255);
  print(random(bf, width-bf), "bf: ", bf, ", height: ", height-bf, "\n");
  background(255, 200, 220);
  }

}
