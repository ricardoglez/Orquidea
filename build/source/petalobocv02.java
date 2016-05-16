import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import toxi.color.*; 
import toxi.color.theory.*; 
import toxi.util.datatypes.*; 
import java.util.Iterator; 
import toxi.color.*; 
import toxi.color.theory.*; 
import toxi.util.datatypes.*; 
import java.util.Iterator; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class petalobocv02 extends PApplet {








paletaGen palG;
ControlP5 cp5;
Slider abc;
int colorDatosE; // Dato entero del color
String colorDatosH; // DAto en String con version Hex del color

PGraphics lienzo;
PFont courier;
int[] pallette;
int[] paleta;

float vhor0, vvert0, vvert1, vhor1, altoSBase, anchoSBase, altoP0, anchoP0, altoP1, anchoP1, altoM0,
  anchoM0;
int r1, r2, opac, opac1, opac2, opac3;

/*/ ///////////////////////////////////////////////////
 Setup
 */////////////////////////////////////////////////////

public void setup() {
  
  cp5 = new ControlP5(this);
  // Recibe los datos
  courier = loadFont("CourierNewPSMT-48.vlw");
  palG = new paletaGen();
  /*/ //////////////////////////////////
   Seleccionar paleta de color
   */  ///////////////////////////////////
  //seleccionarPaleta(round(random(0, 9)));
  r1 = round(random(0, 1));
  r2 = round(random(1, 2));
  //println("Orquidea", , "PrimerospetalosColor", r1, "SegundospetalosColor",r2);
  /*/ /////////////////////////////////////////
   Settings de Sliders
   */  //////////////////////////////////////////

  cp5.addTextfield("input")
    .setPosition(20, 700)
    .setSize(200, 40)
    .setFont(courier)
    .setFocus(true)
    .setColor(color(0, 255, 0))
    ;

  cp5.addSlider("anchoB").setPosition(20, 50).setWidth(250).setRange(0, 40);
  cp5.addSlider("altoB").setPosition(20, 70).setWidth(250).setRange(0, 40);

  cp5.addSlider("anchoP0").setPosition(20, 100).setWidth(250).setRange(-50, 50);
  cp5.addSlider("altoP0").setPosition(20, 120).setWidth(250).setRange(-80, 80);

  cp5.addSlider("anchoP1").setPosition(20, 150).setWidth(250).setRange(-80, 80);
  cp5.addSlider("altoP1").setPosition(20, 170).setWidth(250).setRange(-40, 40);

  cp5.addSlider("anchoM0").setPosition(20, 200).setWidth(250).setRange(-80, 80);
  cp5.addSlider("altoM0").setPosition(20, 220).setWidth(250).setRange(-30, 30);

  cp5.addSlider("vh0").setPosition( 20, 250).setWidth(150).setRange(-28, 28);
  cp5.addSlider("vvhor0").setPosition(20, 270).setWidth(150).setRange(-28, 28);
  cp5.addSlider("vvvert0").setPosition(20, 300).setWidth(150).setRange(-28, 28);
  cp5.addSlider("vh1").setPosition(20, 330).setWidth(150).setRange(-28, 28);
  textFont(courier);
  paleta = palG.createPal(hex(color(random(0, 255), random(0, 255), random(0, 255), random(50, 150))));
}
/*/ //////////////////////////////////////////////////////////////////
 Conectores de las variables de sliders a variables de la orquidea
 *////////////////////////////////////////////////////////////////////
public void anchoB(float a) {
  anchoSBase = a;
}
public void altoB(float a) {
  altoSBase = a;
}
public void anchoP0(float a) {
  anchoP0 = a;
}
public void altoP0(float a) {
  altoP0 = a;
}
public void anchoP1(int a) {
  anchoP1 = a;
}
public void altoP1(int a) {
  altoP1 = a;
}
public void anchoM(int a) {
  anchoM0 = a;
}
public void altM(int a) {
  altoM0 = a;
}
public void vhor0(int a) {
  vhor0 = a;
}
public void vvhor0(int a) {
  vvert0 = a;
}
public void vvvert0(int a) {
  vvert1 = a;
}
public void vh1(int a) {
  vhor1 = a;
}
public void input(String theText) {
  // automatically receives results from controller input
  paleta = palG.createPal(theText);
  println("color : #"+theText);
}


/*/ ////////////////////////////
 Comienza el proceso de dibujo
 *//////////////////////////////
public void draw() {
  background(255);
  pushMatrix();
  translate(width / 2, height / 2);
  //rotateX(map(mouseX, 0, width, 0,1));
  int numerodefiguras = 8;

  randomSeed(0);
  float rand = random(-3.2f, 6.2f);

  for (int i = 0; i <= numerodefiguras; i ++) {
    pushMatrix();
    scale(15);
    dibujarBase(vhor0, vvert0, vvert1, vhor1
      //,narizDatosE[3]*10.2,narizDatosE[2]*13.2,
      , anchoSBase-i*rand, altoSBase-i*rand,
      random(200, 220), paleta[0], -5
      );

    popMatrix();

  }

  for (int i = 0; i <= numerodefiguras*2; i++){
    dibujarMota(anchoM0/i, altoM0/i, 2);
  }

  dibujarPetalo5(vhor0, vvert0, vhor0, vvert0,
    (anchoP0*rand), (altoP0*rand),
    random(200, 220), paleta[4], 3
    );
  dibujarPetalo2(vhor0, vvert0, vhor0, vvert0,
    (anchoP0*rand), (altoP1*rand),
    random(200, 220), paleta[3], 1
    );
  popMatrix();
  palG.dibujarPaletaF();
}

// TODO TAmbien crear una clase de Oquridea en la cual sea mas sencillo dibujar
// la flor desde una linea

public void dibujarBase(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, int col, float z) {
  //float ra = random(10) * randomGaussian();

  dibujarPetalo0(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*1.8f, col, z );
  dibujarPetalo1(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*1.8f, col, z );
  dibujarPetalo3(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*2, col, z);
  dibujarPetalo4(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*2, col, z);
  dibujarPetalo5(vhor0, vvert0, vvert1, vhor1, ancho*.5f, altura* .8f, op *1.5f, col, z );
}

public void dibujarPetalo0(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, int col, float z) {

  int xC = 0;
  int yC = 0;
  // println("Ancho:", ancho, "Altura:", altura);
  pushMatrix();
  translate(xC, yC, z);
    rotateX(random(0.1f,0.4f));
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

public void dibujarPetalo1(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, int col, float z) {
  int xC = 0;
  int yC = 0;
  pushMatrix();
  translate(xC, yC, z);
  rotateX(random(0.1f,0.4f));
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

public void dibujarPetalo2(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, int col, float z) {
  pushMatrix();
  translate(0, 0, z);
  rotateX(random(0.1f,0.4f));
  fill(col, op / 3);
  //strokeWeight(.5);
  //stroke(paleta[3], op);
  //stroke(#ffffff);
  noStroke();
  bezier(0, 0, -ancho / 2, vhor0, -ancho / 2, vvert0, 0, -altura);
  bezier(0, 0, +ancho / 2, vhor0, +ancho / 2, vvert0, 0, -altura);
  popMatrix();
}

public void dibujarPetalo3(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, int col, float z) {
  int xC = 0;
  int yC = 0;
  // println("Ancho:", ancho, "Altura:", altura, "Centro x:", xC, "Centro y:",
  // yC);
  pushMatrix();
  translate(xC, yC, z);
  rotateX(random(0.1f,0.4f));
  fill(col, op / 5);
  strokeWeight(.5f);
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

public void dibujarPetalo4(float vhor0, float vvert0, float vvert1, float vhor1, float ancho,
  float altura, float op, int col, float z) {
  int xC = 0;
  int yC = 0;
  pushMatrix();
  translate(xC, yC, z);
  rotateX(random(0.1f,0.4f));
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

public void dibujarPetalo5(float vhor0, float vvert0, float vvert1, float vhor1, float ancho,
  float altura, float op, int col, float z) {
  int xC = 0;
  int yC = 0;
  pushMatrix();
  translate(xC, yC, z);
  rotateX(random(0.1f,0.4f));
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

public void dibujarPetalo6(float vhor0, float vvert0, float vvert1, float vhor1, float ancho,
  float altura, float op, int col, float z) {
  int xC = 0;
  int yC = 0;
  pushMatrix();

  translate(xC, yC, z);
  rotateX(random(0.1f,0.4f));
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

public void dibujarMota(float rN_, float r_, float z_ ) {
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

public void keyPressed() {
  if (key == 's') {
    saveFrame("normal.png");
    //  saveHiRes(5);
    exit();
  }
}
/*/ /////////////////////////////////////////////////////
 Funcion que guarda muestra del rostro del interactor
 * ///////////////////////////////////////////////////////
/*void saveHiRes(int scaleFactor) {
 PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, OPENGL);

 hires.scale(scaleFactor);
 hires.beginDraw();
 copy();
 hires.endDraw();

 hires.save("hires.png");
 }*/






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

  public void dibujarBase(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, int col, float z) {
    //float ra = random(10) * randomGaussian();
    dibujarPetalo0(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*1.8f, col, z );
    dibujarPetalo1(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*1.8f, col, z );
    dibujarPetalo3(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*2, col, z);
    dibujarPetalo4(vhor0, vvert0, vvert1, vhor1, ancho, altura, op*2, col, z);
    dibujarPetalo5(vhor0, vvert0, vvert1, vhor1, ancho*.5f, altura* .8f, op *1.5f, col, z );
  }
  public void dibujarPetalo0(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, int col, float z) {

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

  public void dibujarPetalo1(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, int col, float z) {
    int xC = 0;
    int yC = 0;
    pushMatrix();
    translate(xC, yC, z);
    rotateX(random(0.1f,0.4f));
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

  public void dibujarPetalo2(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, int col, float z) {
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

  public void dibujarPetalo3(float vhor0, float vvert0, float vvert1, float vhor1, float ancho, float altura, float op, int col, float z) {
    int xC = 0;
    int yC = 0;
    // println("Ancho:", ancho, "Altura:", altura, "Centro x:", xC, "Centro y:",
    // yC);
    pushMatrix();
    translate(xC, yC, z);
    fill(col, op / 5);
    strokeWeight(.5f);
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

  public void dibujarPetalo4(float vhor0, float vvert0, float vvert1, float vhor1, float ancho,
    float altura, float op, int col, float z) {
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

  public void dibujarPetalo5(float vhor0, float vvert0, float vvert1, float vhor1, float ancho,
    float altura, float op, int col, float z) {
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

  public void dibujarPetalo6(float vhor0, float vvert0, float vvert1, float vhor1, float ancho,
    float altura, float op, int col, float z) {
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

  public void dibujarMota(float rN_, float r_, float z_ ) {
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

class paletaGen {
TColor col;
ColorList tria;
ColorList anal;
ColorList comp;
ColorList lSplit;
int[] paletaCustom = new int[6];
float SWATCH_HEIGHT = 20;
float SWATCH_WIDTH = 0;
int SWATCH_GAP = 15;

int yoff = 85;
int rand;

paletaGen(){

}

public int[] createPal(String hex){
        col = TColor.newHex(hex);
        // Creacuion de las listas donde se guardan las paletas creadas
        tria = new ColorList();
        anal = new ColorList();
        comp = new ColorList();
        lSplit = new ColorList();
        //background(0);
        // ArrayList strategies = ColorTheoryRegistry.getRegisteredNames();
        // println(strategies);
        tria = ColorList.createUsingStrategy(
                ColorTheoryRegistry.getStrategyForName("TRIAD"), col);
        tria = tria.sortByProximityTo(col, false);
        //SWATCH_WIDTH = (width - 200) / tria.size();
        //swatches(tria, 100, 50);

        anal = ColorList.createUsingStrategy(
                ColorTheoryRegistry.getStrategyForName("ANALOGOUS"), col);
        anal = anal.sortByProximityTo(col, false);
        //SWATCH_WIDTH = (width - 200) / anal.size();
        //swatches(anal, 100, 100);

        comp = ColorList.createUsingStrategy(
                ColorTheoryRegistry.getStrategyForName("COMPOUND"), col);
        comp = comp.sortByProximityTo(col, false);
        //SWATCH_WIDTH = (width - 200) / comp.size();
        //swatches(comp, 100, 150);

        lSplit = ColorList.createUsingStrategy(
                ColorTheoryRegistry.getStrategyForName("SPLIT_COMPLEMENTARY"), col);
        lSplit = lSplit.sortByProximityTo(col, false);
        //SWATCH_WIDTH = (width - 200) / lSplit.size();
        //swatches(lSplit, 100, 200);
        // Convertir paleta a integers RGBA
        int[] colTria = tria.toARGBArray();
        int[] colAnal = anal.toARGBArray();
        int[] colComp = comp.toARGBArray();
        int[] colSplit = lSplit.toARGBArray();
        paletaCustom[0] = colComp[1];
        paletaCustom[1] = colAnal[1];
        paletaCustom[2] = colAnal[3];
        paletaCustom[3] = colAnal[4];
        paletaCustom[4] = colTria[2];
        paletaCustom[5] = colSplit[1];

        //println("#######");
        //println("####Paleta Nueva: ", hex);
        return paletaCustom;
}

public void dibujarPaletaF(){
        // Dibujar la paleta generada en relacion al color extraido
        fill(paletaCustom[0]);
        rect(10, height/2, 30, 80);
        fill(paletaCustom[1]);
        rect(40, height/2, 30, 80);
        fill(paletaCustom[2]);
        rect(70, height/2, 30, 80);
        fill(paletaCustom[3]);
        rect(100, height/2, 30, 80);
        fill(paletaCustom[4]);
        rect(130, height/2, 30, 80);
        fill(paletaCustom[5]);
        rect(160, height/2, 30, 80);

}

// Dibujar las paletas
public void swatch(TColor c, int x, int y) {
        fill(c.toARGB());
        rect(x, y, SWATCH_WIDTH, SWATCH_HEIGHT);
}
public void swatches(ColorList sorted, int x, int y) {
        noStroke();
        for (Iterator i = sorted.iterator(); i.hasNext(); ) {
                TColor c = (TColor)i.next();
                swatch(c, x, y);
                x += SWATCH_WIDTH + SWATCH_GAP;
        }
}
}
  public void settings() {  size(1200, 1000, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "petalobocv02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
