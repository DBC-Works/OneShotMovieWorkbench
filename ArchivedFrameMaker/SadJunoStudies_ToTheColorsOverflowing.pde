final class ToTheColorsOverflowing implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    colorMode(HSB, TAU, 1, 1, 1);
    blendMode(ADD);
    noStroke();
  }
  void draw() {
    background(0);
    translate(W, H);
    rotate(-t);
    for (var i = .0; i < 1; i += .01) {
      for (var a = .0; a < TAU; a += TAU * .005) {
        var x = cos(a + t) * H * tan(t * i);
        var y = sin(a + i) * H * cos(t + i);
        fill(a, .3, 1, .6);
        circle(x, y * 1.618, 2);
      }
    }
    t += .005;
  }
}
