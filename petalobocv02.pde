/*import controlP5.*;
import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;
import java.util.Iterator;


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

void setup() {
  size(1200, 1000, P3D);
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
void anchoB(float a) {
  anchoSBase = a;
}
void altoB(float a) {
  altoSBase = a;
}
void anchoP0(float a) {
  anchoP0 = a;
}
void altoP0(float a) {
  altoP0 = a;
}
void anchoP1(int a) {
  anchoP1 = a;
}
void altoP1(int a) {
  altoP1 = a;
}
void anchoM(int a) {
  anchoM0 = a;
}
void altM(int a) {
  altoM0 = a;
}
void vhor0(int a) {
  vhor0 = a;
}
void vvhor0(int a) {
  vvert0 = a;
}
void vvvert0(int a) {
  vvert1 = a;
}
void vh1(int a) {
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
void draw() {
  background(255);
  pushMatrix();
  translate(width / 2, height / 2);
  //rotateX(map(mouseX, 0, width, 0,1));
  int numerodefiguras = 8;

  randomSeed(0);
  float rand = random(-3.2, 6.2);

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
    rotateX(random(0.1,0.4));
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
  rotateX(random(0.1,0.4));
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
  rotateX(random(0.1,0.4));
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
  rotateX(random(0.1,0.4));
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
  rotateX(random(0.1,0.4));
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
  rotateX(random(0.1,0.4));
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

void keyPressed() {
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
 */