# The Helicopter Game
![heli](https://user-images.githubusercontent.com/65856165/113330844-c879ed80-9351-11eb-833a-a8d036e4b602.gif)

The Helicopter Game is written in 8086 Assembly. It is tested to work by compiling with MASM and running the exe file with DOSBOX. Other compilers(NASM, TASM, etc) may not work but you can try.

The Helicopter Game is very simple. The player has to manoeuvre the helicopter in the deep cave to avoid the obstacle, crashing in the cave will result in game over. The player also has to collect fuel as much as possible. Failed to do so, the helicopter will not be able to fly and eventually crash.

The further the player travel, the higher the score. Player can set a high score record if he/she beat the previous high score holder, the high score record will be stored inside the file.

To ensure player fresh experience each play through, the cave have been made to be created randomly every single time. The game will become more and more difficult as the player wander deeper into the cave. The helicopter velocity will become faster, the cave creation gradient (up and downs) will become more aggressive, the cave will become narrow in size as the player travel further. 

# Getting Started
If you just want to try and run the game. You just need to install DOSBox and run the following command in DOSBox. Note: Following directory is just an example
```bash
mount c c:\8086
c:
game
```

If you want to compile the source code(.asm) file, you can use MASM(tested) to compile. You need to place MASM.exe along with your game.asm directory and run the following command.
```bash
mount c c:\8086
c:
masm /a game.asm;
link game.obj;
game
```

# Documentation
A more detailed game design documentation can be found in the documentation.pdf file.

# Source
A great book about assembly language programming -> IBM PC Assembly Language and Programming Book by Peter Abel


You may try Emu8086, NASM or TASM, etc. It is not tested and may not work.

License
-------
Copyright (c) 2021, Cheah Siew Lek

The Helicopter Game is provided **as-is** under the **MIT** license. 
For more information see LICENSE.
