import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;
import java.util.Iterator;


class Orquidea{
  int colorDatosE; // Dato entero del color
  String colorDatosH; // DAto en String con version Hex del color
  PGraphics lienzo;
  PFont courier;
  int[] pallette;
  int[] paleta; // Aqui se almacena la paleta generada
  float vhor0, vvert0, vvert1, vhor1, altoSBase, anchoSBase, altoP0, anchoP0, altoP1, anchoP1, altoM0,
    anchoM0;
  int numerodefiguras;

  Orquidea(int numFig, float vhor0_, float vvert0_,float vhor1_, float vvert1_,float altoSBase_, float anchoSBase_, float altoP0_, float anchoP0_, float altoP1_, float anchoP1_, float altoM0_,
    float anchoM0_,  int numerodefiguras_){

  }

  void dibujarBase(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, color col, float z) {
    //float ra = random(10) * randomGaussian();
    dibujarPetalo0(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*1.8, col, z );
    dibujarPetalo1(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*1.8, col, z );
    dibujarPetalo3(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*2, col, z);
    dibujarPetalo4(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*2, col, z);
    dibujarPetalo5(vhor0, vvert0, vvert1, vhor1, ancho*.5, altura* .8, op *1.5, col, z );
  }
  void dibujarPetalo0(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, color col, float z) {

    int xC = 0;
    int yC = 0;
    // println("Ancho:", ancho, "Altura:", altura);
    pushMatrix();
    translate(xC, yC, z);
    fill(col, op / 5);
    //strokeWeight(.5);
    //stroke(paleta[3], op);
    //stroke(#ffffff);
    noStroke();
    beginShape();
    vertex(0, 0);
    bezierVertex(vhor0, 0, -ancho, vvert0, -ancho, altura);
    bezierVertex(vhor1, altura, 0, vvert1, 0, 0);
    endShape();
    popMatrix();
  }

  void dibujarPetalo1(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, color col, float z) {
    int xC = 0;
    int yC = 0;
    pushMatrix();
    translate(xC, yC, z);
    rotateX(random(0.1,0.4));
    fill(col, op / 5);
    //strokeWeight(.5);
    //stroke(paleta[3], op);
    //stroke(#ffffff);
    noStroke();
    beginShape();
    vertex(0, 0);
    bezierVertex(vhor0, 0, ancho, vvert0, ancho, altura);
    bezierVertex(vhor1, altura, 0, vvert1, 0, 0);
    endShape();
    popMatrix();
  }

  void dibujarPetalo2(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, color col, float z) {
    pushMatrix();
    translate(0, 0, z);
    fill(col, op / 3);
    //strokeWeight(.5);
    //stroke(paleta[3], op);
    //stroke(#ffffff);
    noStroke();
    bezier(0, 0, -ancho / 2, vhor0, -ancho / 2, vvert0, 0, -altura);
    bezier(0, 0, +ancho / 2, vhor0, +ancho / 2, vvert0, 0, -altura);
    popMatrix();
  }

  void dibujarPetalo3(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, color col, float z) {
    int xC = 0;
    int yC = 0;
    // println("Ancho:", ancho, "Altura:", altura, "Centro x:", xC, "Centro y:",
    // yC);
    pushMatrix();
    translate(xC, yC, z);
    fill(col, op / 5);
    strokeWeight(.5);
    //stroke(paleta[3], op);
    //stroke(#ffffff);
    noStroke();
    beginShape();
    vertex(0, 0);
    bezierVertex(vhor0, 0, -ancho, vvert0, -ancho, -altura);
    bezierVertex(vhor1, -altura, 0, vvert1, 0, 0);
    endShape();
    // println(xC, yC);
    popMatrix();
  }

  void dibujarPetalo4(float vhor0, float vvert0, float vvert1, float vhor1, float ancho,
    float altura, float op, color col, float z) {
    int xC = 0;
    int yC = 0;
    pushMatrix();
    translate(xC, yC, z);
    fill(col, op / 5);
    //strokeWeight(.5);
    //stroke(paleta[3], op);
    //stroke(#ffffff);
    noStroke();
    beginShape();
    vertex(0, 0);
    bezierVertex(vhor0, 0, ancho, vvert0, ancho, -altura);
    bezierVertex(vhor1, -altura, 0, vvert1, 0, 0);
    endShape();
    popMatrix();
  }

  void dibujarPetalo5(float vhor0, float vvert0, float vvert1, float vhor1, float ancho,
    float altura, float op, color col, float z) {
    int xC = 0;
    int yC = 0;
    pushMatrix();
    translate(xC, yC, z);
    fill(col, op / 3);
    //strokeWeight(.5);
    //stroke(paleta[3], op);
    //stroke(#ffffff);
    noStroke();
    beginShape();
    vertex(0, 0);
    bezier(0, 0, -ancho / 2, vhor0, -ancho / 2, -altura + vvert0, 0, -altura);
    bezier(0, 0, ancho / 2, vhor0, ancho / 2, -altura + vvert0, 0, -altura);
    endShape();
    popMatrix();
  }

  void dibujarPetalo6(float vhor0, float vvert0, float vvert1, float vhor1, float ancho,
    float altura, float op, color col, float z) {
    int xC = 0;
    int yC = 0;
    pushMatrix();
    translate(xC, yC, z);
    fill(col, op / 3);
    //strokeWeight(.5);
    //stroke(paleta[3], op);
    //stroke(#ffffff);
    noStroke();
    beginShape();
    vertex(0, 0);
    bezier(0, 0, -ancho / 3, vhor0, -ancho / 3, vvert0, 0, altura / 2);
    bezier(0, 0, +ancho / 3, vhor0, +ancho / 3, vvert0, 0, altura / 2);
    endShape();
    popMatrix();
  }

  void dibujarMota(float rN_, float r_, float z_ ) {
    float randN = rN_;
    float r1_ = random(1,5);
    float r0_ = random(6,10);

    float randD = random(r1_, r0_);
    float radius = r_;
    float radiusNoise, x, y ;
    for (float ang = 0; ang <= 360; ang += random(20,50)) {
      radiusNoise =  randomGaussian()*randN;
      float thisRadius = radius + (noise(radiusNoise) * 100);
      x =  (thisRadius/3 * cos(radians(ang)));
      y =  (thisRadius/3 * sin(radians(ang)));
      noStroke();
      fill(paleta[5], 77);
      ellipse(x, y ,randD, randD);
    }
  }

}
