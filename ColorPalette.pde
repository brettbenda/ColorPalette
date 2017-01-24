/*
  Name:William "Brett" Benda
  Assignment:Homework,2 exercise 2(make a scalable pattern)
  Decscription: I decided to make a color pallete "pattern".
                The image has fixed hue/saturation based on the position relative to the width/height.
                
                I also added some mouse interactivity.
                
                Moving the mouse from left to right increases the brightness, and moving it right to left reduces brightness.
                Left edge = 0 brightness.
                Right edge = 255 brightness.
                
                Moving the mouse up and down changes the number of divisions used to generate the image.
                Bottom edge = "0" divisions [minimum is really 1, because 1/0 is undefined]
                Top edge = 255 divisions
*/

void setup(){
  //This sets up the base conditions for the sketch
  size(700,500);
  background(255);
  //I use HSB to create the pallete
  colorMode(HSB);
  rectMode(CENTER);
  noStroke();
}

void draw(){
  //count is how many divisions there are "255" indicates that 255 is the max num.
  float count = 255-255*mouseY/height;
  //values for color modifications
  float hue;
  float sat;
  //brigtness changes on mouse movement
  float bright = 255*mouseX/width;
  
  //n items split into n groups need n-1 dividers
  float modCount = count-1;
  
  //location vars
  float x;
  float y;
  
  //"proper" heights and widths are the dimensions of each rect, based on canvas size
  float properWidth = width/modCount;
  float properHeight = height/modCount;
  
  //loops to draw each rect [essentialy traversing a 2D array]
  for(int i = 0; i <= count; i++){ 
   y = i*properHeight;
   sat = i*255/modCount;
   for(int j = 0; j <= count; j++){
     x = j*properWidth;
     hue = j*255/modCount;
     fill(hue,sat,bright);
     rect(x,y,properWidth,properHeight);
   }
  }
}