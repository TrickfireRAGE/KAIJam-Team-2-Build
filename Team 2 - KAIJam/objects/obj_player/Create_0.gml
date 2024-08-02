/// @description ???

particleTime = 3;

particleTimer = particleTime;

spawnX = 236; // Do an object for this
spawnY = 326;

ySurfaceLimit = 200; // See if we can do a physics based thing. 
yParticleLimit = 480;

maxSpeed = 5;
stepSpeed = 0.01;
decSpeed = 0.05;
xSpeed = 0;
ySpeed = 0;
preDirection = 0;
decBool = false;

parallaxYCamera = 0;

tileMapID = layer_tilemap_get_id("tileSetBlockingLayer"); // Using blocking layer for now