import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class petaloboc extends PApplet {



ControlP5 cp5;
Slider abc;

float v0, v1, v2, v3, altoS, anchoS, altoS1, anchoS1;
int cR, cG, cB, opac, cR1, cG1, cB1, opac1;

public void setup() {
  
  cp5 = new ControlP5(this);

  cp5.addSlider("ancho").setPosition(20, 50).setWidth(50).setRange(0, 5);
  ;
  cp5.addSlider("alto").setPosition(20, 70).setWidth(50).setRange(.3f, 2);
  ;
  cp5.addSlider("opacidad").setPosition(20, 90).setWidth(50).setRange(0, 100);
  ;
  cp5.addSlider("colorR").setPosition(120, 50).setWidth(50).setRange(0, 255);
  ;
  cp5.addSlider("colorG").setPosition(120, 70).setWidth(50).setRange(0, 255);
  ;
  cp5.addSlider("colorB").setPosition(120, 90).setWidth(50).setRange(0, 255);
  ;

  cp5.addSlider("ancho1").setPosition(20, 150).setWidth(50).setRange(0, 5);
  ;
  cp5.addSlider("alto1").setPosition(20, 170).setWidth(50).setRange(.3f, 2);
  ;
  cp5.addSlider("opacidad1").setPosition(20, 190).setWidth(50).setRange(0, 100);
  ;
  cp5.addSlider("colorR1").setPosition(120, 150).setWidth(50).setRange(0, 255);
  ;
  cp5.addSlider("colorG1").setPosition(120, 170).setWidth(50).setRange(0, 255);
  ;
  cp5.addSlider("colorB1").setPosition(120, 190).setWidth(50).setRange(0, 255);
  ;

}

public void ancho(float a) {
  anchoS = a;
  //println("valor ancho: ", a);
}
public void alto(float a) {
  altoS = a;
  //println("valor alto1: ", a);
}

public void opacidad(int op) {
  opac = op;
  //println("valor opacidad: ", op);
}

public void colorR(int colorD) {
  cR = colorD;
  //println("valor cR: ", cR);
}

public void colorG(int colorD) {
  cG = colorD;
  //println("valor cG: ", cG);
}

public void colorB(int colorD) {
  cB = colorD;
  //println("valor cB: ", cB);
}


public void ancho1(float a) {
  anchoS1 = a;
  //println("valor ancho: ", a);
}
public void alto1(float a) {
  altoS1 = a;
  //println("valor alto1: ", a);
}

public void opacidad1(int op) {
  opac1 = op;
  //println("valor opacidad: ", op);
}

public void colorR1(int colorD) {
  cR1 = colorD;
  //println("valor cR: ", cR);
}

public void colorG1(int colorD) {
  cG1 = colorD;
  //println("valor cG1: ", cG1);
}

public void colorB1(int colorD) {
  cB1 = colorD;
 // println("valor cB: ", cB1);
}


public void draw() {
  // noLoop();
  background(0);
  pushMatrix();
  // scale(map(mouseX, 0, width, 0, 2));
  translate(width / 2, height / 2);
  // float op = random(20, 70);
  // float mD = map(mouseX, 0, width, 1, 5);
  // float mD0 = map(mouseY, 0, height, .3, 2);
  int color0 = color(cR, cG, cB);
  int color1 = color(cR1, cG1, cB1);
  for (int i = 0; i <= 1000; i += 25) {

    // variable0, variable1, variable2, variable3, ancho,altura ,aopacidad,
    // color
    dibujarPetalo0(anchoS, altoS, anchoS, altoS, i * PI / anchoS / 8,altoS / 8 * i, opac, color0);
    dibujarPetalo1(anchoS, altoS, anchoS, altoS, i * PI / anchoS / 8,altoS / 8 * i, opac, color0);
    dibujarPetalo2(anchoS, altoS, anchoS, altoS, i * PI / anchoS / 8,altoS / 8 * i, 80, color(79, 36, 107));
    dibujarPetalo3(anchoS1, altoS1, anchoS1, altoS1, i * PI / anchoS1 / 8,altoS1 / 8 * i, opac1, color1);
    dibujarPetalo4(anchoS1, altoS1, anchoS1, altoS1, i * PI / anchoS1 / 8,altoS1 / 8 * i, opac1, color1);
    dibujarPetalo5(anchoS, altoS, anchoS, altoS, i * PI / anchoS / 8,altoS / 8 * i, opac*5, 0xffE9F01D);

  }
  popMatrix();
}

public void dibujarPetalo0(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, int col) {

  int xC = 0;
  int yC = 0;
  // println("Ancho:", ancho, "Altura:", altura);
  pushMatrix();
  translate(xC, yC);
  /*
    v0 = -width/3-(ancho / random(2, 3));
    v1 = altura - (altura / random(2, 3));
    v2 = (altura / random(2, 3));
    v3 = -ancho+width/3 + (ancho / random(2,3));
  Ver lineas de control y anclas
    stroke(#00ff00);
    strokeWeight(3);
    ellipse(0, 0, 10, 10);
    ellipse(v0, 0, 10, 10);
    ellipse(-ancho, v1, 10, 10);
    ellipse(-ancho, altura, 10, 10);
    line(0, 0, v0, 0);
    line(-ancho, v1, -ancho, altura);

    ellipse(v3, altura, 10, 10);
    ellipse(0, v2, 10, 10);
    ellipse(0, 0, 10, 10);
    line(v3, altura, -ancho, altura);
    line(0, v2, 0, 0);
  */
  noStroke();
  fill(col, op);
  beginShape();
  vertex(0, 0);
  bezierVertex(v0, 0, -ancho, v1, -ancho, altura);
  bezierVertex(v3, altura, 0, v2, 0, 0);
  endShape();
  // println(xC, yC);
  popMatrix();
}

public void dibujarPetalo1(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, int col) {
  int xC = 0;
  int yC = 0;
  pushMatrix();
  translate(xC, yC);
  /*
    v0 = width/3+(ancho / random(2, 3));
    v1 = altura - (altura / random(2, 3));
    v2 = +(altura / random(2, 3));
    v3 = +ancho-width/3- (ancho / random(2, 3));
   Ver lineas de control y anclas
    stroke(#00ff00);
    strokeWeight(3);
    ellipse(0, 0, 10, 10);
    ellipse(v0, 0, 10, 10);
    ellipse(ancho, v1, 10, 10);
    ellipse(ancho, altura, 10, 10);
    line(0, 0, v0, 0);
    line(ancho, v1, ancho, altura);

    ellipse(v3, altura, 10, 10);
    ellipse(0, v2, 10, 10);
    ellipse(0, 0, 10, 10);
    line(v3, altura, -ancho, altura);
    line(0, v2, 0, 0);

    line(0, 0, v0, 0);
    line(ancho, altura, ancho, v1);
    line(0, 0, 0, v2);
    line(v3, altura, ancho, altura);
  */
  noStroke();
  fill(col, op);
  beginShape();
  vertex(0, 0);
  bezierVertex(v0, 0, ancho, v1, ancho, altura);
  bezierVertex(v3, altura, 0, v2, 0, 0);
  endShape();
  popMatrix();
}

public void dibujarPetalo2(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, int col) {
  pushMatrix();
  translate(0, 0);
  /*
    v0 = -altura / 2 + (altura / random(2, 4));
    v1 = -altura + (altura / random(2, 3));
  Ver Lineas de control y anclas
    stroke(#00ff00);
    strokeWeight(3);
    line(0, 0, -ancho / 2, v0);
    line(-ancho / 2, v1, 0, -altura);
    line(0, 0, +ancho / 2, v0);
    line(+ancho / 2, v1, 0, -altura);
  */
  noStroke();
  fill(col, op);
  bezier(0, 0, -ancho / 2, v0, -ancho / 2, v1, 0, -altura);
  bezier(0, 0, +ancho / 2, v0, +ancho / 2, v1, 0, -altura);
  popMatrix();
}

public void dibujarPetalo3(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, int col) {
  int xC = 0;
  int yC = 0;
  println("Ancho:", ancho, "Altura:", altura, "Centro x:", xC, "Centro y:", yC);
  pushMatrix();
  translate(xC, yC);
  /*
    v0 = -width/5-(ancho / random(2,3));
    v1 = -altura + (altura / random(2, 10));
    v2 = -(altura / random(2, 10));
    v3 = -ancho+width/5 + (ancho / random(2,3));
  /* Ver lineas de control y anclas
    stroke(#00ff00);
    strokeWeight(3);
    ellipse(0, 0, 10, 10);
    ellipse(v0, 0, 10, 10);
    ellipse(-ancho, v1, 10, 10);
    ellipse(-ancho, -altura, 10, 10);
    line(0, 0, v0, 0);
    line(-ancho, v1, -ancho, -altura);

    ellipse(v3, -altura, 10, 10);
    ellipse(0, v2, 10, 10);
    ellipse(0, 0, 10, 10);
    line(v3, -altura, -ancho, -altura);
    line(0, v2, 0, 0);
  */
  noStroke();
  fill(col, op);
  beginShape();
  vertex(0, 0);
  bezierVertex(v0, 0, -ancho, v1, -ancho, -altura);
  bezierVertex(v3, -altura, 0, v2, 0, 0);
  endShape();
  // println(xC, yC);
  popMatrix();
}

public void dibujarPetalo4(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, int col) {
  int xC = 0;
  int yC = 0;
  pushMatrix();
  translate(xC, yC);
  /*
    v0 = width/5+(ancho / random(2, 3));
    v1 = -altura + (altura / random(2, 10));
    v2 = -(altura / random(2, 10));
    v3 = ancho -width/5 - (ancho / random(2, 4));
  /* Ver lineas de control y anclas
    stroke(#00ff00);
    strokeWeight(3);
    ellipse(0, 0, 10, 10);
    ellipse(v0, 0, 10, 10);
    ellipse(ancho, v1, 10, 10);
    ellipse(ancho, -altura, 10, 10);
    line(0, 0, v0, 0);
    line(ancho, v1, ancho, -altura);

    ellipse(v3, -altura, 10, 10);
    ellipse(0, v2, 10, 10);
    ellipse(0, 0, 10, 10);
    line(v3, -altura, ancho, -altura);
    line(0, v2, 0, 0);

    line(0, 0, v0, 0);
    line(ancho, -altura, ancho, v1);
    line(0, 0, 0, v2);
    line(v3, -altura, ancho, -altura);
  */
  noStroke();
  // strokeWeight(1);
  fill(col, op);
  beginShape();
  vertex(0, 0);
  bezierVertex(v0, 0, ancho, v1, ancho, -altura);
  bezierVertex(v3, -altura, 0, v2, 0, 0);
  endShape();
  popMatrix();
}

public void dibujarPetalo5(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, int col) {
  int xC = 0;
  int yC = 0;
  pushMatrix();
  translate(xC, yC);
  /*
    v0 = +(ancho / random(4, 18));
    v1 = altura - (altura / random(4, 18));
    v2 = +(altura / random(4, 18));
    v3 = ancho - (ancho / random(4, 18));
  /* Ver lineas de control y anclas
    stroke(#00ff00);
    strokeWeight(3);
    ellipse(0, 0, 10, 10);
    ellipse(-ancho / 3, v0, 10, 10);
    ellipse(-ancho / 3, v1, 10, 10);
    ellipse(0, altura/2, 10, 10);
    line(0, 0, -ancho / 3, v0);
    line(-ancho / 3, v1, 0, altura/2);
    ellipse(0, 0, 10, 10);
    ellipse(-ancho / 3, v0, 10, 10);
    ellipse(-ancho / 3, v1, 10, 10);
    ellipse(0, altura/2, 10, 10);  line(0, 0, +ancho / 3, v0);
    line(-ancho / 3, v1, 0, altura/2);
  */

  noStroke();
  fill(col, op);
  beginShape();
  vertex(0, 0);
  bezier(0, 0, -ancho / 3, v0, -ancho / 3, v1, 0, altura / 2);
  bezier(0, 0, +ancho / 3, v0, +ancho / 3, v1, 0, altura / 2);
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
