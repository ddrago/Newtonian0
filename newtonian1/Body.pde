class Body{
  PVector choords = new PVector(0, 0);  //the x and y
  PVector v = new PVector(0, 0);
  PVector a = new PVector(0, 0);
  float mass;
  float r;  //make the radius proportional to the mass of the body
  float gforcemag, gforcedir;
  
  public Body(PVector choords, PVector v, float mass, float size){
    this.choords.set(choords);
    this.v.set(v);
    this.mass = mass;
    this.r = size;
  }
  
  public void applyForce(PVector force){
    // A = F/M
    this.a.add(PVector.div(force, this.mass));
  }
  
  public void gravitate(Body b){
    PVector force = PVector.sub(this.choords, b.choords); 
    float distSq = constrain(force.magSq(), 100, 1000); 
    //F = G*(M1*M2)/|D|^2
    force.setMag( G*this.mass*b.mass/distSq );
    //print("distsq: ", distSq, ", force: ", G*this.mass*b.mass/distSq ,"\n");
    this.applyForce(force);
  }
  
  private void move(){
    //print("x: ", this.choords.x, ", y: ", this.choords.y, ", vx: ", this.v.x, ", vy: ", this.v.y, "\n");
    this.v.add(this.a);
    this.choords.add(this.v);
    //print("x: ", this.choords.x, ", y: ", this.choords.y, ", vx: ", this.v.x, ", vy: ", this.v.y, "\n");
    this.a.set(0, 0); 
  }
  
  public void display(){
    push();
    fill(c2[0], c2[1], c2[2]);
    stroke(c3[0], c3[1], c3[2]);
    circle(this.choords.x, this.choords.y, this.r);
    pop();
  }
  
  public void update(Body b){
    this.gravitate(b);
    this.move();
  }
  
  public void printInfo(){
    print("x: ", this.choords.x, ", y: ", this.choords.y, ", mass: ", this.mass, ", r: ", this.r, "\n");
  }
  
}
