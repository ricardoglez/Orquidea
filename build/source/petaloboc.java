import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class petaloboc extends PApplet {

float variacion0, variacion1, variacion2, variacion3;

public void setup() {
  
}

public void draw(){
  noLoop();
  background(0);
  pushMatrix();
  //scale(map(mouseX, 0, width, 0, 2));
  translate(width / 2, height / 2);
  float op = random(20,70);

  for(int i = 0 ; i <=250; i+=25){

  dibujarPetalo0(i*PI/2, i, op, 0xffD6BEF8);
  dibujarPetalo1(i*PI/2, i, op, 0xffD6BEF8);
  dibujarPetalo2(i*PI/6, i, op, 0xffD6BEF8);
  dibujarPetalo3(i*PI/4, i, op, 0xff773657);
  dibujarPetalo4(i*PI/4, i, op, 0xff773657);
  dibujarPetalo5(i*PI/2, i, 160, 0xffE9F01D);
}
  popMatrix();
}

public void dibujarPetalo0(float ancho, float altura, float op, int col) {

  int xC = 0;
  int yC = 0;
  println("Ancho:", ancho, "Altura:", altura);
  pushMatrix();
  translate(xC, yC);
  variacion0 = -width/3-(ancho / random(2, 3));
  variacion1 = altura - (altura / random(2, 3));
  variacion2 = (altura / random(2, 3));
  variacion3 = -ancho+width/3 + (ancho / random(2,3));
/*Ver lineas de control y anclas
  stroke(#00ff00);
  strokeWeight(3);
  ellipse(0, 0, 10, 10);
  ellipse(variacion0, 0, 10, 10);
  ellipse(-ancho, variacion1, 10, 10);
  ellipse(-ancho, altura, 10, 10);
  line(0, 0, variacion0, 0);
  line(-ancho, variacion1, -ancho, altura);

  ellipse(variacion3, altura, 10, 10);
  ellipse(0, variacion2, 10, 10);
  ellipse(0, 0, 10, 10);
  line(variacion3, altura, -ancho, altura);
  line(0, variacion2, 0, 0);
*/
  noStroke();
  fill(col, op);
  beginShape();
  vertex(0, 0);
  bezierVertex(variacion0, 0, -ancho, variacion1, -ancho, altura);
  bezierVertex(variacion3, altura, 0, variacion2, 0, 0);
  endShape();
  // println(xC, yC);
  popMatrix();
}

public void dibujarPetalo1(float ancho, float altura, float op, int col) {
  int xC = 0;
  int yC = 0;
  pushMatrix();
  translate(xC, yC);
  variacion0 = width/3+(ancho / random(2, 3));
  variacion1 = altura - (altura / random(2, 3));
  variacion2 = +(altura / random(2, 3));
  variacion3 = +ancho-width/3- (ancho / random(2, 3));
/* Ver lineas de control y anclas
  stroke(#00ff00);
  strokeWeight(3);
  ellipse(0, 0, 10, 10);
  ellipse(variacion0, 0, 10, 10);
  ellipse(ancho, variacion1, 10, 10);
  ellipse(ancho, altura, 10, 10);
  line(0, 0, variacion0, 0);
  line(ancho, variacion1, ancho, altura);

  ellipse(variacion3, altura, 10, 10);
  ellipse(0, variacion2, 10, 10);
  ellipse(0, 0, 10, 10);
  line(variacion3, altura, -ancho, altura);
  line(0, variacion2, 0, 0);

  line(0, 0, variacion0, 0);
  line(ancho, altura, ancho, variacion1);
  line(0, 0, 0, variacion2);
  line(variacion3, altura, ancho, altura);
*/
  noStroke();
  fill(col, op);
  beginShape();
  vertex(0, 0);
  bezierVertex(variacion0, 0, ancho, variacion1, ancho, altura);
  bezierVertex(variacion3, altura, 0, variacion2, 0, 0);
  endShape();
  popMatrix();
}

public void dibujarPetalo2(float ancho, float altura, float op, int col) {
  pushMatrix();
  translate(0,0);
  variacion0 = -altura / 2 + (altura / random(2, 4));
  variacion1 = -altura + (altura / random(2, 3));
/*Ver Lineas de control y anclas
  stroke(#00ff00);
  strokeWeight(3);
  line(0, 0, -ancho / 2, variacion0);
  line(-ancho / 2, variacion1, 0, -altura);
  line(0, 0, +ancho / 2, variacion0);
  line(+ancho / 2, variacion1, 0, -altura);
*/
  noStroke();
  fill(col, op);
  bezier(0, 0, -ancho / 2, variacion0, -ancho / 2, variacion1, 0, -altura);
  bezier(0, 0, +ancho / 2, variacion0, +ancho / 2, variacion1, 0, -altura);
  popMatrix();
}

public void dibujarPetalo3(float ancho, float altura, float op, int col) {
  int xC = 0;
  int yC = 0;
  println("Ancho:", ancho, "Altura:", altura, "Centro x:", xC, "Centro y:", yC);
  pushMatrix();
  translate(xC, yC);
  variacion0 = -width/5-(ancho / random(2,3));
  variacion1 = -altura + (altura / random(2, 10));
  variacion2 = -(altura / random(2, 10));
  variacion3 = -ancho+width/5 + (ancho / random(2,3));
/* Ver lineas de control y anclas
  stroke(#00ff00);
  strokeWeight(3);
  ellipse(0, 0, 10, 10);
  ellipse(variacion0, 0, 10, 10);
  ellipse(-ancho, variacion1, 10, 10);
  ellipse(-ancho, -altura, 10, 10);
  line(0, 0, variacion0, 0);
  line(-ancho, variacion1, -ancho, -altura);

  ellipse(variacion3, -altura, 10, 10);
  ellipse(0, variacion2, 10, 10);
  ellipse(0, 0, 10, 10);
  line(variacion3, -altura, -ancho, -altura);
  line(0, variacion2, 0, 0);
*/
  noStroke();
  fill(col, op);
  beginShape();
  vertex(0, 0);
  bezierVertex(variacion0, 0, -ancho, variacion1, -ancho, -altura);
  bezierVertex(variacion3, -altura, 0, variacion2, 0, 0);
  endShape();
  // println(xC, yC);
  popMatrix();
}

public void dibujarPetalo4(float ancho, float altura, float op, int col) {
  int xC = 0;
  int yC = 0;
  pushMatrix();
  translate(xC, yC);
  variacion0 = width/5+(ancho / random(2, 3));
  variacion1 = -altura + (altura / random(2, 10));
  variacion2 = -(altura / random(2, 10));
  variacion3 = ancho -width/5 - (ancho / random(2, 4));
/* Ver lineas de control y anclas
  stroke(#00ff00);
  strokeWeight(3);
  ellipse(0, 0, 10, 10);
  ellipse(variacion0, 0, 10, 10);
  ellipse(ancho, variacion1, 10, 10);
  ellipse(ancho, -altura, 10, 10);
  line(0, 0, variacion0, 0);
  line(ancho, variacion1, ancho, -altura);

  ellipse(variacion3, -altura, 10, 10);
  ellipse(0, variacion2, 10, 10);
  ellipse(0, 0, 10, 10);
  line(variacion3, -altura, ancho, -altura);
  line(0, variacion2, 0, 0);

  line(0, 0, variacion0, 0);
  line(ancho, -altura, ancho, variacion1);
  line(0, 0, 0, variacion2);
  line(variacion3, -altura, ancho, -altura);
*/
  noStroke();
  //strokeWeight(1);
  fill(col, op);
  beginShape();
  vertex(0, 0);
  bezierVertex(variacion0, 0, ancho, variacion1, ancho, -altura);
  bezierVertex(variacion3, -altura, 0, variacion2, 0, 0);
  endShape();
  popMatrix();
}

public void dibujarPetalo5(float ancho, float altura, float op, int col) {
  int xC = 0;
  int yC = 0;
  pushMatrix();
  translate(xC, yC);
  variacion0 = +(ancho / random(4, 18));
  variacion1 = altura - (altura / random(4, 18));
  variacion2 = +(altura / random(4, 18));
  variacion3 = ancho - (ancho / random(4, 18));
/* Ver lineas de control y anclas
  stroke(#00ff00);
  strokeWeight(3);
  ellipse(0, 0, 10, 10);
  ellipse(-ancho / 3, variacion0, 10, 10);
  ellipse(-ancho / 3, variacion1, 10, 10);
  ellipse(0, altura/2, 10, 10);
  line(0, 0, -ancho / 3, variacion0);
  line(-ancho / 3, variacion1, 0, altura/2);
  ellipse(0, 0, 10, 10);
  ellipse(-ancho / 3, variacion0, 10, 10);
  ellipse(-ancho / 3, variacion1, 10, 10);
  ellipse(0, altura/2, 10, 10);  line(0, 0, +ancho / 3, variacion0);
  line(-ancho / 3, variacion1, 0, altura/2);
*/


  noStroke();
  fill(col, op);
  beginShape();
  vertex(0, 0);
  bezier(0, 0, -ancho / 3, variacion0, -ancho / 3, variacion1, 0, altura/2);
  bezier(0, 0, +ancho / 3, variacion0, +ancho / 3, variacion1, 0, altura/2);
  endShape();
  popMatrix();
}
  public void settings() {  size(900, 700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "petaloboc" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
