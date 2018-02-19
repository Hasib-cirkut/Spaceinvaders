  
  class Ship
  {
    float x = width/2;
    float xDir = 0;
    float temp = 0;
    
    
    void show()
    {
      fill(255);
      noStroke();
      rectMode(CENTER);
      rect(x, height-20, 15, 30);
    }
    
    void setDir(float dir)
    {
      xDir = dir;
    }
    
    void move()
    {
      x += xDir*2;
    }
  }
