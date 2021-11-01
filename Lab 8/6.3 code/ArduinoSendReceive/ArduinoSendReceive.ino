/*

  ASEN 3300 Lab 8 Serial Communication - Part 2
  Created: December 4, 2015
    Updated: October 8, 2020
  Author: Nathan Genrich
    Contributers: Ruben Hinojosa Torres
  
  Description:
  This Arduino code initilizes serial communication to the
  computer at a specified Baud Rate, Number of Bits, Parity,
  and Stop bit. It writes one byte of information every
  2 seconds and repeats indefinately.

  Update: 
  Communication occurs between the Tx1 and Rx2 ports of the 
  same Arduino Board.
  
  
  Compile:
  To compile and run this software on the Arduino, you MUST
  BE USING the Arduino IDE version 1.0.3 or later.
  
  Simply select the correct serial port in Tools -> Serial Port
  and push the Upload button in the user interface.

*/

#include <HardwareSerial.h>

int val;

// The setup routine runs when the microcontroller is turned on
// or reset using the reset button.
void setup() {
  // Initialize serial communication
  // The first number is the baud rate and the second value
  // is the serial protocol. Find a list of possible protocols
  // on the arduino website: http://arduino.cc/en/Serial/Begin
  Serial1.begin(2400,SERIAL_8N1); // Transmit Channel
  Serial2.begin(2400,SERIAL_8N1); // Receive Channel
  Serial.begin(2400);
}

// The loop runs continuously until the power is turned off
void loop() {
  
  // Transmission:
  // Print out a specified byte in decimal form to be sent
  // to receving channel
  Serial1.write(106);
  // wait two seconds for the channel to receive
  delay(2000);
  
  // Reception: 
  if(Serial2.available()) {
    // delay 100 ms to allow all that is sent to be received
    delay(100);
    // store the value received from the other arduino
    val = Serial2.read();
    // Print blank space for formatting
    Serial.print(' ');
    // Print the received value to be read through the 
    // computer on the receiving end
    Serial.write(val); // Can be changed to Serial.print() to print numerical value
  }

}
