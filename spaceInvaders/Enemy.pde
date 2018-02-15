  
  class Enemy
  {
    float x, y, r = 15;
    boolean isHit = false;
    
    Enemy(float x, float y)
    {
      this.x = x;
      this.y = y;
    }
    
    void show()
    {
      noStroke();
      fill(200, 0, 100);
      ellipse(x, y, r*2, r*2);
      
    //  if(x > width){
    //  dir = -1;
       
    //}
    //  else if(x < 0){
    //  dir = 1;
     
    //  }
    }
    
    void move(float dir)
    {
      x += dir/1.4;
    }
    
    void slice()
    {
      isHit = true;
    }
  }