class System{
  Body[] bodies;
  
  public System(int n){
    this.bodies = new Body[n];
    for (int i = 0; i < n; i++){
      float mass = random(1, 20);
      //float size = pow(mass, 2);
      float size = 70;
      this.bodies[i] = new Body( new PVector(random(bf, width-bf), random(bf, height-bf)),  //pos
                    new PVector(random(-maxva, maxva), random(-maxva, maxva)), //speed
                    mass, size);  //mass
    }
  }
  
  public void update(){
    for (int i = 0; i < this.bodies.length; i++){
      push();
      this.bodies[i].display();
      pop();
      for (int j = 0; j < this.bodies.length; j++){
         this.bodies[i].update(this.bodies[j]);
      }
    }
  }
}
