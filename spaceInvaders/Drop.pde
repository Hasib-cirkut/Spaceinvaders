   
  class Drop
  {
    float x, y, r = 5;
    boolean isDelete = false;
    
 
    
    Drop(float x, float y)
    {
      this.x = x;
      this.y = y;
    }
    
    void show()
    {
      noStroke();
      fill(255, 0, 0);
      ellipse(x, y, r*2, r*2);
    }
    
    boolean getHit(Enemy e)
    {
      float d = dist(this.x, this.y, e.x, e.y);
      
      if(r+e.r > d)
      return true;
      else
      return false;
    }
    
    void slice()
    {
      isDelete = true;
    }
    
    void update()
    {
      if (y < 0)
        isDelete = true;
    }
    
    void move()
    {
      y -= 5;
    }
  }