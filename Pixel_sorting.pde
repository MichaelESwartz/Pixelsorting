import processing.pdf.*;


PImage img;
PImage sorted;
int index = 0;

void setup() {
  size(2816, 1880, P3D);

  img = loadImage("Abstract4.JPG");
  sorted = createImage(img.width, img.height, RGB);
  sorted = img.get();

  
}

void draw() {
  println(frameRate);

  sorted.loadPixels();


  for (int n = 0; n <5; n++) {
    
    float record = -1;
    int selectedPixel = index;
    for (int j = index; j < sorted.pixels.length-10; j++) {
      color pix = sorted.pixels[j];
      color pixcomp = sorted.pixels[j+round(random(0,3))];
      float b = brightness(pix);
      float bcomp = brightness(pixcomp);
      if (b > bcomp) {
        selectedPixel = j;
        //record = b;
    
      
      }
      color temp = sorted.pixels[index];
      sorted.pixels[index] = sorted.pixels[selectedPixel];
      sorted.pixels[selectedPixel] = temp;
        
    }

    // Swap selectedPixel with i
   
  

    if (index < sorted.pixels.length -1) {
      index++;
    }
  }


  sorted.updatePixels();

  background(0);
  //image(img, 0, 0);
  image(sorted, 0, 0);
  
  //saveFrame("line-#####.png");


}
void keyPressed() {
  if (key == 'q') {
    saveFrame("Sortexport#####.png");
    //exit();
  }
}