/// @description ???

particleTime = 3;

particleTimer = particleTime;

spawnX = 236;
spawnY = 326;

maxSpeed = 5;
stepSpeed = 0.01;
decSpeed = 0.05;
xSpeed = 0;
ySpeed = 0;
preDirection = 0;
decBool = false;

tileMapID = layer_tilemap_get_id("tileSetBlockingLayer"); // Using blocking layer for now