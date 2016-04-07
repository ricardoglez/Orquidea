import generativedesign.*;
import processing.opengl.*;
import controlP5.*;
import oscP5.*;
import netP5.*;

import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;
import java.util.Iterator;

OscP5 oscp5;
NetAddress dir;

paletaGen palG;

ControlP5 cp5;
Slider abc;

// Arreglos de los datos que enviara el sketch de deteccion de rostro
int[] caraDatosE = new int[4];  // Orden de Valores de matriz//x, y ,w, h //
int[] ojosDatosE = new int[4];  // x0, y0 ,w0, h0, //x1, y1 ,w1, h1//
int[] bocaDatosE = new int[4];  // x, y ,w, h//
int[] narizDatosE = new int[4]; // x, y ,w, h//
int colorDatosE; // Dato entero del color
String colorDatosH; // DAto en String con version Hex del color

int[] pallette;

int[] paleta;

float v0, v1, v2, v3, altoS, anchoS, altoS1, anchoS1, altoS2, anchoS2, altoS3,
      anchoS3;
int r1, r2, opac, opac1, opac2, opac3;

/*/ ///////////////////////////////////////////////////
Setup
*/ ////////////////////////////////////////////////////

void setup() {
        size(1200, 1000, OPENGL);
        cp5 = new ControlP5(this);
        // Recibe los datos
        oscp5 = new OscP5(this, 12000);
        // Envia los datos
        dir = new NetAddress("127.0.1.1", 12000);
        palG = new paletaGen();
        /*/ //////////////////////////////////
        Seleccionar paleta de color
        */ ///////////////////////////////////
           //seleccionarPaleta(round(random(0, 9)));
        r1 = round(random(0, 1));
        r2 = round(random(1, 2));
        //println("Orquidea", , "PrimerospetalosColor", r1, "SegundospetalosColor",r2);
/*/ /////////////////////////////////////////
        Settings de Sliders
        */ //////////////////////////////////////////
           /*cp5.addSlider("ancho").setPosition(20, 50).setWidth(50).setRange(0, 50);
              cp5.addSlider("alto").setPosition(20, 70).setWidth(50).setRange(0, 30);
              cp5.addSlider("ancho1").setPosition(120, 50).setWidth(50).setRange(0, 50);
              cp5.addSlider("alto1").setPosition(120, 70).setWidth(50).setRange(0, 30);
              cp5.addSlider("ancho2").setPosition(20, 150).setWidth(50).setRange(0, 50);
              cp5.addSlider("alto2").setPosition(20, 170).setWidth(50).setRange(0, 30);
              cp5.addSlider("ancho3").setPosition(120, 150).setWidth(50).setRange(0, 50);
              cp5.addSlider("alto3").setPosition(120, 170).setWidth(50).setRange(0, 30);
            */
}
/*/ //////////////////////////////////////////////////////////////////
Conectores de las variables de sliders a variables de la orquidea
*/ ///////////////////////////////////////////////////////////////////

/*void ancho(float a) { anchoS = a; }
   void alto(float a) { altoS = a; }
   void ancho1(float a) { anchoS1 = a; }
   void alto1(float a) { altoS1 = a; }
   void ancho2(int a) { anchoS2 = a; }
   void alto2(int a) { altoS2 = a; }
   void ancho3(int a) { anchoS3 = a; }
   void alto3(int a) { altoS3 = a; }
 */
/*/ ///////////////////////////////
Metodo de seleccion de paleta
*/ ////////////////////////////////
/*void seleccionarPaleta(int rand) {
   switch (rand) {
   case 0:
    pallette = orquidea0;
    break;
   case 1:
    pallette = orquidea1;
    break;
   case 2:
    pallette = orquidea2;
    break;
   case 3:
    pallette = orquidea3;
    break;
   case 4:
    pallette = orquidea4;
    break;
   case 5:
    pallette = orquidea5;
    break;
   case 6:
    pallette = orquidea6;
    break;
   case 7:
    pallette = orquidea7;
    break;
   case 8:
    pallette = orquidea8;
    break;
   case 9:
    pallette = orquidea9;
    break;
   }
   }



   /*
   Seleccionar Modelo de la flor
 */

void selecModelo(){
        //Variables por las que se selecciona el tipo de modificaciones de la flor
        float distanciaCaraOjos =dist(caraDatosE[0],caraDatosE[1],ojosDatosE[0], ojosDatosE[1]);
        println("####disctCaraOjos(cruda):",distanciaCaraOjos);
        float val2 = map(distanciaCaraOjos,0, 150, 0, 10);
        println("####disctCaraOjos(mapeada):",val2);
        val2 = constrain(val2, 0,1);
        println("####disctCaraOjos(constiñida):",val2);


        // la distancia delos ojos a la boca
        float distanciaOjosBoca =dist(ojosDatosE[0],ojosDatosE[1],bocaDatosE[0], bocaDatosE[1]);
        println("####disctCaraOjos(mapeada):",distanciaOjosBoca);
        float val1 = map(distanciaOjosBoca,0, 150, 0, 10);
        println("####disctOjosBoca(mapeada):",val2);
        val1 = constrain(val1, 0, 1);
        println("####disctOjosBoca(constriñida):",val1);


}


/*/ ////////////////////////////
Comienza el proceso de dibujo
*/ /////////////////////////////
void draw() {
// noLoop();
// background(#f9eaa4);
background(0);
pushMatrix();
translate(width / 2, height / 2);
paleta = palG.createPal(colorDatosH);
//println(colorDatosH);
//Si hay datos en el color H Generar la paleta en base a estos
//println("##Info recibida y procesada");
//println("###Generar Paleta###");
//println(palG.createPal(colorDatosH))
//palG.dibujarPaletaF();
//println(colorDatosH);
//println("###Paleta : #",paleta[0]);

        int numerodefiguras = 20;
        int intervalo = 8;
        //println("var",particularVar);
        //La distancia del pinto inicial de la cabeza hasta el punto inicial de los ojos
        float distanciaCaraOjos =dist(caraDatosE[0],caraDatosE[1],ojosDatosE[0], ojosDatosE[1]);
        float val2 = map(distanciaCaraOjos,50, 100, -15, -5)*10;
        println("####disctCaraOjos(mapeada):",val2);
        //val2 = constrain(val2, -5,-12);
        //println("####disctCaraOjos(constiñida):",val2);
// la distancia delos ojos a la boca
        float distanciaOjosBoca =dist(ojosDatosE[0],ojosDatosE[1],bocaDatosE[0], bocaDatosE[1]);
        float val1 = map(distanciaOjosBoca,60, 100, 5, 15)*10;
        println("####disctOjosBoca(mapeada):",val1);
        selecModelo();
        randomSeed(0);
        float rand = random(-10,10);
        float particularVar = noise(rand);
        //val1 = constrain(val1, 5, 12);
        //println("####disctOjosBoca(constriñida):",val1);
        /*float distanciaCaraOjos =dist(caraDatosE[0],caraDatosE[1],ojosDatosE[0], ojosDatosE[1]);
           float val2 = map(distanciaCaraOjos,0, 150, 0, 10);
           println("####disctCaraOjos(mapeada):",val2);
           val2 = constrain(val2, 0,1);
           println("####disctCaraOjos(constiñida):",val2);

           // la distancia delos ojos a la boca
           float distanciaOjosBoca =dist(ojosDatosE[0],ojosDatosE[1],bocaDatosE[0], bocaDatosE[1]);
           float val1 = map(distanciaOjosBoca,0, 150, 0, 10);
           println("####disctOjosBoca(mapeada):",val1);
           val1 = constrain(val1, 0, 1);
           println("####disctOjosBoca(constriñida):",val1);
         */
        for (int i = 0; i <= numerodefiguras; i += intervalo) {
                /*/ /////////////////////////////////////////////////////////////////////////////////////////
                La base principal de la orquidea esta mapeada a los valores de la cara EJ.cara.width == base.width
                * ///////////////////////////////////////////////////////////////////////////////////////////
                  //TODO Generar un redes neuronales de 4 inputs que genere las coombinaciones

                /*
                   dibujarBase(val1 , caraDatosE[2]*particularVar, caraDatosE[2]*particularVar, val2,
                          ,narizDatosE[3]*10.2,narizDatosE[2]*13.2,
                          //,caraDatosE[2]*8.2,caraDatosE[2]*8.2,
                          random(110,120),paleta[0],-20
                          );
                   dibujarBase(caraDatosE[2]*particularVar,val1, caraDatosE[2]*particularVar, val2,
                          ,narizDatosE[3]*10.2,narizDatosE[2]*13.2,
                          //,caraDatosE[2]*8.2,caraDatosE[2]*8.2,
                          random(110,120),paleta[0],-20
                          );
                   dibujarBase(caraDatosE[2]*particularVar,val1, val2, caraDatosE[2]*particularVar
                          ,narizDatosE[3]*10.2,narizDatosE[2]*13.2,
                          //,caraDatosE[2]*8.2,caraDatosE[2]*8.2,
                          random(110,120),paleta[0],-20
                          );*/
  pushMatrix();
  scale(2);
                dibujarBase(caraDatosE[2]*particularVar,val1, val2, caraDatosE[2]*particularVar
                            //,narizDatosE[3]*10.2,narizDatosE[2]*13.2,
                            ,caraDatosE[2]*5.5,caraDatosE[2]*7.5,
                            random(110,120),paleta[0],-50
                            );
                dibujarPetalo2(ojosDatosE[2], ojosDatosE[2], ojosDatosE[2],ojosDatosE[2],
                               (ojosDatosE[2]*7.2), (ojosDatosE[3]*5.2),
                               random(80,90), paleta[3], 10
                               );


                dibujarPetalo5(narizDatosE[2], narizDatosE[2], narizDatosE[2],narizDatosE[2],
                               (narizDatosE[2]*4.4), (narizDatosE[3]*6.9),
                               random(90,100), paleta[5], 20
                               );
                dibujarPetalo6(narizDatosE[2], narizDatosE[2], narizDatosE[2],narizDatosE[2],
                               (narizDatosE[2]*3.6), (narizDatosE[3]*4.8),
                               random(90,100), paleta[3], 20
                               );
popMatrix();
                // (float v0, float v1, float v2, float v3, float ancho,float altura, float op, color col, float z)
                //dibujarBase(caraDatosE[2]*particularVar, caraDatosE[2]*particularVar,caraDatosE[2]*particularVar,caraDatosE[2]*particularVar,
                /*caraDatosE[2]*i/intervalo,caraDatosE[2]*i/intervalo,
                   random(70,100) , paleta[0],-10);

                   dibujarBase(caraDatosE[2]/5, map(caraDatosE[2], 120,264, 0,10), caraDatosE[2] / 5, caraDatosE[3] / 2,
                   caraDatosE[2]*i/intervalo-30,caraDatosE[2]*i/intervalo-30,
                   random(20,30), paleta[r2], -5);

                   dibujarPetalo2(ojosDatosE[2], ojosDatosE[2], ojosDatosE[2], ojosDatosE[2],
                   ojosDatosE[2] * noise(500 * ojosDatosE[2] * 10),ojosDatosE[2] * noise(i * ojosDatosE[3] * 10),
                   random(70,100), paleta[3], 2);
                   dibujarPetalo6(narizDatosE[3], narizDatosE[3], narizDatosE[3],narizDatosE[3],
                   10 * narizDatosE[3] * noise(500 * narizDatosE[3] * i),12 * narizDatosE[3] * noise(i * narizDatosE[3] * 10),
                   random(70,90), paleta[4], 2);
                 */
        }
        popMatrix();

        pushMatrix();
        translate(50, 0,0);
        palG.dibujarPaletaF();
        popMatrix();
  pushMatrix();
    translate(width/2,height/2+10);
    rotateX(90);
    dibujarBase(caraDatosE[2]*particularVar,val1, val2,caraDatosE[2]*particularVar
              ,(narizDatosE[3]*4.2),(narizDatosE[2]*6.2),
              //,caraDatosE[2]*8.2,caraDatosE[2]*8.2,
              random(110,120),paleta[2],-20
              );
  popMatrix();

}

// TODO TAmbien crear una clase de Oquridea en la cual sea mas sencillo dibujar
// la flor desde una linea

void dibujarBase(float v0, float v1, float v2, float v3, float ancho,float altura, float op, color col, float z) {
        //float ra = random(10) * randomGaussian();
        dibujarPetalo0(v0, v1, v2, v3, ancho, altura, op*.8, col, z - 2);
        dibujarPetalo1(v0, v1, v2, v3, ancho, altura, op*.8, col, z - 2);
        dibujarPetalo3(v0, v1, v2, v3, ancho, altura, op, col, z);
        dibujarPetalo4(v0, v1, v2, v3, ancho, altura, op, col, z);
        dibujarPetalo5(v0, v1, v2, v3, ancho*.5, altura* .8, op *1.5, col, z + 2);
}

void dibujarPetalo0(float v0, float v1, float v2, float v3, float ancho,float altura, float op, color col, float z) {

        int xC = 0;
        int yC = 0;
        // println("Ancho:", ancho, "Altura:", altura);
        pushMatrix();
        translate(xC, yC, z);
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
        // float[] resultados = GenerativeDesign.cartesianToPolar(v0, width / 2);
        // println("longitud: ", resultados[0]);
        // println("angulo: ", +degrees(resultados[1]));
        // println();

        fill(col, op / 5);
        //strokeWeight(.5);
        //stroke(paleta[3], op);
        //stroke(#ffffff);
        noStroke();
        beginShape();
        vertex(0, 0);
        bezierVertex(v0, 0, -ancho, v1, -ancho, altura);
        bezierVertex(v3, altura, 0, v2, 0, 0);
        endShape();

        // TODO Crear el efecto de moteado solo dentro de la hoja dibujada
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

void dibujarPetalo1(float v0, float v1, float v2, float v3, float ancho,float altura, float op, color col, float z) {
        int xC = 0;
        int yC = 0;
        pushMatrix();
        translate(xC, yC, z);
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
        fill(col, op / 5);
        //strokeWeight(.5);
        //stroke(paleta[3], op);
        //stroke(#ffffff);
        noStroke();
        beginShape();
        vertex(0, 0);
        bezierVertex(v0, 0, ancho, v1, ancho, altura);
        bezierVertex(v3, altura, 0, v2, 0, 0);
        endShape();
        popMatrix();
}

void dibujarPetalo2(float v0, float v1, float v2, float v3, float ancho,float altura, float op, color col, float z) {
        pushMatrix();
        translate(0, 0, z);
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
        fill(col, op / 3);
        //strokeWeight(.5);
        //stroke(paleta[3], op);
        //stroke(#ffffff);
        noStroke();
        bezier(0, 0, -ancho / 2, v0, -ancho / 2, v1, 0, -altura);
        bezier(0, 0, +ancho / 2, v0, +ancho / 2, v1, 0, -altura);
        popMatrix();
}

void dibujarPetalo3(float v0, float v1, float v2, float v3, float ancho,float altura, float op, color col, float z) {
        int xC = 0;
        int yC = 0;
        // println("Ancho:", ancho, "Altura:", altura, "Centro x:", xC, "Centro y:",
        // yC);
        pushMatrix();
        translate(xC, yC, z);
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
        fill(col, op / 5);
        strokeWeight(.5);
        //stroke(paleta[3], op);
        //stroke(#ffffff);
        noStroke();
        beginShape();
        vertex(0, 0);
        bezierVertex(v0, 0, -ancho, v1, -ancho, -altura);
        bezierVertex(v3, -altura, 0, v2, 0, 0);
        endShape();
        // println(xC, yC);
        popMatrix();
}

void dibujarPetalo4(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, color col, float z) {
        int xC = 0;
        int yC = 0;
        pushMatrix();
        translate(xC, yC, z);
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
        fill(col, op / 5);
        //strokeWeight(.5);
        //stroke(paleta[3], op);
        //stroke(#ffffff);
        noStroke();
        beginShape();
        vertex(0, 0);
        bezierVertex(v0, 0, ancho, v1, ancho, -altura);
        bezierVertex(v3, -altura, 0, v2, 0, 0);
        endShape();
        popMatrix();
}

void dibujarPetalo5(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, color col, float z) {
        int xC = 0;
        int yC = 0;
        pushMatrix();
        translate(xC, yC, z);
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
        fill(col, op / 3);
        //strokeWeight(.5);
        //stroke(paleta[3], op);
        //stroke(#ffffff);
        noStroke();
        beginShape();
        vertex(0, 0);
        bezier(0, 0, -ancho / 2, v0, -ancho / 2, -altura + v1, 0, -altura);
        bezier(0, 0, ancho / 2, v0, ancho / 2, -altura + v1, 0, -altura);
        endShape();
        popMatrix();
}

void dibujarPetalo6(float v0, float v1, float v2, float v3, float ancho,
                    float altura, float op, color col, float z) {
        int xC = 0;
        int yC = 0;
        pushMatrix();

        translate(xC, yC, z);
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
        fill(col, op / 3);
        //strokeWeight(.5);
        //stroke(paleta[3], op);
        //stroke(#ffffff);
        noStroke();
        beginShape();
        vertex(0, 0);
        bezier(0, 0, -ancho / 3, v0, -ancho / 3, v1, 0, altura / 2);
        bezier(0, 0, +ancho / 3, v0, +ancho / 3, v1, 0, altura / 2);
        endShape();
        popMatrix();
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
void oscEvent(OscMessage theOscMessage) {
        /* check if theOscMessage has the address pattern we are looking for. */
        if (theOscMessage.checkAddrPattern("/datos/color/") == true) {
                //println("### Mensaje OSC recibido #0");
                /* check if the typetag is the right one. */
                if (theOscMessage.checkTypetag("i")) {
                        /* parse theOscMessage and extract the values from the osc message
                         * arguments. */
                        //El color entra como Integer
                        colorDatosE = theOscMessage.get(0).intValue();
                        //print("### Mensaje OSC recibido.");
                        //Convertir ints del color a Strings de Hex
                        colorDatosH = hex(colorDatosE,6);
                        //println("------Int:",colorDatosE,"------Hex:"+"#",colorDatosH);
                        //println("Datos Color H: " + colorDatosH);
                        //println("Datos Color E: " + colorDatosE);
                        //gen.createPal(colorDatosH);
                        return;
                }
        } else if (theOscMessage.checkAddrPattern("/datos/cara/") == true) {
                //println("### Mensaje OSC recibido #1");
                /* check if the typetag is the right one. */
                if (theOscMessage.checkTypetag("iiii")) {
                        /* parse theOscMessage and extract the values from the osc message
                         * arguments. */
                        caraDatosE[0] = theOscMessage.get(0).intValue();
                        caraDatosE[1] = theOscMessage.get(1).intValue();
                        caraDatosE[2] = theOscMessage.get(2).intValue();
                        caraDatosE[2] = int(map(caraDatosE[2], 200, 360, 10, 100));
                        caraDatosE[3] = theOscMessage.get(3).intValue();
                        caraDatosE[3] = int(map(caraDatosE[3], 200, 360, 10, 50));

                        //print("### Mensaje OSC recibido.");
                        //println("Datos Cara: " + caraDatosE[0] + ", " + caraDatosE[1] + ", " +
                        //          caraDatosE[2] + ", " + caraDatosE[3]);
                        return;
                }
        } else if (theOscMessage.checkAddrPattern("/datos/ojos/") == true) {
                //println("### Mensaje OSC recibido #2");
                /* check if the typetag is the right one. */
                if (theOscMessage.checkTypetag("iiii")) {
                        /* parse theOscMessage and extract the values from the osc message
                         * arguments. */
                        ojosDatosE[0] = theOscMessage.get(0).intValue();
                        ojosDatosE[1] = theOscMessage.get(1).intValue();
                        ojosDatosE[2] = theOscMessage.get(2).intValue();
                        ojosDatosE[2] = int(map(ojosDatosE[2], 120, 264, 10, 50));
                        ojosDatosE[3] = theOscMessage.get(3).intValue();
                        ojosDatosE[3] = int(map(ojosDatosE[3], 28, 60, 10, 30));
                        // print("### Mensaje OSC recibido.");
                        //  println("Datos Ojos: " + ojosDatosE[0] + ", " + ojosDatosE[1] + ", " +
                        //          ojosDatosE[2] + ", " + ojosDatosE[3]);
                        return;
                }
        } else if (theOscMessage.checkAddrPattern("/datos/nariz/") == true) {
                //println("### Mensaje OSC recibido #3");
                /* check if the typetag is the right one. */
                if (theOscMessage.checkTypetag("iiii")) {
                        /* parse theOscMessage and extract the values from the osc message
                         * arguments. */
                        narizDatosE[0] = theOscMessage.get(0).intValue();
                        narizDatosE[1] = theOscMessage.get(1).intValue();
                        narizDatosE[2] = theOscMessage.get(2).intValue();
                        narizDatosE[2] = int(map(narizDatosE[2], 80, 168, 10, 50));
                        narizDatosE[3] = theOscMessage.get(3).intValue();
                        narizDatosE[3] = int(map(narizDatosE[3], 68, 140, 10, 30));
                        //print("### Mensaje OSC recibido.");
                        //println("Datos Nariz: " + narizDatosE[0] + ", " + narizDatosE[1] + ", " +
                        //          narizDatosE[2] + ", " + narizDatosE[3]);
                        return;
                }
        } else if (theOscMessage.checkAddrPattern("/datos/boca/") == true) {
                //println("### Mensaje OSC recibido #4");
                /* check if the typetag is the right one. */
                if (theOscMessage.checkTypetag("iiii")) {
                        /* parse theOscMessage and extract the values from the osc message
                         * arguments. */
                        bocaDatosE[0] = theOscMessage.get(0).intValue();
                        bocaDatosE[1] = theOscMessage.get(1).intValue();
                        bocaDatosE[2] = theOscMessage.get(2).intValue();
                        bocaDatosE[2] = int(map(bocaDatosE[2], 100, 156, 10, 50));
                        bocaDatosE[3] = theOscMessage.get(3).intValue();
                        bocaDatosE[3] = int(map(bocaDatosE[3], 60, 92, 10, 30));
                        //print("### Mensaje OSC recibido.");
                        //println("Datos Boca: " + bocaDatosE[0] + ", " + bocaDatosE[1] + ", " +
                        //          bocaDatosE[2] + ", " + bocaDatosE[3]);
                        return;
                }
        } else if(theOscMessage.checkAddrPattern("/datos/null/")) {
                //println("### Mensaje OSC recibido #null");
                if(theOscMessage.checkTypetag("i")) {
                        //NULL
                }
        }
        //println("### Direccion del mensaje" + theOscMessage.addrPattern());
}
