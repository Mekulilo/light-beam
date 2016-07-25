import com.theeyetribe.client.*;
import com.theeyetribe.client.data.*;
import com.theeyetribe.client.reply.*;
import com.theeyetribe.client.request.*;
import org.jorgecardoso.processing.eyetribe.*;

import beads.*;
import org.jaudiolibs.beads.*;



float xstart, ystart, squaresize;

void setup() {
  size(500, 500);
  background(150);
  xstart = random(10);
  ystart = random(10);
  squaresize = height/12;
}

void draw() {
  fill(random (200), random (150), random (140), random (15));
  noStroke();
  rect(0, 0, width, height);

  stroke(1,0);
  fill(255, 200);

 xstart += 2.0;
  ystart += 1.0;

  translate(width/2, height/2);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=3) {
    ynoise += 0.02;
    float xnoise = xstart;
    for (float x = -squaresize; x <= squaresize; x+=3) {
      xnoise += 0.02;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();//
  translate(x * noiseFactor * 200, y * noiseFactor * 100);
  float edgeSize = noiseFactor * 55;
  ellipse(2, 2, edgeSize, edgeSize);
  popMatrix();
}