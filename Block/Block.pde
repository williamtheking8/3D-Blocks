float rotx, roty;
PImage obsidian, grass_side, grass_bottom, grass_top,dirt; 

void setup() {
  size(800, 800, P3D);
  textureMode(NORMAL);
  obsidian = loadImage("Obsidian.png");
  grass_side = loadImage("Grass_Block_Side.png");
  grass_bottom = loadImage("Grass_Block_Bottom.png");
  grass_top = loadImage("Grass_Block_Top.png");
  
  dirt = loadImage("Grass_Block_Bottom.png");
}
void draw() {
  background(#FFFFFF);
  
  TexturedCube(width/2+300,height/2+200, 20,grass_top,grass_bottom,grass_side, 200);
  TexturedCube(width/2,height/2, 20,dirt,dirt,dirt, 200);
  TexturedCube(width/2-200,height/2-200, 20,obsidian,obsidian,obsidian, 200);

  translate(width/2, height/2, 20);
  scale(200);
  rotateX(rotx);
  rotateY(roty);

  noStroke();
}
void TexturedCube(float x, float y, float z, PImage top, PImage bottom, PImage side, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS);
  texture(top);

  //top  x  y  z  tx ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);  
  vertex(0, 0, 1, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(bottom);

  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);  
  vertex(0, 1, 1, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(side);

  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);  
  vertex(0, 1, 1, 0, 1);

  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);  
  vertex(0, 1, 0, 0, 1);

  //right
  vertex(1, 0, 1, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);  
  vertex(1, 1, 1, 0, 1);

  //left
  vertex(0, 0, 1, 0, 0);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 1, 0, 1, 1);  
  vertex(0, 1, 1, 0, 1);

  endShape();





  popMatrix();
}
void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01; 
  roty = roty + (pmouseX - mouseX)*0.01;
}
