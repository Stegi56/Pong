class Paddle
{
  float xPos;
  float yPos;
  float paddleLength;
  color paddleColor;
  
  Paddle(int x, int y, color c, float Width, float Height)
  {
    xPos = x;
    yPos = y/2;
    paddleLength = 150;
    paddleColor = c;
  }
  float getXpos()
    {
      return xPos;
    }
    
  float getYpos()
  {
    return yPos;
  }
  
  float getPaddleLength()
  {
    return paddleLength;
  }
  
  void display()
  {
    fill(paddleColor);
    rectMode(CENTER);
    rect(xPos, yPos, 20, paddleLength);    
  }
  
  void movePaddle(String direction)
  {
    if((direction == "DOWN") && (yPos + paddleLength/2 + 1 < height))
    {
      yPos += 5;
    }
    else if((direction == "UP") && (yPos - paddleLength/2 + 1 > 0))
    {
      yPos -= 5;
    }
  }
}
