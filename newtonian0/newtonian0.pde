//COSTANTS
float G = -10;

Body a, b;

void setup(){
  a = new Body(new PVector(random(200, 500), random(200, 500)), new PVector(-1, -2), 2);  //new PVector(random(width), random(height))
  b = new Body(new PVector(random(200, 500), random(200, 500)), new PVector(2, 1), 2);
  size(700, 700);
  background(0);
}

void draw(){
  //background(0, 127);
  PVector CoM = PVector.sub(a.choords, b.choords);
  push();
  translate(CoM.x, CoM.y);
  print("x: ", CoM.x, ", y: ", CoM.y, "\n");
  a.display();
  b.display();  
  pop();
  a.update(b);
  b.update(a);
  
  //b.printInfo();
  
}
