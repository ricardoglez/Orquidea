import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import generativedesign.*; 
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

// TODO Agregar comunicacion pormedio de osc para que  reciba datos externos,
// que generen orquideas autom\u00e1ticamente



ControlP5 cp5;
Slider abc;

int[] orquidea0 ={
    0xffD9B5D8,//Tono Claro
    0xff732B66,//Tono Medio
    0xff622615,//Tono Medio-oscuro
    0xff3D1407,//Tono Oscuro
    0xff956C00//Contrate
};
int[] orquidea1 ={
    0xffD2D2D2,//Tono Claro
    0xff849A4A,//Tono Medio
    0xff6B822B,//Tono Medio-oscuro
    0xff72152A,//Tono Oscuro
    0xff993153//Contrate
};
int[] orquidea2 ={
    0xff9DC7F1,//Tono Claro
    0xff596DD8,//Tono Medio
    0xff2B24A7,//Tono Medio-oscuro
    0xff54333C,//Tono Oscuro
    0xffA09806//Contrate
};
int[] orquidea3 ={
    0xffDAE8A5,//Tono Claro
    0xffA19BA7,//Tono Medio
    0xff8D6371,//Tono Medio-oscuro
    0xff712E47,//Tono Oscuro
    0xffcd75bd//Contrate
};
int[] orquidea4 ={
    0xffE8DAD9,//Tono Claro
    0xffE9DE72,//Tono Medio
    0xffDC9C57,//Tono Medio-oscuro
    0xffE25951,//Tono Oscuro
    0xff88269D//Contrate
};
int[] orquidea5 ={
    0xffDAC6D2,//Tono Claro
    0xffA6768F,//Tono Medio
    0xff371B1A,//Tono Medio-oscuro
    0xff2E1115,//Tono Osscuro
    0xff915A06//Contraste
};
int[] orquidea6 ={
    0xffFFDDA5,//Tono Claro
    0xffA0A19C,//Tono Medio
    0xffF56861,//Tono Medio-oscuro
    0xff8B654E,//Tono Osscuro
    0xff9F0406//Contraste
};
int[] orquidea7 ={
    0xffF4D371,//Tono Claro
    0xffD78D49,//Tono Medio
    0xffA5902C,//Tono Medio-oscuro
    0xff6D8D00,//Tono Osscuro
    0xffA5361D//Contraste
};
int[] orquidea8 ={
    0xffF0CA51,//Tono Medio
    0xffC189A2,//Tono Medio-oscuro
    0xff732146,//Tono Osscuro
    0xff5A3D15,
    0xff8B010C//Contraste
};
int[] orquidea9 ={
    0xffD4CAC8,//Tono Claro
    0xffDBD093,//Tono Medio
    0xffD3B241,//Tono Medio-oscuro
    0xff8C2032,//Tono Osscuro
    0xffC07270//Contraste
};
int[] pallette = orquidea7;


float v0, v1, v2, v3, altoS, anchoS, altoS1, anchoS1,altoS2, anchoS2, altoS3, anchoS3;
int opac, opac1, opac2,opac3;


public void setup(){
  
  cp5 = new ControlP5(this);

/*//////////////////////////////////////////
        Settings de Sliders
*///////////////////////////////////////////
    cp5.addSlider("ancho").setPosition(20, 50).setWidth(50).setRange(0,10);
    cp5.addSlider("alto").setPosition(20, 70).setWidth(50).setRange(0, 3);
    cp5.addSlider("opacidad").setPosition(20, 90).setWidth(50).setRange(0, 100);
    cp5.addSlider("ancho1").setPosition(120, 50).setWidth(50).setRange(0, 10);
    cp5.addSlider("alto1").setPosition(120, 70).setWidth(50).setRange(0, 3);
    cp5.addSlider("opacidad1").setPosition(120, 90).setWidth(50).setRange(0, 100);
    cp5.addSlider("ancho2").setPosition(20, 150).setWidth(50).setRange(0, 10);
    cp5.addSlider("alto2").setPosition(20, 170).setWidth(50).setRange(0, 3);
    cp5.addSlider("opacidad2").setPosition(20, 190).setWidth(50).setRange(0, 100);
    cp5.addSlider("ancho3").setPosition(120, 150).setWidth(50).setRange(0, 10);
    cp5.addSlider("alto3").setPosition(120, 170).setWidth(50).setRange(0, 3);
    cp5.addSlider("opacidad3").setPosition(120, 190).setWidth(50).setRange(0, 100);

}
/*///////////////////////////////////////////////////////////////////
Conectores de las variables de sliders a variables de la orquidea
*/ ///////////////////////////////////////////////////////////////////
public void ancho(float a) { anchoS = a; }
public void alto(float a) { altoS = a; }
public void opacidad(int op) { opac = op; }
public void ancho1(float a) { anchoS1 = a; }
public void alto1(float a) { altoS1 = a; }
public void opacidad1(int op) { opac1 = op; }
public void ancho2(int a) { anchoS2 = a; }
public void alto2(int a) { altoS2 = a; }
public void opacidad2(int op) { opac2 = op; }
public void ancho3(int a) { anchoS3 = a; }
public void alto3(int a) { altoS3 = a; }
public void opacidad3(int op) { opac3 = op; }

/*/////////////////////////////
Comienza el proceso de dibujo
*/ /////////////////////////////
public void draw() {
  // noLoop();
  background(0);
  pushMatrix();
  // scale(map(mouseX, 0, width, 0, 2));
  translate(width / 2, height / 2);
  //color color0 = color(cR, cG, cB);
  //color color1 = color(cR1, cG1, cB1);
  for (int i = 0; i <= 1000; i += 25) {
    // variable0,variable1,variable2,variable3,ancho,altura,aopacidad,color
    dibujarPetalo0(anchoS, altoS, anchoS, altoS, i * PI / anchoS / 8,altoS / 8 * i, opac, pallette[0]);
    dibujarPetalo1(anchoS, altoS, anchoS, altoS, i * PI / anchoS / 8,altoS / 8 * i, opac, pallette[0]);
    dibujarPetalo2(anchoS2, altoS2, anchoS2, altoS2, i * PI / anchoS2 / 8,altoS2 / 8 * i, opac2, pallette[3]);
    dibujarPetalo3(anchoS1, altoS1, anchoS1, altoS1, i * PI / anchoS1 / 8,altoS1 / 8 * i, opac1, pallette[2]);
    dibujarPetalo4(anchoS1, altoS1, anchoS1, altoS1, i * PI / anchoS1 / 8,altoS1 / 8 * i, opac1, pallette[2]);
    dibujarPetalo5(anchoS3, altoS3, anchoS3, altoS3, i * PI / anchoS3 / 8,altoS3 / 8 * i, opac3 , pallette[4]);
  }

    //fill(color(orquidea0[0]));

    //rect(0,0,100,100);
  popMatrix();

}


// TODO TAmbien crear una clase de Oquridea en la cual sea mas sencillo dibujar
// la flor desde una linea

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
  // TODO Como saber el angulo de la apertura de la hoja de la flor
  float[] resultados = GenerativeDesign.cartesianToPolar(v0, width / 2);
  println("longitud: ", resultados[0]);
  println("angulo: ", +degrees(resultados[1]));
  println();

  noStroke();
  fill(col, op);
  beginShape();
  vertex(0, 0);
  bezierVertex(v0, 0, -ancho, v1, -ancho, altura);
  bezierVertex(v3, altura, 0, v2, 0, 0);
  endShape();
//TODO Crear el efecto de moteado solo dentro de la hoja dibujada
/*
  float radius = 2;
  float radiusNoise = random(randomGaussian() * 10);
float x, y;
  for (float ang = 45; ang <= 90; ang += 1) {
    radiusNoise = randomGaussian();
    float thisRadius = radius + (noise(radiusNoise) * 550) - 100;
    float rad = radians(ang);

    x = 0 + (thisRadius * cos(rad));
    y = 0 + (thisRadius * sin(rad));
    fill(#ff0000);
    ellipse(x, y, 4, 4);

//    x = width / 2 + (thisRadius * cos(rad));
//    y = height / 2 + (thisRadius * sin(rad));

    // ellipse(width/2, height/2, radius,radius);

    // stroke(#ffffff);
    // strokeWeight(.2);
    // line(x,y,lastx,lasty);

    //    lastx = x;
    //    lasty = y;
  }

  // println(xC, yC);
  */
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
  // println("Ancho:", ancho, "Altura:", altura, "Centro x:", xC, "Centro y:",
  // yC);
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
