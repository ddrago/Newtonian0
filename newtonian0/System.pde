class System{
  Body[] bodies;
  
  public System(int n){
    this.bodies = new Body[n];
    for (int i = 0; i < n; i++){
      this.bodies[i] = new Body( new PVector(random(bf, width-bf), random(bf, height-bf)),  //pos
                    new PVector(random(-maxva, maxva), random(-maxva, maxva)), //speed
                    random(20));  //mass
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
