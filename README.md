# BackEnd Challenge 002

For us, it is not all about the CV or titles. The most important for us is to know how you face a concrete challenge and how you approach it. What is your way of thinking, how do you tackle the problem, which tools do you choose, ...

In order to understand all this, we would like you to complete the following challenge. This is a simplified case which illustrates the kinds of situations we have to deal with on a daily basis.

This is a good opportunity to demonstrate your style and your capabilities. It is a way to show us which kind of code you like to create.

There are no time limitations but we suggest you don't spend more than a few hours on it. We are not looking for a bullet-proof solution but it has to be an elegant, clean, maintainable and intuitive approach.

Create it in your own way and use the tools you are most comfortable with. Show us your skills.

## Challenge Description

### It is a survival matter

Human population is getting overwhelming for the Earth's health. We have to find a solution to stop the exponential growing of human beeings.

Goverments and the most intelligent people in the planet have found a solution.

Every person when she reaches her twenties has to compete in a _live or die_ fight against another fellow.

The competition has been designed using a methodic process to select the most skilled individuals of our society based on their intelligent, agility and strength.

The competition is called **Rock-paper-scissors-lizard-Spock** and here are the [rules](http://en.wikipedia.org/wiki/Rock-paper-scissors-lizard-Spock).

### The court

You are in charge of implement the interface that every person has to use to fight for her survival.

#### Initialize the game

The Player enters in a web site and she can choose between:

1. Generate a new Game (The system will offer a UUID for the new Game)
1. Compete in a Game that is _waiting for an adversary_ (the Player inserts the UUID of the Game)

Then the Player chooses a list of **10 moves**, for each one the Player can choose one of the possible options:

- rock
- paper
- scissors
- lizard
- spock

#### Waiting for an adversary (Only if the Player has generated a new Game)

The system will store the Game configuration and will keep it until an adversary chooses to fight against this Game.

#### Combat

Ones the system detects a _match_ it executes the competition and stores the results

#### Results

Both Players can see the results and prepare their selves for a long live.. or for a near death.

### Implementation notes

We know this project is asking for a _websocket_ based implementation but this is overwhelming for the propose of this challenge.

In the _Waiting for an adversary_ page you can just expose a _refresh!_ button so the Player can click on it to ask the system if there are already results for this Game.. or you can implement a _X seconds_ authomatically refresh.. or an _Ajax_ solution.

- Please check the [wireframes](https://docs.google.com/drawings/d/1wM8Ex2zA7jUnGVicF8wqRLypkzr9QzdPCCZD1rhQhHQ/edit?usp=sharing)
- Please check the [workflow diagram](https://docs.google.com/drawings/d/12aS34CFiJHVNm0uGAIzMnD7_dqKdkvLxy0ytJkanysM/edit?usp=sharing)

This _wireframes_ and _workflow diagram_ are a very raw explanation, please feel free to add/remove/modify anything on your own.

Please don't get too crazy trying to implement the perfect solution, we are interested in the most basic possible solution. We appreciate the final delivery to be solid, so be focused in simplify the functionalities so you can develop a stable solution in a few hours.


### Programming Requirements

The backend must be Ruby... frameworks, gems, databases are all up to you.

For the fontend we appreciate if it looks human friendly, but it is not necesary to be fancy. (There are a lot of OpenSource/Free templates and HTML/CSS frameworks that can make a good job)

### What we assess

- Legible, understandable, clean and maintainable code
- Wisely choosen tools, techniques and/or frameworks

## Submission Instructions

1. Fork this project
1. Complete the task and push on your own fork. (Nice, atomic and iterative commits are welcome)
1. Include instructions of how we can make it to work
1. Submit a pull request
1. Send an email to hr@daliaresearch.com to review your solution

And of course: don't hesitate to **contact us with any question** you have, better use for this our _IT_ email: [it@daliaresearch.com](mailto:it@daliaresearch.com)


