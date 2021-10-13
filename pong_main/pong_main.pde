Ball[] balls;
Paddle[] paddles;
Item[] items;

boolean[] keys;

void setup()
{  
  frameRate(144);
  size(1000,600);
  balls = new Ball[1];
  paddles = new Paddle[2];
  items = new Item[300];
  
  keys = new boolean[4];
  
  //initialise ball
  balls[0] = new Ball();
  
  initialisePaddles();
  initialiseItems();
  
  for(int i = 0; i < keys.length; i++)
  {
    keys[i] = false;
  }
}

void keyPressed()
{
  if (key=='w')
  {
    keys[0] = true;
  }
  if (key=='s')
  {
    keys[1] = true;
  }
  if(keyCode == UP)
  {
    keys[2] = true;
  }
  if(keyCode == DOWN)
  {
    keys[3] = true;
  }
}

void keyReleased()
{
  if (key=='w')
  {
    keys[0] = false;
  }
  if (key=='s')
  {
    keys[1] = false;
  }
  if(keyCode == UP)
  {
    keys[2] = false;
  }
  if(keyCode == DOWN)
  {
    keys[3] = false;
  }
}

void draw()
{
  background(120);
  fill(80);
  strokeWeight(15);
  stroke(80);
  line(width/3, 0, width/3, height);
  line(width/3*2, 0, width/3*2, height);
  strokeWeight(1);
  stroke(0);
  checkMovement();
  
  for(int i = 0; i < paddles.length; i++)
  {
    paddles[i].display();
  }
}

void initialiseItems()
{
  for(int i = 0; i < items.length; i++)
  {
    items[i] = new Item();
  }
}

void initialisePaddles()
{
  for(int i = 0; i < paddles.length; i++)
{
  if(i == 0)
  {
    //LHS
    paddles[i] = new Paddle(5, height, color(57,57,220), width, height);
  }else
  {
    //RHS
    paddles[i] = new Paddle(width - 6, height, color(220,57,57), width, height);
  }
}
}

void addBall()
{
  balls[balls.length] = new Ball();
}

void checkMovement()
{
  for(int i = 0; i < balls.length; i++)
  {
    balls[i].display();
  } 
  
  for(int i = 0; i < items.length; i++)
  {
    items[i].display();
  }
  
  if(keys[0] == true)
  {
    paddles[0].movePaddle("UP");
  }
  if(keys[1] == true)
  {
    paddles[0].movePaddle("DOWN");
  }
  if(keys[2] == true)
  {
    paddles[1].movePaddle("UP");
  }
  if(keys[3] == true)
  {
    paddles[1].movePaddle("DOWN");
  }
}
