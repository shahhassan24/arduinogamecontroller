/* 
                                                                                                               Controller
*/

import processing.serial.*; // imports library for serial communication
import java.awt.Robot; // imports library for key press or release simulation
import java.awt.event.KeyEvent; // imports library for reading the data from the serial port
import java.io.IOException;


Serial port; // defines Object Serial

Robot robot; // defines Object Robot
//defining variables

String X= "";
String Y= "";
String Z= "";
String A0= "";
String A1= "";
String A2= "";
String A3= "";
String A4= "";

String data= "";

int index=0;
int index2=0;
int index3=0;
int index4=0;
int index5=0;
int index6=0;

int iX=0;
int iY=0;
int iZ=0;

int iA0=0;
int iA1=0;
int iA2=0;


// creates new robot object

void setup()
{
try 
{
robot = new Robot();

}
catch (Exception e) {
e.printStackTrace();
exit();
}
delay(2000);
size (800, 800);

port = new Serial(this,"COM8", 115200); // starts the serial communication
port.bufferUntil('!'); // reads the data from the serial port up to the character '.'. So actually it reads this: 215,214/141;315:314<316!314?315.
}
void draw()
{
background(0,0,0);
fill(255, 255, 255);
//Simulating key press or release
//  left
if(iX<300)
{ 
delay(30);
robot.keyPress(KeyEvent.VK_A); 
}
if(iX>=300){
delay(30);
robot.keyRelease(KeyEvent.VK_A); 
}
//right
if( iX>350 ) 
{
delay(30);
robot.keyPress(KeyEvent.VK_D); 
}
if(iX<=350){
delay(30);
robot.keyRelease(KeyEvent.VK_D);
}


// up
if(iY>360)
{
delay(30);
robot.keyPress(KeyEvent.VK_W); 
}
if(iY<=360){
delay(30);
robot.keyRelease(KeyEvent.VK_W);
}
// down
if( iY<310 ) 
{
delay(30);
robot.keyPress(KeyEvent.VK_S);
}
if(iY>=310){
delay(30);
robot.keyRelease(KeyEvent.VK_S);
}




//  indexFinger punch
if( iA0<500 ) 
{
delay(30);
robot.keyPress(KeyEvent.VK_I);
}
if(iA0>=700){
robot.keyRelease(KeyEvent.VK_I);
}

// PINKIE     sit in vehicle
if( iA1<500 ) 
{
robot.keyPress(KeyEvent.VK_F);
}
if(iA1>=700){
robot.keyRelease(KeyEvent.VK_F);
}

// middleFinger  jump
if( iA2<500 ) 
{
robot.keyPress(KeyEvent.VK_SPACE); 
}
if(iA2>=700){
robot.keyRelease(KeyEvent.VK_SPACE);
}
}


// Reading data from the Serial Port
void serialEvent (Serial port) // starts reading data from the Serial Port
{
data = port.readStringUntil('!'); // reads the data from the serial port up to the character '.' and it sets that into the String variable "data". So actually it reads this: 215,214/141;315:314<316!314?315.
data = data.substring(0,data.length()-1); // it removes the '.' from the previous read. So this will be the String "data" variable: 215,214/141;315:314<316!314?315
// Finding the indexes in the data and setting the variables from the sensors by taking from the String "data" the appropriate values that are between the characters in the "data" String
index = data.indexOf(","); // finds the index of the character "," from the String "data" variable
X= data.substring(0, index); // sets into the variable X the string from position 0 of the hole string to where the index was. That would mean that read will be : 215
index2 = data.indexOf("/"); // finds the index of the character "/" from the String "data" variable 
Y= data.substring(index+1, index2); // sets into the variable Y data the string from position where the character "," was +1, to where the index2 was. That would mean that the read will be: 214
// We keep reading this way and that's how we get only the numbers, the values from the sensors coming from the serial port.
index3 = data.indexOf(";");
Z= data.substring(index2+1, index3);
index4 = data.indexOf(":");
A0= data.substring(index3+1, index4);
index5 = data.indexOf("<");
A1= data.substring(index4+1, index5);
index6 = data.indexOf("!");
A2= data.substring(index5+1, data.length());
// Converting the String variables values into Integer values needed for the if statements above
iX= int(X);
iY= int(Y);
iZ= int(Z);
iA0= int(A0);
iA1= int(A1);
iA2= int(A2);
}
