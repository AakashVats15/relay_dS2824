Introduction
ASCII command control of relay module

Getting Started

Set up

IP settings
Set IP address for router to 192.168.0.xxx
Default IP address for relay module 192.168.0.123
Default port number for TCP/IP 17123

ASCII commands

ST STatus request
SR [Relay number] [on/off] {Pulse time in mS}
SR 1 on Set Relay 1 on
SR 1 off Set Relay 1 off
SR 1 on 1000 Set Relay 1 on for 1 second
SO [Output number] [on/off]
SO 1 on Set Output 1 on
SO 1 off Set Output 1 off
GR [Relay number]
GR 1 Get relay 1 status – responds with Active or Inactive
GI [Input number]
GI 1 Get Input 1 status – responds with Active or Inactive
GA [Analog Input number]
GA 1 Get Analog input 1 – responds with the 12-bit analog value
GC [Counter Number]
GC 1 Get Counter 1 – responds with count, capture values.

E.g. Relay.sendCommand('SR 1 on') [Relay 1 = on]
