# arduinogamecontroller
A university project for micro controllers

Project Summary


In this project, a hand gesture controlled car will be developed using equipment mentioned in the equipment list. This car would solely be controlled via hand gestures and no remote control with buttons or joystick will be used anywhere in the project.
The project is based on wireless communication, where the data from the hand gestures is transmitted to the car by Bluetooth module (Transmitter to Receiver).
The project is divided into two sections 
1.	transmitter section
2.	receiver section
Working: 
A 9.6 Volt battery will be used to power the car kit and Arduino Uno (attached on the car). In the transmitter section, we will be attaching Arduino nano on the glove with a Bluetooth module and a 9V battery which will power the equipment on the glove. The accelerometer will detect the change in the coordinates of the hand and will process the information in Arduino nano and will transmit it to Arduino uno through Bluetooth module on the hand. The other Bluetooth module attached on the car would detect the signal, transmit it to the Arduino Uno for processing and then Arduino Uno will process it and move the car via the dc motors of the car.  
