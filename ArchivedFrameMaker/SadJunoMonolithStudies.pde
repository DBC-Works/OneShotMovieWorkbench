final class AnchorOfProtest implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t = 0;

  void setup() {
    noStroke();
    smooth();
  }
  void draw() {
    translate(width / 2, height / 2);

    background(31, 35, 40);
    lightSpecular(255, 255, 255);
    spotLight(128, 128, 128, 0, 0, 1000, 0, 0, -1, PI, 100); 
    //pointLight(64, 64, 64, 0, 0, 1000);
    specular(255);
    emissive(0);
    shininess(500);
 
    float U = H / 30;
    for (float i = -1; i <= 1; i += 0.1) {
      float a = i * TAU;
      push();
      rotate(a + t);
      translate(width / 2 * i, 0, H * -tan(i + t));
      rotateZ(a + t * 2);
      rotateY(a + t * 2);
      box(U * 4 , U * 9, U);
      pop();
      t += 0.001;
    }
  }
}

final class CryForDawn implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t = 0;

  void setup() {
    noStroke();
    smooth();
  }
  void draw() {
    translate(width / 2, height / 2);
    float progress = frameCount / (float)getLength();
    background(64, 0, 0);
    lightSpecular(255, 0, 0);
    directionalLight(255, 0, 0, 0, 1, -1);
    //pointLight(0, 0, 0, 1, 0, -1);
    //spotLight(128, 0, 0, 0, 0, 1000, 0, 0, -1, PI, 100);
    spotLight(255 * progress, 255 * progress, 255 * progress, 0, 0, 1000, 0, 0, -1, PI, 100);
    specular(255);
    ambient(255);
    emissive(0);
    shininess(5);

    float U = H / 40;
    float R = H * 2 / 3;
    for (float i = 0; i < 1; i += 0.2) {
      rotate(t + i);
      for (float a = 0; a < TAU; a += TAU / 7) {
        push();
        translate(cos(a) * R * i, sin(a) * R * i, R * -tan(t * 3 + i * 3));
        rotate(a);
        box(U, U * 4, U * 9);
        pop();
      }
      t += 0.001;
    }
  }
}

final class MidnightSlipping implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  ConditionalDrawingPiece titlePiece;

  void setup() {
    smooth();
    noStroke();
    blendMode(ADD);

    int fontSize = 48;
    titlePiece = new ConditionalDrawingPiece() {
      public void draw() {
        push();
        textAlign(CENTER);
        fill(255, 255, 255, 224);
        text("Midnight Slipping", 0, (height - fontSize)/ 2, width, height);
        pop();
      }
      public boolean canDraw() {
        return getTotalFrameCount(4, 28, 16) <= frameCount;
      }
    };
    textFont(createFont("Square 721 BT", fontSize));
  }

  void draw() {
    push();
    translate(W, H);
    float n = H * 0.1;
    //lights();

    /*
    lightSpecular(255 * (1+ (sin(t * 30) / 2)), 0, 255 * (1+ (sin(t * 64) / 2)));
    spotLight(255, 255, 255, -W, -H, 200, 0, 1, -1, PI, 1); 
    specular(255);
    emissive(32);
    shininess(0.5);
    */

    float swing = (1 + sin(t / 2)) / 2;
    fill(255 * (swing / 3), 255 * (swing / 2), 255 * swing, 16);

    background(0);
    for (float i = 0;i < 1;i += 0.01) { 
      float a = TAU * (i + t);
      push();
      translate(H * sin(a) * cos(t), 0, -64);
      rotateX(a);
      rotateZ(a / 3);
      rotateY(a / 2);
      box(n * 4, n * 9, n);
      pop();
    }
    t += 0.0005;
    pop();

    if (titlePiece.canDraw()) {
      //lights();
      translate(0, 0, 128);
      titlePiece.draw();
    }
  }
}

final class HeavyCrackedFuture implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  ConditionalDrawingPiece titlePiece;

  float t = 0;

  void setup() {
    noStroke();
    smooth();

    final int fontSize = 72;
    final PFont font = createFont("Franklin Gothic Medium", fontSize);
    titlePiece = new ConditionalDrawingPiece() {
      public void draw() {
        push();
        textFont(font);
        textAlign(CENTER);
        text("Heavy Cracked Future", 0, 0, 0);
        pop();
      }
      public boolean canDraw() {
        return getTotalFrameCount(2, 22, 3) <= frameCount;
      }
    };
  }
  void draw() {

    translate(W,H);

    push();
    lightSpecular(0,0,0);
    directionalLight(32, 32, 32, 0.5, 0.5, -1);
    spotLight(240, 248, 255, 0, 0, 0, 0, 0, -1, PI, 1);
    //spotLight(255, 69, 0, 0, 0, 0, 0, 0, -1, PI, 1);
    //spotLight(64, 0, 0, 0, 0, -10, 0, 0, 1, PI, 1);
    specular(0);
    ambient(0);
    emissive(0);
    shininess(0);

    background(32,16,0);
    rotate(t);
    float b=H/37;
    for (float n=2;0 <n;n-=0.2) {
      for(float a=TAU;0 < a;a-=TAU/13.0) {
        push();
        translate(cos(a) * H * sin(t + n), sin(a) * H * n, H * -tan(t + n + a));
        rotate(a);
        rotateX(a * n + t);
        box(b*4,b,b*9);
        pop();
        t += 0.0001;
      }
    }
    pop();

    if (titlePiece.canDraw()) {
      titlePiece.draw();
    }
  }
}

final class Pleasure implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    noStroke();
    smooth();
    colorMode(HSB, 360, 100, 100, 100);
  }
  void draw() {
    translate(W,H);
    background(360);

    push();
    directionalLight(0, 0, 100, 0, 0, -1);
    spotLight((frameCount / 10) % 360, 10, 100, 0, 0, 0, 0, 0, -1, HALF_PI, 1);
    lightSpecular(0, 10, 100);
    specular(360);
    ambient(0);
    emissive(0);
    shininess(64);

    rotateX(t * 1.618);
    rotateY(t);
    for (float u = -1;u < 1;u += .2) {
      rotateY (u * TAU);
      for (float z = -1;z < 1;z += .3) {
        float l = width * .01 * (u + 1);
        push();
        translate(0, u * width * sin(t * u), width * z *cos(l + t));
        rotateZ(u * TAU);
        box(l * 4, l * 9, l);
        pop();
      }
    }
    t+=.01;

    pop();
  }
}

final class GraveMarker implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    noStroke();
    smooth();
    background(0);
  }
  void draw() {
    translate(W,H);
    fill(192,192,192,8);
    rect(-width,-width,width*width,width*width); 

    push();
    spotLight(220, 20, 60, 0, -height, 0, 0, 1, 0, PI/4, 1);
    spotLight(192, 192, 192, 0, height*.5, 0, 0, -1, 0, PI/4, 1);
    lightSpecular(255,255,255);
    specular(255);
    ambient(0); 
    emissive(0);
    shininess(5);

    fill(255);
    rotateX(PI/2-t);
    for(var i=-1.0;i<=1;i+=.01){
      rotate(i);
      push();
      translate(H*i,0);
      rotateY(t*TAU);
      rotateX(t+t);
      rotate(t);
      var r=H/20*i;
      box(r,r*9,r*4);
      pop();
    }
    t += .001;

    pop();
  }
}
