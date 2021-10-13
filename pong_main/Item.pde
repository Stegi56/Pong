class Item
{
  String type;
  float xPos;
  float yPos;
  int delay;
  
  Item()
  {
    delay = int(random(200,5000));

    xPos = random(width/3 +20, (width/3) * 2 -20);
    yPos = -30;
    
   int roll = int(random(0,6));
    if(roll == 0)
    {
      type = "newBall";
    } 
    if(roll == 0)
    {
      type = "speedUp";
    } 
    if(roll == 0)
    {
    type = "speedDown";
    }
    if(roll == 0)
    {
    type = "paddleUp";
    }
    if(roll == 0)
    {
    type = "paddleDown";
    }
    if(roll == 0)
    {
    type = "ballUp";
    }
    if(roll == 0)
    {
    type = "ballDown";
    }
  }
  
  String getType()
  {
    return type;
  }
  
  float getXpos()
  {
    return xPos;
  }
  
  float getYpos()
  {
    return yPos;
  }
  
  void display()
  {
    if(delay == 0)
    {
      if(type == "newBall")
      {
        fill(250,250,0);
        circle(xPos, yPos, 40);
      }else if(type == "speedUp")
      {
        fill(250,250,0);
        circle(xPos, yPos, 40);        
      }else if(type == "speedDown")
      {
        fill(250,250,0);
        circle(xPos, yPos, 40);        
      }else if(type == "paddleUp")
      {
        fill(250,250,0);
        circle(xPos, yPos, 40);        
      }else if(type == "paddleDown")
      {
        fill(250,250,0);
        circle(xPos, yPos, 40);        
      }else if(type == "ballUp")
      {
        fill(250,250,0);
        circle(xPos, yPos, 40);               
      }else if(type == "ballDown")
      {
        fill(250,250,0);
        circle(xPos, yPos, 40);        
      }
      
      
      
      
      yPos += 0.5;
    }else
    {
      delay--;
    }
  }
}
