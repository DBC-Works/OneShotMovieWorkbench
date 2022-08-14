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