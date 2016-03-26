// TODO Agregar comunicacion pormedio de osc para que  reciba datos externos,
// que generen orquideas automáticamente
import generativedesign.*;
import processing.opengl.*;
import controlP5.*;
ControlP5 cp5;
Slider abc;

color[] orquidea0 ={
    #D9B5D8,//Tono Claro
    #732B66,//Tono Medio
    #622615,//Tono Medio-oscuro
    #3D1407,//Tono Oscuro
    #956C00//Contrate
};
color[] orquidea1 ={
    #D2D2D2,//Tono Claro
    #849A4A,//Tono Medio
    #6B822B,//Tono Medio-oscuro
    #72152A,//Tono Oscuro
    #993153//Contrate
};
color[] orquidea2 ={
    #9DC7F1,//Tono Claro
    #596DD8,//Tono Medio
    #2B24A7,//Tono Medio-oscuro
    #54333C,//Tono Oscuro
    #A09806//Contrate
};
color[] orquidea3 ={
    #DAE8A5,//Tono Claro
    #A19BA7,//Tono Medio
    #8D6371,//Tono Medio-oscuro
    #712E47,//Tono Oscuro
    #cd75bd//Contrate
};
color[] orquidea4 ={
    #E8DAD9,//Tono Claro
    #E9DE72,//Tono Medio
    #DC9C57,//Tono Medio-oscuro
    #E25951,//Tono Oscuro
    #88269D//Contrate
};
color[] orquidea5 ={
    #DAC6D2,//Tono Claro
    #A6768F,//Tono Medio
    #371B1A,//Tono Medio-oscuro
    #2E1115,//Tono Osscuro
    #915A06//Contraste
};
color[] orquidea6 ={
    #FFDDA5,//Tono Claro
    #A0A19C,//Tono Medio
    #F56861,//Tono Medio-oscuro
    #8B654E,//Tono Osscuro
    #9F0406//Contraste
};
color[] orquidea7 ={
    #F4D371,//Tono Claro
    #D78D49,//Tono Medio
    #A5902C,//Tono Medio-oscuro
    #6D8D00,//Tono Osscuro
    #A5361D//Contraste
};
color[] orquidea8 ={
    #F0CA51,//Tono Medio
    #C189A2,//Tono Medio-oscuro
    #732146,//Tono Osscuro
    #5A3D15,
    #8B010C//Contraste
};
color[] orquidea9 ={
    #D4CAC8,//Tono Claro
    #DBD093,//Tono Medio
    #D3B241,//Tono Medio-oscuro
    #8C2032,//Tono Osscuro
    #C07270//Contraste
};
color[] pallette = orquidea7;


float v0, v1, v2, v3, altoS, anchoS, altoS1, anchoS1,altoS2, anchoS2, altoS3, anchoS3;
int opac, opac1, opac2,opac3;


void setup(){
  size(900, 700);
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
void ancho(float a) { anchoS = a; }
void alto(float a) { altoS = a; }
void opacidad(int op) { opac = op; }
void ancho1(float a) { anchoS1 = a; }
void alto1(float a) { altoS1 = a; }
void opacidad1(int op) { opac1 = op; }
void ancho2(int a) { anchoS2 = a; }
void alto2(int a) { altoS2 = a; }
void opacidad2(int op) { opac2 = op; }
void ancho3(int a) { anchoS3 = a; }
void alto3(int a) { altoS3 = a; }
void opacidad3(int op) { opac3 = op; }

/*/////////////////////////////
Comienza el proceso de dibujo
*/ /////////////////////////////
void draw() {
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

void dibujarPetalo0(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, color col) {

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

void dibujarPetalo1(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, color col) {
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

void dibujarPetalo2(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, color col) {
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

void dibujarPetalo3(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, color col) {
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

void dibujarPetalo4(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, color col) {
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

void dibujarPetalo5(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, color col) {
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
