# countdownBear
A simple countdown extension for BeamMP. Displays the countdown for all players in the server via a simple ui + chat, and will make a sound for the remaining 3 seconds + "go".

Does not work without a server.

```
Start countdown by typing:
 /race
 /countdown
 /race n
 /countdown n
 n - Any number between 1 and 60. Changeable in server lua.
 Default is 5 seconds.
```
Dont forget to add the ui app to your ui via the in game menu.

[Download](https://github.com/dasbjoern/countdownBear/releases/latest)

Installation:

Open up the zip and simply drag the Resource folder into your BeamMP Server's root folder. 

```
Resources/
├── Client/
│   └── countdownBear.zip
├── Server/
│   ├── countdownBear/
│   │   └── countdownbearserver.lua
```
