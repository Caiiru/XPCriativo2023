# Branch Development - Caiiru

## Game Design Document

- **Version** _1.0_


## Tasks:

- [X] Remodulate player movement
- [X] Create Entity
- [ ] Create player aim 
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


---------------




#### *Date: 29/03/2024*
