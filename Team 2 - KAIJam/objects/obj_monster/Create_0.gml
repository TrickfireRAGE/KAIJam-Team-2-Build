/// @description ???

// Here needs to be all the core variables we will need for the monster.


spawnX = obj_monsterSpawn.x;
spawnY = obj_monsterSpawn.y; 

//iniitialise the monster's states
state = e_state.idle;
path = path_add();
grid = mp_grid_create(0, 0, room_width/32, room_height/32, 32, 32);

// This is just a placeholder.

preXLocation = x;
preYLocation = y;
preImageScale = image_xscale;

animationSpeed = image_speed;