//COSTANTS
float G = -random(0.5, 1);

PGraphics pg;


float[] c1, c2, c3;
float opacity = 2; //random(3, 3.5);

System s;
int n = int(random(2, 10));  //number of planets
float bf = 320; //buffer space from window edge
float maxva = 1; //maximum initial speed of each planet

void setup(){
  c1 = new float[3]; c2 = new float[3]; c3 = new float[3];
  generateColours();
  
  frameRate(30);
  size(1200, 700);
  s = new System(n);
  
  pg = createGraphics(1200, 700);
  
  drawBackground(false);
}

void draw(){
  drawBackground(true);
  s.update();
}

void keyPressed(){

  if(key == ' '){
    generateColours();
  n = int(random(2, 10));
  s = new System(n);
  drawBackground(false);
  }

}

void drawBackground(boolean seethrough){
  pg.beginDraw();
  if(seethrough){
    pg.background(c1[0], c1[1], c1[2], opacity);
  } else {
    pg.background(c1[0], c1[1], c1[2]);
  }
  pg.endDraw();
  image(pg, 0, 0);
}

void generateColours(){
  float[] colour1 = {random(200, 255), random(50, 150), random(20, 50)}; //random(100, 255), random(100, 255), random(100, 255)};
  float[] colour2 = {random(200, 255), random(200, 255), random(20, 50)}; //colour1[1], colour1[2], colour1[0]};
  float[] colour3 = {random(20, 50), random(150, 220), random(200, 255)}; //colour1[2], colour1[0], colour1[1]};
  switch(int(random(3))){
    case 0:
        c1 = colour1;
        c2 = colour2;
        c3 = colour3;
      break;
    case 1: 
        c1 = colour2;
        c2 = colour3;
        c3 = colour1;
      break;
    case 2:
        c1 = colour3;
        c2 = colour1;
        c3 = colour2;
      break;
  }
  print("c1: ", colour1[0], ", c2: ", colour1[1], ", c3: ", colour1[2], "\n");
  print("c1: ", colour2[0], ", c2: ", colour2[1], ", c3: ", colour2[2], "\n");
  print("c1: ", colour3[0], ", c2: ", colour3[1], ", c3: ", colour3[2], "\n");
}
