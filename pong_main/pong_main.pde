//array list is used for balls as the amount of balls is dynamic
ArrayList<Ball> balls = new ArrayList<Ball>();

Paddle[] paddles;
Item[] items;

//A list of keys and their status is stored to allow simultaneous key presses
boolean[] keys;

boolean gameStart = false;
boolean gameEnd = false;

int redLives = 5;
int blueLives = 5;

void setup()
{  
  frameRate(144);
  //fullScreen();
  size(1920,1080);
  
  //initialise font
  PFont font;
  font = createFont("zx_spectrum-7_bold.ttf",128);
  textFont(font);
  textAlign(CENTER);
  
  //initialise ball and items arrays
  paddles = new Paddle[2];
  items = new Item[200];
  
  //initialise key status array
  keys = new boolean[4];
  
  //initialise ball
  balls.add(new Ball(2,2,2));
  
  //call to paddle and item constructors
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
  if(key == ' ')
  {
    gameStart = true;
    loop();
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
  fill(110);
  strokeWeight(30);
  stroke(80);
  line(width/3, 0, width/3, height);
  line(width/3*2, 0, width/3*2, height);
  strokeWeight(1);
  stroke(0);
  
  displayLives();
  displayFrameRate();
  checkMovement();
  
  if(gameStart != true)
  {
    noLoop();
    startScreen();
  }
  if(gameEnd == true)
  {
    displayLives();
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
    paddles[i] = new Paddle(5, color(57,57,220));
  }else
  {
    //RHS
    paddles[i] = new Paddle(width - 6, color(220,57,57));
  }
}
}

void addBall(int start, float x, float y)
{
  balls.add(new Ball(start, x, y));
}

void checkMovement()
{
  for(int i = 0; i < paddles.length; i++)
  {
    paddles[i].display();
  }
  
  for(int i = 0; i < balls.size(); i++)
  {
    balls.get(i).display();
  } 
  
  for(int i = 0; i < items.length; i++)
  {
    boolean reset = items[i].display();
    if(reset == true)
    {
      items[i] = new Item();
    }
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

void displayLives()
{
  fill(255);
  textSize(150);
  
  text(nf(redLives), width/6, height/5);
  text(nf(blueLives), (width/6) * 5, height/5);
  
  //I don't know why the game says red wins when blue is on 0 when using this logic, but it works
  if(blueLives == 0)
  {
    fill(255);
    textSize(200);
    text("BLUE WINS!", width/2, height/2 - 100);
    gameEnd = true;
    noLoop();
  }else if(redLives == 0)
  {
    fill(255);
    textSize(200);
    text("RED WINS!", width/2, height/2 - 100);
    gameEnd = true;
    noLoop();
  }
}

void startScreen()
{
  fill(255);
  textSize(100);
  text("PRESS SPACE", width/2, height/2 - 100);
  
}

//Framerate counter taken from computational thinking lecutre by Jo Wood
void displayFrameRate() 
{ 
  fill(0);
  textSize(20);
  text(nf(frameRate, 0, 1) + " frames per second", width - 190, 20);
}
