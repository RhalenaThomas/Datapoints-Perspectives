# Using screens in your terminal with cloud computing

- "Screens" are like a separate window/desktop/tab but you are inside the same session (terminal BUT you cannot see or click a window)
- You can find all the information about screens GNU here:  https://www.gnu.org/software/screen/
- In High Performance Computing (HPC) systems it is the best practice to use "screens".
  
- Why use screens?
    
1. You can set up and enviroment and run code then "leave" the screen running. This way you are doing something else instead just staring at a black screen. 
2. If you drop you internet connection or for some other reason get bumped out of your HPC your task will keep running.
3. Always work in a screen when working in interactive mode. One most clusters you cannot access the internet instide of your interactive mode. If you are inside base R or working in python you would have to close your session to get file pathways or similar items (not practical).

- So screens are good but, how do you use them?

1. Make a screen with this command

```
screen -S MyScreen

```

The screen will open.  

Get out of the screen but keep the screen running for later.

Press: "CTLR + a" followed be "d" (do not hold control while pressing "d")

To get back into your screen 

```
# if you have only one screen 
screen -r 

# If you have multiple screens you need to name the screen
screen -r MyScreen

```

How do I know the name of my screen and how many I have runninng?

```
screen -ls

```

This will list your screens and the with a number assigened.  Only need the name you assigned to return the screen, but you need to full name to kill a screen. 

Sometimes screens get messed up for some reason and you can't get out.  

```
# quit your screen command - this will terminate a screen
screen -S 1954139.MyScreen -X quit

```

How can you detach a screen without terminating?

```
# screen -S <session_name> -X detach
screen -S 1954139.MyScreen -X detach

```

