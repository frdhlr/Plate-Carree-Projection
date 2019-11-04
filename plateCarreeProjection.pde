import peasy.*;

PeasyCam camera;

PImage imageToProject;
int[] pixels;

void settings() {
  size(900, 900, P3D);
}

void setup() {
  pixels = loadImageToProject();
  camera = new PeasyCam(this, width / 2, height / 2, 0, 300);
}

void draw() {
  background(0);
  lights();

  translate(width / 2, height / 2);

  for(int x = -300; x < 300; x++) {
    for (int y = 0; y < 150; y++) {
       stroke(pixels[(x + 300) + 600 * y]);

       float longitude = lerp(-PI, PI, (x + 300.0) / 599.0);
       float latitude  = lerp(0, HALF_PI, y / 149.0);

       float projectionX = cos(latitude) * sin(longitude);
       float projectionY = cos(latitude) * cos(longitude);
       float projectionZ = sin(latitude);

       point(projectionX * 150, projectionY * 150, projectionZ *150);
       point(x, 250, y);
    }
  }
}

int[] loadImageToProject() {
  imageToProject = loadImage("./Images/imageToProject_5.jpg");
  imageToProject.resize(600, 150);
  imageToProject.loadPixels();

  return imageToProject.pixels;
}
