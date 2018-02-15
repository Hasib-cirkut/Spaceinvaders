
  Ship ship;
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  ArrayList<Drop> drops = new ArrayList<Drop>();
  
  float dir = 1;
  PFont f;
  void setup()
  {
    size(640, 360);
    
    ship = new Ship();
    f = createFont("Arial", 16, true);
    textFont(f, 30);
    
    for(int i=0; i<10; i++){
    enemies.add(new Enemy((i*60)+60, 50));
    }
    
   
    //drops.add(new Drop(ship.x, height));
    
  }
  
  void draw()
  {
    background(51);
    
    gameOver();
    
    ship.show();
    ship.move();
    
    for(int i = enemies.size()-1; i>=0; i--)
    {
      Enemy e = enemies.get(i);
      
      e.show();
      e.move(dir);
      shift();
    }
    
    for(int i = drops.size()-1; i>=0; i--)
    {
      Drop d = drops.get(i);
      
      d.show();
      d.move();
      d.update();
    }
    
    for(int i = enemies.size()-1; i>=0; i--)
    {
      Enemy e = enemies.get(i);
      
      for(int j = drops.size()-1; j >= 0; j--)
      {
        Drop d = drops.get(j);
        
        if(d.getHit(e))
        {
          d.slice();
          e.slice();
        }
    }
    
    }
    
    for(int i = drops.size()-1; i>=0; i--)
    {
      Drop d = drops.get(i);
      
      if(d.isDelete)
        drops.remove(i);
        
       // println(drops.size());
    }
    
    for(int i = enemies.size()-1; i>=0; i--)
    {
      Enemy e = enemies.get(i);
      
      if(e.isHit)
        enemies.remove(i);
        
        //println(drops.size());
    }
  }
  
  void shift()
  {
    for(int i = enemies.size()-1; i>=0; i--)
    {
      Enemy e = enemies.get(i);
      
      if(e.x > width){
        dir = -1;
        shiftDown();
      }
      else if(e.x < 0){
        dir = 1;
        shiftDown();
      }
    }
  }
  
  void shiftDown()
  {
    for(int i = enemies.size()-1; i>=0; i--)
    {
      Enemy e = enemies.get(i);
      
      e.y += 2;
    }
  }
  
  void keyReleased()
  {
    if(key != ' '){
    ship.setDir(0);
    }
  }
  
  void keyPressed()
  {
    if(keyCode == RIGHT)
      ship.setDir(1);
    else if(keyCode == LEFT)
      ship.setDir(-1);
    else if(key == ' ')
    {
      drops.add(new Drop(ship.x, height));
    }
  }
  
  void gameOver()
  {
    if(enemies.size() == 0)
    {
      noLoop();
      fill(255);
      text("Game Over", width/2 - 80, height/2);
    }
  }