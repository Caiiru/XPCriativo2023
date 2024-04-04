# Branch Development - Caiiru

## Game Design Document

- **Version** _1.0_


## Tasks:

- [X] Remodulate player movement
- [X] Create Entity
- [ ] Create player aim <- WIP
- [ ] First Skill: Fireball



## How Player Work:

 In godot, I'm trying to use a pattern that use in unity: Separate all player's skills and movement in different scripts. 
 Like:
- Player (vertical) Movement = one script
- Player Jump = another script

But, godot isnt like Unity in the way that I can add one or more scripts at the same object. Because of that godot behaviour, the player was made in this way: 

The scripts for each player skills/controller is one node that is child of Player's CharacterBody2D and each Node can modify the actor velocity.

So, player is like an "scene" and has childs: 
- PlataformerMovement
- PlayerJump
- PlayerEntity
- Player Aim


---------------

### Plataformer Movement 

This script is very simple: 

    - In _process (update) I have the function "GatherInput" thats pick the player inputs based on the Axis and set the last direction that player walked. The "Move" func just move the player around based on the "stats resource" speed 

### Player Jump
This one script has more variables and functions that movement script. The resume of how it works is:

    One func handle the inputs (like the movement script). HandleJump func checks if the player can jump 
    ExecuteJump do what the name means to do and reset the conditional variables for player jump
    HandleGravity func handles the gravity and the player's "fall" velocity

### Entitys and Player Entity
Entity Script is the script that all things alive in the game will have in common. This is an abstract script that objects, player, enemys will be a child.

The Entity Script need an "Entity Resource" (Like Scriptable Object in Unity)

So, entity resource is a data class that have the current HP and the max HP of an entity

#### Entity functionalities: 
- TakeDamage
- isDead
- Cure
- Die
- Get Health

*Every functionality do what the name means to do*

#### *Date: 04/04/2024*

