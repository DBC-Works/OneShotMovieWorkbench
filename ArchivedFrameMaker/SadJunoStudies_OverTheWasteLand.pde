final class OverTheWasteLand implements FrameMaker {
  private final float W = width / 2;
  private final float H = height / 2;
  private float t = 0;

  void setup() {
    colorMode(HSB, 360, 100, 100, 100);
    blendMode(ADD);
    noiseSeed(154);
  }
  void draw() {
    var maroon = HtmlColorName.MAROON;
    background(maroon.getHue(), maroon.getSaturationAsInt(), maroon.getBrightnessAsInt() * .5);
    translate(W, H);

    noStroke();
    drawFigure();
    t += 0.005;
  }

  private void drawFigure() {
    var dodgerBlue = HtmlColorName.DODGER_BLUE;
    for (var i = .0; i < 1; i += .1) {
      rotate(t);
      var hue = dodgerBlue.getHue() + ((noise(i, t) - 0.5) * 360);
      fill(
        hue < 0 ? hue + 360 : hue,
        dodgerBlue.getSaturationAsInt(),
        dodgerBlue.getBrightnessAsInt(),
        (192.0 / 255) * 100);
      for (var a = .0; a < TAU; a += TAU * .005) {
        var x = cos(i + a) * H * tan(t) * .5;
        var y = sin(sin(i) + a) * H * tan(t - i) * .5;
        circle(x, y, 4);
      }
    }
  }
}
