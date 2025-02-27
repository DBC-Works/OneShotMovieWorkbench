import processing.sound.*;

final class WorldMakeOfEntangledChaoticThreads implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    noFill();
    //randomSeed(120);
  }
  void draw() {
    background(0);
    for (float c = -0.5; c < 0.5; c += 0.05) {
      for (float a = 0; a < TAU; a += TAU / 6) {
        float alpha = 80 * (1 - ((cos(t) + 1) /2));
        stroke(255, alpha);
        float w = W + H * cos(a + c * c + t) * sin(t);
        float h = H + H * sin(a + c + t + t) * cos(c);
        line(W, H, w, h);

        translate(W, H);
        rotate(t / 20);
        ellipse(0, 0, w, h);
        t += 0.0001;
        resetMatrix();
      }
    }

    if (1 - (frameCount / (float)getLength()) < random(1)) {
      filter(INVERT);
    }
  }
}

final class DisentangleAndLink implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    noFill();
    blendMode(ADD);
  }
  void draw() {
    background(0);
    for (float i = -TAU; i <= TAU; i += 0.05) {
      float n = noise(t);
      float m = noise(n, i);
      stroke(255 * n * m, 255 * n, 255, 224);
      circle(W + H * cos(sin(t) * i) * sin(i) * sin(n),
            H + H * sin(sin(t) * i) * cos(i) * sin(n),
            H / 10 * tan(t * i / 10) * n);
      t += 0.000005;
    }
  }
}

final class FutureReflaectedInYourEyes implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Shape shape = new Shape();

  float t = 0;

  void setup() {
    noStroke();
    blendMode(ADD);
  }
  void draw() {
    background(0);
    translate(W, H);
    for (float i = 0; (i += 0.05) < 1;) {
      final float st = sin(t);
      stroke(255 * abs(st), 255 * abs(sin(t * t)), 255 * st * st, 128 * i);
      noFill();
      pushMatrix();
      rotate(t * i);
      shape.polygon(H, 6, new PVector(0, 0, -10));
      popMatrix();

      noStroke();
      for(float j = 0; (j += 0.01) < i;) {
        float e = H * 0.02 * j * cos(t);
        float x = cos(TAU * i * j) * i * sin(i + t) * tan(t * i);
        float y = sin(PI * i * j) * sin(j + t);
        
        fill(255, 255 * j, 255 * i * sin(t), 255);
        circle(H * x, H * y, e);
        circle(H *-x, H *-y, e);

        e = H * 0.02 * j * sin(t);
        fill(255 * i * sin(t), 255 * j, 255 * i, 255);
        circle(H *-x, H * y, e);
        circle(H * x, H *-y, e);
        t += 0.000005;
      }
    }
  }
}

final class WeakVitalSigns implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    noStroke();
  }
  void draw() {
    final int loopCount = (int)Math.floor(t / PI);
    if (loopCount == 0) {
      blendMode(NORMAL);
      background(255);
    } else {
      blendMode(ADD);
      background(0);
    }
    translate(W, H);
    for (float a = 0; a < 3; ++a) {
      rotate((a / 3) *  TAU);
      for (float i = 0; i < TAU; i += 0.01) {
        if (loopCount == 0) {
          stroke(0, (64 / TAU) * i);
        }
        else if (loopCount == 1) {
          stroke(255 * (a == 0 ? 0 : 1), 255 * (a == 1 ? 0 : 1), 255 * (a == 2 ? 0 : 1), (127 / TAU) * i);
        } else {
          stroke(255, (192 / TAU) * i);
        }
        rotate(i);
        float x = cos(i * sin(t)) * H * cos(t);
        float y = sin(i + t) * H * tan(t);
        float l = H * sin(i);
        line(x - l, y, x + l, y);
        t += 0.0000005;
      }
    }
  }
}

final class ShreddedMomentaryPleasures implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t = 0;

  void setup() {
  }
  void draw() {
    /*
    final int count = (int)map(getProgress(), 0, 1, 0, 6);
    final int loopCount = count % 3;
    final int drawCount = count / 3;
    if (loopCount == 0) {
      blendMode(ADD);
      background(0);
    } else if (loopCount == 1) {
      blendMode(NORMAL);
      background(255);
    }
    else {
      blendMode(ADD);
      background(0);
    }
    float a = 0;
    for (float i = 0; i < 1; i += 0.01, a = i * TAU) {
      float x = cos(a) * H * i * cos(t);
      float y = sin(a) * H * i * sin(t);
      if (loopCount == 0) {
        stroke(255, 255 * i);
      } else if (loopCount == 1) {
        stroke(0, 255 * i);
      } else {
        //stroke(192 * (1 + sin(t)) / 2, 192 * i * i, 255 * i);
        stroke(192 * easing.easeInOutCubic((1 + sin(t)) / 2), 192 * i * i, 255 * i);
      }
      push();
      translate(W + x, H + y);
      rotate(a + t);
      if (drawCount == 0) {
        line(x, 0, x, W);
        line(0, y, W, y);
      }
      else {
        line(x, -W, x, W);
        line(-W, y, W, y);
      }
      pop();
      t += 0.0001;
    }
    */
    final float progress = getProgress();
    blendMode(ADD);
    background(0);
    float a = 0;
    for (float i = 0; i < 1; i += 0.01, a = i * TAU) {
      float x = cos(a) * H * i * cos(t);
      float y = sin(a) * H * i * sin(t);
      stroke(
        192 * easing.easeInOutCubic((1 + sin(t + progress)) / 2) * progress,
        192 * i * i,
        255 * i);
      push();
      translate(W + x, H + y);
      rotate(a + t);
      line(x, 0, x, W);
      line(0, y, W, y);
      pop();
      t += 0.0001;
    }
  }
}

final class MorningAgain implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t = 0;

  void setup() {
    noFill();
  }
  void draw() {
    blendMode(ADD);
    smooth();
    background(0);
    float a = 0;
    for (float i = 0; i < 1; i += 0.01, a = i * i * TAU) {
      final float x = cos(a) * H * i * cos(t);
      final float y = sin(a) * H * i * sin(t);
      final color c = color(192 * ((1 + sin(t)) / 2), 255 * i, 192 * i * i);
      stroke(c, 255 *  sin(i * HALF_PI));
      fill(c, 8 * sin(i * HALF_PI));

      push();
      translate(W + x, H + y);
      rotate(a + t);

      /*
      line(x, -W, x, W);
      line(x, y, W, W);
       */
      
      beginShape();
      curveVertex(x, -W);
      curveVertex(x, W);
      curveVertex(x, y);
      curveVertex(W, y);
      curveVertex(-W, y);
      endShape(CLOSE);

      pop();
      t += 0.00004;
    }
  }
}

final class ConfusedLight implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t = 0;

  void setup() {
    noStroke();
    colorMode(HSB, TAU, 100, 100, 100);
  }
  void draw() {
    blendMode(ADD);
    smooth();
    background(0);

    translate(W, H);
    for (float i = 0; i < 1; i += 0.001) {
      float a = i * TAU;

      push();
      rotate(a);
      float hue = a;
      
      float r = H / 32 * i;
  
      a *= 3 * sin(t + i);
      float x = cos(a + a) * H;
      float y = sin(1 + a) * sin(a) * H;

      fill(hue, 99 * dist(0, 0, x, y) / H, 99, 67 * (1 - sin(i * HALF_PI)));
      circle(x, y, r);

      float u = x * tan(a);
      float v = y * tan(-t);
      fill(hue, 99 * dist(0, 0, u, v) / H, 99, 99 * (1 - sin(i * HALF_PI)));
      circle(u, v, r);

      pop();
      t += 0.000001;
    }
  }
}

final class WithSecretRecollection implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t = 0;

  void setup() {
    noStroke();
    //colorMode(HSB, TAU, 100, 100, 100);
    colorMode(RGB, 255, 255, 255, 255);
    blendMode(NORMAL);
    smooth();
  }
  void draw() {
    background(248, 248, 255);

    translate(W, H);
    float r = H / 20;
    float f = (1 + sin(t * 10)) / 2;
    for (float j = 0; j < 1; j += 0.05) {
      for (float i = 0; i < 1; i += 0.02) {
        float a = i * TAU;
        rotate(0.06);
        //fill(255 * j, 255 * f, 255 * i, 192);
        fill(112,128,144, 255 * i);
        //fill(a, 10, 99 * j, 67 * i);
        ellipse(cos(a + cos(t + a)) * H, sin(a * sin(1 + t + a)) * H, r * j * j, r * j * j* 1.618);
        t += 0.0000005;
      }
    }
  }
}

final class DownsizedUprising implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t = 0;

  void setup() {
    noStroke();
    colorMode(RGB, 255, 255, 255, 255);
    blendMode(ADD);
    smooth();
  }
  void draw() {
    background(0);
    float H = 360;
    float i, a;
    for (i = a = 0; i < 1;  a = (i += 0.001) * TAU) {
      float f = 1 + (sin(t) / 2);
      float x = cos(t + a) * H * tan(a + a + t);
      float y = sin(t + a) * H * tan(a + i - t);
      
      fill(255 * i, 255 * f * i, 255 * f);
      circle(W + x, H + y, 4);
      circle(W - x, H - y, 4);
      t += 0.00001;
    }
  }
}


final class TearsFlowingInOurHearts implements FrameMaker {
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
    background(0);

    float i, j;
    for (i = 0; (i += 0.1) < PI;) {
      for(j = 0; (j += 0.2) < PI;) {
        fill(128 * (i / PI) * (j / PI), 128  * (i / PI), 255);
        float x = cos((i + j + t)) * H * sin(i);
        float y = sin(((i * j) + t)) * H * sin(j);
        float r = H / 400 * i * j;
        circle(x, y, r);
        circle(-x * sin(j), -y * sin(j), r);

        t+= 0.00001;
      }
    }
  }
}

final class EphemeralThreadsOfLife implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t1 = 0;
  float t2 = 0;

  void setup() {
    noFill();
    smooth();
    blendMode(ADD);
    colorMode(HSB, 1, 100, 100, 100);
    noiseSeed(122);
  }
  void draw() {
    float f1 = ((1 + sin(t1)) / 2);
    float f2 = f1 * f1;
    float f3 = f2 * f2;
    translate(width / 2, height / 2);
    background(0);

    rotateY(t2 + f1);
    float s = H / 8;
    s += s * f1;
    for (float i = -1; i <= 1; i += 0.05) {
      push();
      stroke((i * 0.1) + ((1 + sin(t2)) / 2), 99 * noise(t1, t2), 99, 67);
      float x = height * i * tan(t1);
      float y = height * i * sin(t1) * sin(t1);
      translate(x, y);
      rotateX(t1 + i);
      box(s, s * 4,  height * f1);
      pop();
      t1 += 0.0005;
      t2 += 0.0001;
    }
  }
}

final class BeyondTheForce implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t = 0;
  float I = 0.05;

  void setup() {
    smooth();
    blendMode(ADD);
    noStroke();
    fill(255, 8);
    rectMode(CENTER);
  }
  void draw() {
    background(0);
    translate(width / 2, height / 2);
    rotate(-t);

    for (float n = 0; n < TAU; n += TAU / 5) {
      push();
      translate(H * cos(n),H* sin(n));
      float l = W;
      for (float a = 0; a < PI; a += I) {
        rotate(I + tan(t));
        square(0, 0, l);
        l = l / ((sin(I) + cos(I)));
        t += 0.000002;
      }
      pop();
    }
  }
}

final class MonologueWithAnAngel implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t = 0;
  float I = 0.05;

  String[] texts = {
    "Are you here?",
    "I want to talk.",
    "But I don't know what to talk.",
    "",
    "Can you see me?",
    "There's no future, there's no past.",
    "There's nothing here anymore.",
    "",
    "It's too late.",
    "I'm so tired",
    "and very afraid.",
    "",
    "I'm still waiting.",
    "Waiting for ...",
    "",
    "Can you hear my voice?",
    "I can't...",
    "",
    "Quiet...",
    "Very quiet...",
    "",
  };

  void setup() {
    smooth();
    noStroke();
    textAlign(CENTER);
    textFont(createFont("Cambria", 48));
    fill(192);
    clear();
  }
  void draw() {
    int perFrame = (getLength() - 1)/ texts.length;
    //if (frameCount == 1 || frameCount % perFrame == 0) {
      text(texts[frameCount / perFrame], width / 2, height / 2 + 16);
    //}
    filter(BLUR, 0.6);
  }
}

final class DreamInTheFlow implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t = 0;
  float I = 0.05;

  void setup() {
    smooth();
    //blendMode(ADD);
    noFill();
    sphereDetail(6);
  }
  void draw() {
    background(0);
    translate(W, H);
    rotateY(t * 1.618);
    rotateZ(t * 1.618);
    for (float i = 1; 0 <= i; i -= 0.05) {
      stroke(255 * abs(sin(i * TAU + t)), 255 *abs(tan(t * 1.01)), 255, 128);
      float s = width * i;
      push();
      rotate(t + i);
      rotateY(t + i);
      sphere(s);
      pop();
      t += 0.0001;
    }
  }
}

final class PendulumTrajectoryInMyMind implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  final Easing easing = new Easing();

  float t = 0;
  float I = 0.05;

  void setup() {
    smooth();
    blendMode(ADD);
    noStroke();
  }
  void draw() {
    clear();
    translate(width / 2,height / 2);
    rotate(-t);
    for (float v = 0; v < 1; v += 0.01) {
      for (float h = 0; h < 1; h += 0.01) {
        fill(255 * abs(sin(t)), 255 * abs(sin(t *1.618)),255  * abs(sin(t / 1.618)), 128);
        float a = sin(h * v + t) * TAU;
        float x = cos(a * a) * H * sin(h + t);
        float y = sin(a * a) * H * sin(v + t);
        circle(x, y, 8 * h * v);
        circle(-x, -y, 8 * h * v);
      }
    }
    t += 0.01;
  }
}

final class FromTheRoadside implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    smooth();
    blendMode(ADD);
    noStroke();
  }
  void draw() {
    background(0);
    translate(W,H);
    for (float n = 0; n < TAU; n += 0.2) {
      rotate(n);
      fill(255*abs(cos(n+t)),255*abs(cos(n+n+t)),255*abs(sin(n*n+t)),16);
      circle(cos(n * 2 + t) * H,pow(sin(n * n + t), 3) * H, W * n * ((1 + sin(t)) / 2));
      t += 0.00001;
    }
  }
}

final class ThroughTheTunnel implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    smooth();
    blendMode(ADD);
    noStroke();
    noiseSeed(132);
  }
  void draw() {
    clear();
    translate(W,H);
    for (float v = 0; v < 1; v += 0.01) {
      for (float h = 0; h < 1; h += 0.01) {
        float a = noise(h, v, t) * TAU;
        float x = cos(a * a) * H * sin(h + t);
        float y = sin(a * a) * H * sin(v + t);
        fill(192, 192, 255, 192 + (255 - 192) * h * v);
        circle(x, y, 4 * h * v);
      }
    }
    /*
    push();
    stroke(255, 128);
    rotate(t);
    line(-W, -H, W, H);
    rotate(HALF_PI);
    line(-W, -H, W, H);
    pop();
     */
    t += 0.01;
  }
}

final class ToTheHillWhereAcaciaBlooms implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t1 = 0;
  float t2 = 0;

  ConditionalDrawingPiece titlePiece;

  void setup() {
    smooth();
    blendMode(ADD);
    noStroke();

    int fontSize = 48;
    titlePiece = new ConditionalDrawingPiece() {
      public void draw() {
        push();
        textAlign(CENTER);
        fill(255, 255, 224, 248);
        text("アカシアの咲く丘へ", 0, (height - fontSize)/ 2, width, height);
        pop();
      }
      public boolean canDraw() {
        return getTotalFrameCount(3, 29, 5) <= frameCount;
      }
    };
    textFont(createFont("UD デジタル 教科書体 NK-R", fontSize));
  }

  void draw() {
    push();

    float intensity = frameCount / (float)getLength();
    clear();
    for (float v = 0; v < 1; v += 0.01) {
      for (float h = 0; h < 1; h += 0.01) {
        fill(255 * v * intensity, 255 * h, 255 * abs(tan(t1)), 128);
        float a = cos(h + v + t1) * TAU;
        float x = cos(a) * 360 * sin(h + t1);
        float y = sin(a) * 360 * cos(v + t2);
        
        circle(width / 2  + x, height / 2 + y, 4 * h * v);
      }
    }
    t1 += 0.01;
    t2 += 0.001618;
    pop();

    if (titlePiece.canDraw()) {
      titlePiece.draw();
    }
  }
}

final class RayAcrossTheBottom implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  ConditionalDrawingPiece titlePiece;

  void setup() {
    smooth();
    noFill();
    blendMode(ADD);

    int fontSize = 48;
    titlePiece = new ConditionalDrawingPiece() {
      public void draw() {
        push();
        textAlign(CENTER);
        fill(135, 206, 250);
        text("Ray across the bottom", 0, (height - fontSize)/ 2, width, height);
        pop();
      }
      public boolean canDraw() {
        return getTotalFrameCount(4, 53, 23) <= frameCount;
      }
    };
    textFont(createFont("Square 721 BT", fontSize));
  }

  void draw() {
    push();
    translate(W, H);
    background(0);
    rotate(t);
    for(float i=0;i<=1;i+=0.01){
      float r = i * i * (3 - 2 * i) * TAU;
      float x = cos(r + t);
      float y = sin(r + i);
      //drawItem(x, y, r * tan(i + t), i);
      drawItem(x, y, r * tan(i + t) * 1.618, i);
    }
    t+= 0.001;
    pop();

    //filter(BLUR, 0.4);
    if (titlePiece.canDraw()) {
      translate(0, 0);
      titlePiece.draw();
    }
 }
 private void drawItem(float x, float y, float r, float i) {
    // https://ex-gram.com/emission/
    push();
    float red = 65 + 190 * i * i * i;
    float green = 105 + 145 * i * i;
    float blue = 225;
    for (int n = 3; n > 0; n--) {
      float dist = sq(n) / 3.0;
      float rd = constrain(int(red), 0, 255);
      float gr = constrain(int(green), 0, 255);
      float bl = constrain(int(blue), 0, 255);
      stroke(rd, gr, bl, 64);
      strokeWeight(dist);
      circle(H*x, W*y, r);
    }
      pop();
 }
}

final class LessButNotEnoughNov2022Study implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  ConditionalDrawingPiece titlePiece;

  void setup() {
    smooth();
    noFill();
    //blendMode(ADD);
    colorMode(HSB,TAU,1,1,1);
  }

  void draw() {
    float b=H/18;
    //clear();
    background((1 + sin(t)) / 2, 1, 0.6);
    translate(W,H);
    rotate(t);
    for (float i=0;i<TAU;i+=.17) {
      push();
      translate(H * cos(i) * sin(t),H* sin(i) * sin(t));
      rotateX(t);
      rotateZ(t+i);

      stroke(i, .2, 1, .6);
      strokeWeight(1);
      box(b * 4, b* 9, b); 
      pop();
    }
    t+= 0.005;
 }
}

final class WillToKeepDeathAway implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  ConditionalDrawingPiece titlePiece;

  void setup() {
    smooth();
    fill(0,2);
    clear();

    final int fontSize = 36;
    final PFont font = createFont("Square721 BT", fontSize);
    titlePiece = new ConditionalDrawingPiece() {
      public void draw() {
        push();
        fill(255, 128);
        textFont(font);
        textAlign(CENTER);
        blendMode(ADD);
        fill(192,128);
        text("Will(to keep death away)", W, H, 32);
        pop();
      }
      public boolean canDraw() {
        return getTotalFrameCount(3, 7, 6) <= frameCount;
        //return true;
      }
    };
  }

  void draw() {
    push();
    colorMode(HSB, 360, 100, 100, 100);
    blendMode(NORMAL);
    rect(0,0,width,height);
    //clear();
    blendMode(ADD);
    translate(W,H);
    rotate(t*TAU);
    rotateY(t);
    for (float i = 0; i<=1; i += 0.05) {
      stroke(360 * ((1 + acos(cos(t * 10))) / 2), 10, 100, 10);
      rotate(i * sin(t));
      ellipse(0, 0, width * 2 * i * abs(sin(t) * i),H / 6 * abs(cos(t*(1-i))));
    }
    t += 0.001;
    pop();

    if (titlePiece.canDraw()) {
      titlePiece.draw();
    }
  }
}

final class AroundLostWords implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  final String[] texts = {
    "",
    "calm",
    "quiet",
    "tranquility",
    "promise",
    "will",
    "future",
    "hope",
    "humanity",
    "world",
    "",
    "(Will we ever get those words back?)",
  };
  int perFrame;

  void setup() {
    perFrame = (getLength() - 1) / texts.length;
    smooth();
    noStroke();
    textAlign(CENTER);

    //textFont(createFont("Cambria", 48));
    textFont(createFont("Noto Serif", 48));
    background(16);
  }
  void draw() {
    stroke(255, 0, 0, 64);
    line(0, height / 2, width, height / 2);

    int index = Math.min(frameCount / perFrame, texts.length - 1);
    fill(255, 0, 0, 64);
    text(texts[index], width / 2, height / 2 + 12);
    filter(BLUR, 0.6);
  }
}

final class OnTheBackOfTheCorpse implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;
  ConditionalDrawingPiece titlePiece;

  void setup() {
    noFill();
    colorMode(HSB, 1, 1, 1, 1);
    smooth();
    blendMode(ADD);

    /*
    final int fontSize = 36;
    final PFont font = createFont("AGENDA人名P正楷書体L1", fontSize);
        textFont(font);
    titlePiece = new ConditionalDrawingPiece() {
      public void draw() {
        push();
        textAlign(CENTER);
        fill(0.5);
        text("亡骸の背で", W, H + fontSize / 2, 0);
        pop();
      }
      public boolean canDraw() {
        //return getTotalFrameCount(3, 7, 6) <= frameCount;
        return true;
      }
    };
     */
  }
  void draw() {
    background(0);

/*
    if (titlePiece.canDraw()) {
      titlePiece.draw();
    }
 */

    translate(W, H);

    rotateX(t * PI);
    rotateY(t * 1.618);
    for (float i = 0; i < 1; i += .01) {
      rotate(t);
      final float r = W * 2 * i * cos((i + t) * TAU);
      final float start = TAU * i * ((1 + cos(i + t)) / 2);
      float stop = TAU * i * ((1 + sin(i)) / 2);

      stroke(i, 1.0 / 3, 1, 1);
      strokeWeight(i * 4);
      arc(0, 0, r, r, start, stop);
      stroke(i, 2.0 / 3, 1, 1);
      strokeWeight(i * 2);
      arc(0, 0, r, r, start, stop);
      stroke(i, 0, 1, 1);
      strokeWeight(1);
      arc(0, 0, r, r, start, stop);
    }
    t += .001;
  }
}

final class BeatUnderBlanket implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    colorMode(HSB,360,100,100,100);
    noStroke();
    smooth();
  }
  void draw() {
    background(0);
    translate(W, H);
    for (float i = .01; i < 1; i+=.2) {
      float hue = 360 * (((t*i) * .01 ) % 1);
      fill(hue, 74, 99, 99 * i);
      d(.9 * i);
    }
  }
  void d(float w) {
    if (0.1 < w) {
      d(w*w);
    }
    for (float i = 0;i <= TAU; i += .005) {
      rotateY(t * .001);
      float x = W * w * cos(i + w) * sin(i + t) * sin(i);
      float y = W * w * sin(i) * sin(t + w + t) *cos(i + t);
      circle(x, y, 4 * w);
    }
    t+=.0005;
  }
}

final class FacingTheUnderpass implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    noStroke();
    smooth();
    background(0);
  }
  void draw() {
    blendMode(NORMAL);
    fill(0,4);
    rect(0, 0, width, height);
    translate(W, H);
    blendMode(ADD);
    d(0);
  }
  void d(float c) {
    rotate(c * 0.001);
    for (float i = 0; i <= TAU; i += .031415926) {
      fill(64 * i / TAU, 255 * ((1 + sin(t)) / 2), c / 4);
      float x = cos(i + t) * H * sin(i + c * c / 30 + t);
      float y = sin(i + c * 0.001) * H * sin(i + c / 30 + t);
      circle(x, y, 2 * c * .01);
    }
    c += 7;
    if (c < 256) {
      d(c);
    }
    t+=0.00005;
  }
}

final class TearsWithout implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    noStroke();
    smooth();
    blendMode(ADD);
    colorMode(HSB, TAU, 100, 100, 100);
  }
  void draw() {
    background(0);
    translate(width / 2, H);
    rotate(t);
    for (float i = 0;i < TAU;i += 0.1){
      //fill(255, 255 * i / TAU);
      fill(((t *0.1)* i) % TAU, 33, 100, 100 * i / TAU);
      for (float j=0;j < TAU;j += 0.1){
        float a = atan2(i + sin(t), j + cos(t)) * TAU;
        float x=cos(a) * H * sin(j);
        float y=sin(a) * H;
        circle(x, y, 4);
        circle(-x, -y, 4);
      }
    }
    t+=0.01;
  }
}

final class ResistanceReflecting implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    noStroke();
    smooth();
    blendMode(ADD);
    colorMode(HSB,TAU,1,1,1);
  }
  void draw() {
    background(0);
    translate(W,H);
    for (float a = 0; a < TAU; a += 0.001) {
      rotate(a);
      //fill(a, .4, 1, .8);
      fill(a, 1.0*((1 + cos(t * 2)) / 2), 1, .8);
      float x = cos((a + a + t))*.1 * H * tan(sin(a)); 
      float y = sin(a * a * .1) * H * tan(log(t + a));
      circle(x, y, 2);
    }
    t += 0.02;
  }
}

final class StandWithNakedAnger implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;

  float t = 0;

  void setup() {
    noStroke();
    smooth();
    blendMode(ADD);
    colorMode(HSB, 1, 1, 1, 1);
    ellipseMode(CENTER);
  }
  void draw() {
    background(0);
    translate(W,H);
    rotate(-t);
    for (float i = 0; i <= 1.0; i+=0.1) {
      rotateY(i * TAU);
      rotate(-i + (0.3 * ((1 + sin(t) / 2))));
      for (float y = 0; y <= 1; y += 0.1) {
        for (float x = 0; x <= 1; x += 0.01) {
          //fill(y, noise(y, x, t), 1, 1);
          fill(y, 1, 1, 1);
          float X = x * W * cos(t + y) * sin(x + i);
          float Y = W * sin(x * TAU) * sin(t + i);
          float d = 4;
          circle(X, Y, d);
          circle(-X * 1.618 * tan(t), -Y * 1.618 * cos(t), d);
        }
      }

    }
    t += 0.01;
  }
}

final class TillWeDisappearFrom implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noStroke();
    fill(255, 128);
    blendMode(ADD);
  }
  void draw() {
    translate(W, H);
    background(0);
    for(float i=0;i<=1;i+=0.01){
      for(float j=0;j<=1;j+=0.05){
        float x = W * cos(t + i * TAU) * cos(j + cos(t));
        float y = H * sin(t + i * TAU) * sin(j + i + t);
        circle(x, y, 4);
        circle(-x * 1.168, -y * 1.168, 2);
      }
      t+=0.00001;
    }
  }
}

final class ForEbbTide implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;

  void setup() {
    noStroke();
    //blendMode(ADD);
  }
  void draw() {
    background(0);
    translate(W, H);
    float t = frameCount * 0.0009;
    rotate(-t);
    for (float i = 0; i < 1; i += .03) {
      rotateX(t * 0.1);
      fill(255, 128 * i);
      for (float j = t; j < t + i * TAU * 1.62; j += .02) {
        circle(
          cos(atan2(sin(t) + i, sin(-t) + j) + j) * cos(t + j) * W * sin(t + j),
          sin(j + sin(j)) * H *sin(t + i),
          2);
        t += 1e-7;
      }
    }
  }
}

final class ProtestAgainstTheWall implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    //colorMode(HSB, 360, 100, 100, 255);
  }
  void draw() {
    fill(#dc143c, 16);
    //fill(347, 90 + (9 * ((1+ sin(t)) / 2)), 85, 16);
    //fill(0 + (44 * ((1+ sin(t)) / 2)), 90, 85, 16);
    noStroke();
    rect(0, 0, width, height);

    noFill();
    translate(W, H);
    rotateY(t);
    rotateZ(t);
    for (float i = 1; 0 <= i; i -= 0.04) {
      strokeWeight(4 * i);
      stroke(0, 255 * i);
      push();
      rotate(t + i * 1.618);
      rotateY(t + i * 1.618);
      box(width * i);
      pop();
      t += 0.0001;
    }
  }
}

final class SkyBeyondTheGrid implements FrameMaker {
  final float W = width / 2;
  final float H = height / 2;
  float t = 0;

  void setup() {
    colorMode(HSB, 1, 1, 1, 1);
    noStroke();
    blendMode(ADD);
  }
  void draw() {
    background(t % 1, 1, .1);
    fill(1, .1);
    translate(W, H);
    rotateY(t);
    rotateX(-t * 1.618);
    for (float i = 0; i < 1.0; i +=.02) {
      float a = i * TAU;
      float r= H + W * sin(a + t);
      push();
      rotateX(a);
      rotateY(a + t);
      rotate(a * i + t);
      box(r * 4, r * 9, r);
      pop();
    }
    t += .001;
  }
}

final class ToTheWorldDestructive implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noFill();
  }
  void draw() {
    background(0);
    noFill();
    translate(W, H);
    for (var i = .0; i < 1; i += 0.01) {
      stroke(
        128 + 255 * i,
        128 * sin(i * 3.1415926535),
        255 * ((1 + sin(t * 10)) / 2),
        255
      );
      var a = i * TAU;
      rotate(i);
      rotateX(a);
      rotateY(t);
      ellipse(0, 0, W * (1 + cos(a)), W * a);
    }
    t += 0.001;
  }
}

final class WithFootprintsOfLight implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noStroke();
    background(0);
    colorMode(HSB, TAU, TAU, TAU, TAU);
  }
  void draw() {
    //background(0);
    fill(0, .1);
    rect(0,0,width,height);
    push();
    //blendMode(ADD);
    translate(W, H);
    rotate(t);
    rotateY(t);
    for(var i = .0; i <= TAU; i += .1) {
      rotateY(i);
      fill((t + (i / 2)) % TAU, TAU - i, TAU, i);
      for(var j = -PI; j <= PI; j += .02) {
        var a = atan2(i + j, j - t);
        var x = cos(a * a + t) * H * tan(j + i);
        var y = sin(a + a - j) * H * cos(t + i);
        circle(x, y, 2);
      }
    }
    pop();
    t += .01;
  }
}

final class APartOfMySoulNoOneCanTakeAway implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noStroke();
    colorMode(HSB,1,1,1,1);
    blendMode(ADD);
  }
  void draw() {
    background(0);
    translate(W,H);
    for (float i = 0; i <= 1; i += 0.01) {
      rotate(i);
      for (float j = -i; j <= i; j += 0.01) {
        fill(i, 0.67, (t + i) / 2, 1);
        float x = cos(i * TAU + t) * W * i * j;
        float y = sin(i * j * TAU + t) * W * i * i * 1.618;
        circle(x, y, 2);
      }  
    }
    t += 0.01;
  }
}

final class ListenToTheCall implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noFill();
    blendMode(ADD);
  }
  void draw() {
    background(0);
    translate(W, H);
  
    var f = (1 + sin(t)) / 2;
    for (var i = .0; i < 1; i += .002) {
      rotate((TAU + t) * .01);
      var a = i * TAU;
      var x = cos(a + f) * H * sin(a);
      var y = sin(a + a) * H * i;
      stroke(255, 255 * f, 255 * i, 192);
      arc(x, y, -x * 1.618 * f, -y * 1.618 * i, 0, TAU * (i + f));
      t += 0.000002;
    }
  }
}

final class TooManyScreamsTooManyCracks implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;
  private final float[] values = new float[360];

  void setup() {
    background(0);
    blendMode(SCREEN);
    noStroke();
    noiseSeed(20240428);
    randomSeed(20240428);
  }
  void draw() {
    final var radius = H * 1.618 * sin(t);
    final var amp = getAmplitude().analyze();
    final var z = amp * 2;
    for (int i = 0; i < values.length; i += 3) {
      values[i] = (t == 0 ? random(i) : values[i] + (noise(i * 0.01, t) * z - (z *.5)));
      final var angle = values[i] / 360 * TAU;
      final var ratio = (i + t * 100) / values.length;
      final var x = cos(angle) * radius * ratio;
      final var y = sin(angle) * radius * ratio;
      fill(0, 4, 0, 1);
      circle(W - x * 1.618, H - y * 1.618, 4);
      fill(0, 0, 32, 1);
      circle(W + x * 1.618, H + y * 1.618, 4);
      fill(229 * amp, 23, 31, 1);
      circle(W + x, H + y, 2);
    }
    t += 0.001;
 }
}

final class NightsWaitingForWings implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noFill();
    blendMode(ADD);
    colorMode(HSB, 360, 100, 100, 100);
  }
  void draw() {
    final var bgColor = HtmlColorName.MIDNIGHT_BLUE;
    background(bgColor.getHue(), bgColor.getSaturationAsInt(), bgColor.getBrightnessAsInt() * .5);

    translate(W, H);
    stroke((t * 100) % 360, 33, 99, 99);
    for (var y = -1.0; y <= 1; y += .1) {
      rotate(cos(t + y) + y * PI);
      rotateY(sin(t *.2));
      for (var x = -1.0; x <= 1; x += .1) {
        rotateX(sin(x) * PI);
        circle(W * x * cos(t + x), W * y * sin(t + y), H * .1 * sin(t + x + y));
      }
    }
    t += 0.005;
  }
}

final class BeyondTheDarkNight implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noFill();
    background(0);
  }
  void draw() {
    push();
    noStroke();
    fill(0,8);
    rect(0,0,width,height);
    pop();
    translate(W + ((W / 4) * sin(t)), H + (H /2 * sin(t * 1.618)));
    float i, a;
    for (i = a = 0.0; i < 1;  a = (i += 0.002) * TAU) {
      rotate(TAU * 0.002 * a);
      var c = t + cos(t + a) * i;
      var x = cos(c) * sin(t) * H * tan(t * i);
      var y = sin(c) * cos(a) * H * tan(t + a);
      var j = sin(t + a) / 1.62;
      stroke(255, 64 + i * 32);
      rect(x, y, -x * j, -y * j);
      t += 0.00001;
    }
  }
}

final class OverTheRedMoon implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noFill();
    background(0);
    noStroke();
    blendMode(ADD);
    colorMode(HSB, 360, 100, 100, 100);
  }
  void draw() {
    translate(W, H);
    rotate(t);
    for (var i = .0; i <= 1; i += PI * .001) {
      var a = i * TAU + t;
      fill(((i + t) * 360) % 360, getProgress() * 67, 100, 100);
      var x = cos(a) * H * sin(t);
      var y = sin(a) * H * tan(t) * cos(i + t);
      circle(x, y, 2);
    }
    blendMode(NORMAL);
    //fill(0, 4);
    fill((t * 180) % 360, 33, 25, 4);
    circle(0, 0, width * tan(t));

    t+=.001;
  }
}

final class OnTheEdgeOfTheWorldHazyWithAnger implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noFill();
    noStroke();
    blendMode(ADD);
    colorMode(HSB, TAU, 1, 1, 1);
  }
  void draw() {
    background(0);
    translate(W, H);
    rotate(t);
    for (float i = 0; i <= TAU;i += .1) {
      // fill (255, 255 * i / TAU);
      fill((t + (i * .1)) % TAU, 0.67 * ((1 + acos(cos(t * 1.67))) / 2), 1, 1);
      for (float j = -PI; j <= PI; j += .02) {
        float a = atan2(i + j, j - t);
        float x = cos(a * a + t) * H * tan(j + i);
        float y = sin(a + a - j) * H * cos(t + i);
        circle(x, y, 2);
      }
    }
    t += .01;
  }
}

final class HopeFlowingEphemerally implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;
  private float x = 0;
  private float y = 0;

  void setup() {
    noStroke();
    background(0);
  }
  void draw() {
    fill(0,6);
    rect(0,0,width,height);
    translate(W, H);
    for (var i = .0; i < TWO_PI; i+= 0.001) {
      var u = cos(y * x + i) * sin(t + x);
      var v = sin(x * y + t) * cos(TWO_PI - i + y);
      fill(255);
      circle(u * H, v * H, 1);
      fill(255,128);
      circle(-x * H / 1.618, -y * H / 1.618, 1);
      x = u;
      y = v;
    }
    t += 0.001;
  }
}

final class AmbivalenceSteps implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noStroke();
    background(0);
    colorMode(HSB, TAU, 1, 1, 1);
    blendMode(ADD);
  }
  void draw() {
    translate(W, H);
    rotate(t * .67);
    rotateY(t);
    for (var i = t; i < t + TAU; i += 0.05) {
      fill((i + t) % TAU, 1, 1, .67);
      push();
      rotate(i);
      var h = W * ((acos(sin(t)) + 1) / 2);
      var x = cos(i + sin(t)) * h * cos(t + i);
      var y = sin(i + t) * h * sin(i + cos(t));
      circle(x, y, 1);
      pop();
    }
    t += 0.01;
  }
}

final class ScarsAchingViolentlyAtTwilight implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    blendMode(ADD);
  }
  void draw() {
    translate(W, H);
    background(0);
    noStroke();
    fill(HtmlColorName.CRIMSON.getRed(), HtmlColorName.CRIMSON.getGreen(), HtmlColorName.CRIMSON.getBlue());
    for (var i = -1.0;i < 1; i+=.1) {
      for (var a = .0; a < TAU; a+= .01) {
        var x = cos(a + i) * tan(t + a);
        var y = sin(a * a *cos(t + i)) * tan(i + t);
        circle(W*x,W*y,2);
      }
    }
    t += .005;
  }
}

final class AmbiguousSigns implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noFill();
    colorMode(HSB,1,1,1,1);
    blendMode(ADD);
    smooth();
    noiseSeed(92);
  }
  void draw() {
    background(0);
    translate(W,H);
    for (var j=.0;j < 1; j += 0.01) {
      push();
      stroke(noise(j, t), 0.6, 1, 0.5);
      rotate(noise(t, j) * PI);
      ellipse(0, 0 , W, W * 1.618 *sin(j));
      pop();
    }
    t+=.001;
  }
}

final class Suffering implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noStroke();
    colorMode(HSB, 1, 1, 1, 1);
    noiseSeed(126);
    blendMode(ADD);
  }
  void draw() {
    background(0);
    translate(W, H);
    rotate(t);
    for (var i = .0; i < 1; i += .02) {
      rotate(i);
      for (var a =.0; a < TAU; a += .01) {
        //var x = cos(a +sin(i+t)) * tan(t + a) *noise(t,i);
        //var y = sin(t + a) * tan(i *a) *noise(t,a);
        //fill(i*255,x*255,y*255);
        var x = cos(a + sin(i + t)) * tan(t + a);
        var y = sin(t + a) * tan(i * a);
        fill(noise(i, t), .67, 1, .33);
        circle(x*H,y*H,2);
      }
      t += .0001;
    }
  }
}

final class OnTheUninvitedNight implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    noiseSeed(72);
    blendMode(ADD);
    //stroke(255, 72);
    colorMode(HSB, 1,1,1,1);
    noFill();
  }
  void draw() {
    background(0);
    translate(W, H);

    for (int n = -2; n <= 2; ++n) {
      push();
      var p = n * .45;
      translate(W * p, 0);
      float u,v,y;
      for (var i = 0.0; i < 1.0; i += 0.02) {
        var h = H * 1.67 * (noise(i + n, t) - .5);
        stroke(noise(i, t + n), .1, .67, .3);
        beginShape();
        for (y = u = v = -1.0; y < 1.0; y += 0.02) {
          var x = cos(y * PI) * h;
          vertex(x, y * H, u, v * H);
          v = y;
          u = x + noise(y + n, t);
        }
        endShape();
      }
      pop();
    }
    t += 0.001;
  }
}
