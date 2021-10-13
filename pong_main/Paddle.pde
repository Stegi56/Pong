class Paddle
{
  float xPos;
  float yPos;
  float paddleLength;
  color paddleColor;
  
  Paddle(int x, color c)
  {
    xPos = x;
    yPos = height/2;
    paddleLength = 200;
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
    stroke(0);
    strokeWeight(5);
    rect(xPos, yPos, 40, paddleLength);    
  }
  
  void movePaddle(String direction)
  {
    if((direction == "DOWN") && (yPos + paddleLength/2 + 1 < height))
    {
      yPos += 7;
    }
    else if((direction == "UP") && (yPos - paddleLength/2 + 1 > 0))
    {
      yPos -= 7;
    }
  }
  
  void changePaddle(int change)
  {
    paddleLength += change;
  }
}
