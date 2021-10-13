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
  
  Ball(int start, float x, float y)
  {
    //initialise ball parameters
    //center ball
    resultantVelocity = 2;
    
    //roll a dice of 2 to find start direction
    if(start == 2)
    {
      start = int(random(2));
      xPos = width/2;
      yPos = height/2;
    }else
    {
      xPos = x;
      yPos = y;
    }
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
    ballDiameter = 60;
  }
  
  void display()
  {
    fill(255,255,0);
    noStroke();
    circle(xPos, yPos, ballDiameter);

    //if ball hits top or bottom of screen bounce
    if((yPos > height - ballDiameter/2) && (vy > 0) || (yPos < ballDiameter/2) && (vy < 0))
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
      
    //check if hit paddle
    //((ball within paddle left x?) OR (ball within paddle right x?) AND (ball y within paddle length?))
   
    }else if((((xPos > width - ballDiameter/2 - 30) && (vx > 0)) || ((xPos < ballDiameter/2 + 30) && (vx < 0)))
                && (dist(0, yPos, 0, paddles[paddleTo].getYpos()) < paddles[paddleTo].getPaddleLength()/2))
    {
      float yDifference = (yPos - paddles[paddleTo].getYpos());
      vy = (resultantVelocity * 2 / paddles[paddleTo].getPaddleLength()) * yDifference;
      
      vx = sqrt(pow(resultantVelocity, 2) - pow(vy, 2));
      
      if(paddleFrom == 0)
      {
        vx *= -1;
      }    
      println("pass");
      
      paddleFrom = invertIndex(paddleFrom);
      paddleTo = invertIndex(paddleTo);
    }
    
    for(int i = 0; i < items.length; i++)
    {
      if(dist(xPos, yPos, items[i].getXpos(), items[i].getYpos()) < ballDiameter/2 + 40)
      {
        String type = items[i].getType();
        
        if(type == "newBall")
        {
          if(balls.size() < 3)
          {
            if((items[i].getYpos() < 40) || (items[i].getYpos() > height - 40))
            {
              addBall(paddleTo, width/2, height/2);
            }else
            {
              addBall(paddleTo, items[i].getXpos(), items[i].getYpos());
            }
          }
        }else if(type == "speedUp")
        {
          if(resultantVelocity < 6)
          {
            resultantVelocity += 2;
          }
        }else if(type == "speedDown")
        {
          if(resultantVelocity > 1)
          {
            resultantVelocity -= 0.7;
          }
        }else if(type == "paddleUp")
        {
          if(paddles[paddleFrom].getPaddleLength() < 500)
          {
            paddles[paddleFrom].changePaddle(50);
          }
        }else if(type == "paddleDown")
        {
          if(paddles[paddleTo].getPaddleLength() > 150)
          {
            paddles[paddleTo].changePaddle(-50);
          }          
        }else if(type == "ballUp")
        {
          if(ballDiameter < 150)
          {
            ballDiameter += 20;
          }
        }else if(type == "ballDown")
        {
          if(ballDiameter > 40)
          {
            ballDiameter -= 20;
          }
        }
        items[i] = new Item();
      }
    }
    
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
