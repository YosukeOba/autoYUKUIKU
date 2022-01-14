import java.awt.*;
import java.awt.event.*;

import org.jnativehook.*;
import org.jnativehook.dispatcher.*;
import org.jnativehook.keyboard.*;

import p5nativehook.p5NativeKeyGet;

Robot robot;
Boolean isOn = false;

void setup(){
  p5NativeKeyGet kg=new p5NativeKeyGet(this);
  try{
    robot = new Robot();
  } catch(Exception e) {
    e.printStackTrace();
  }
}

void draw(){
  PointerInfo pi = MouseInfo.getPointerInfo();
  int sx = (int)pi.getLocation().getX();
  int sy = (int)pi.getLocation().getY();
  
  if(isOn){
    robot.mouseMove(1350,155);
    mouseClick();
    robot.mouseMove(1350,235);
    mouseClick();
    robot.mouseMove(1350,315);
    mouseClick();
    robot.mouseMove(1350,395);
    mouseClick();
  }
  println(isOn + "," + sx + "," + sy);
}

void mouseClick(){
  robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
  robot.waitForIdle();
  robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
  robot.waitForIdle();
  delay(100);
}

void keyPressed(){
  switch(key){
    case 's':
      isOn = true;
      break;
    case  'e':
      isOn = false;
      break;
    default:
      break;
  }
}
