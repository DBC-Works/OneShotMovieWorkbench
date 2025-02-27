final class PaleRays implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;
  private float r = random(TAU);
  private float z = height / 2;

  void setup() {
    noiseSeed(100);
    randomSeed(20250126);
    ellipseMode(CENTER);
  }
  void draw() {
    background(0);
    var sideLen = H / 16;

    push();
    translate(W, H);
    lightSpecular(255, 255, 255);
    spotLight(192, 192, 192, 0, 0, 1440, 0, 0, -1, HALF_PI, 100); 
    specular(255);
    emissive(0);
    shininess(255);
    
    push();
    colorMode(HSB, 1, 1, 1, 1);
    blendMode(ADD);
    noFill();
    rotate(t);
    for (var a = .0; a < 1; a += .01) {
      stroke(a, 1.0 / 3, 1, .1 * getProgress());
      rotate(noise(a, t) * 0.004);
      var n = (noise(t, a) + 0.5) * .5;
      ellipse(0, 0, H * 1.618 + H * n, H + H * n);
    }
    pop();
    
    translate(0, 0, z - sideLen * 12);
    rotate(r);
    rotateX(r);
    rotateY(r);
    fill(255);
    noStroke();
    box(sideLen, sideLen * 4, sideLen * 9);

    pop();
    
    z -= 4;
    if (z < -720*3) {
      z = 720;
      r = random(TAU);
    }
    
    r += 0.002;
    t += 0.002;
  }
}
