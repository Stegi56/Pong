class Ball
{
  float xPos;
  float yPos;
  float resultantVelocity;
  float vx;
  float vy;
  float ballDiameter;
  int paddleFrom;
  int paddleTo;
  int checkCounter;
  
  Ball()
  {
    //initialise ball parameters
    //center ball
    xPos = width/2;
    yPos = height/2;
    resultantVelocity = 3;
    
    //roll a dice of 2 to find start direction
    int start = int(random(2));
    if(start == 1)
    {
      vx = resultantVelocity;
      paddleFrom = 0;
      paddleTo = 1;
    }else
    {
      vx = -resultantVelocity;
      paddleFrom = 1;
      paddleTo = 0;
    }
    vy = 0;
    ballDiameter = 40;
  }
  
  void display()
  {
    fill(255,255,0);
    circle(xPos, yPos, ballDiameter);

    //if ball hits top or bottom of screen bounce
    if((yPos > height - ballDiameter/2) || (yPos < ballDiameter/2))
    {
      vy *= -1;
    }

    //check if hit horizontal edge
    if(((xPos > width - ballDiameter/2) && (paddleTo == 1)) || ((xPos < ballDiameter/2) && (paddleTo == 0)))
    {
      println("GAME OVER");
      vx *= -1;
      
      paddleFrom = invertIndex(paddleFrom);
      paddleTo = invertIndex(paddleTo);
      
      xPos += vx * 5;
      
    //check if hit paddle
    }else if(((xPos > width - ballDiameter/2 - 15) || (xPos < ballDiameter/2 + 15))
                && (dist(0, yPos, 0, paddles[paddleTo].getYpos()) < paddles[paddleTo].getPaddleLength()/2))
    {
      float yDifference = (yPos - paddles[paddleTo].getYpos());
      vy = (resultantVelocity * 2 / paddles[paddleTo].getPaddleLength()) * yDifference;
      
      vx = sqrt(pow(resultantVelocity, 2) - pow(vy, 2));
      
      if(paddleTo == 1)
      {
        vx *= -1;
      }
      
      println("pass");
      
      xPos += vx;
      paddleFrom = invertIndex(paddleFrom);
      paddleTo = invertIndex(paddleTo);
    }
    
    for(int i = 0; i < items.length; i++)
    {
      if(dist(xPos, yPos, items[i].getXpos(), items[i].getYpos()) < ballDiameter)
      {
        String type = items[i].getType();
        
        if(type == "newBall")
        {
          addBall();
        }else if(type == "speedUp")
        {
          
        }else if(type == "speedDown")
        {
          
        }else if(type == "paddleUp")
        {
          
        }else if(type == "paddleDown")
        {
          
        }else if(type == "ballUp")
        {
          
        }else if(type == "ballDown")
        {
          
        }
        items[i] = new Item();
      }
    }
    
    checkCounter++;
    xPos += vx;
    yPos += vy;
  }
  
  int invertIndex(int index)
  {
    if(index == 1)
    {
      return 0;
    }else
    {
      return 1;
    }
  }
}
