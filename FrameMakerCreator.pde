/**
 * FrameMakerCreator class
 */
final class FrameMakerCreator {
  FrameMaker createSampleMaker() {
    return new FrameMaker() {
      float t = 0;
      float W = 1280 / 2;
      float H = 720 / 2;

      void setup() {
        noFill();
        blendMode(ADD);
      }

      void draw() {
        background(0);
        for (var i = -TAU; i <= TAU; i += 0.05) {
          var n = noise(t);
          var m = noise(n, i);
          stroke(255 * n * m, 255 * n, 255, 224);
          circle(W + H * cos(sin(t) * i) * sin(i) * sin(n),
                H + H * sin(sin(t) * i) * cos(i) * sin(n),
                H / 10 * tan(t * i / 10) * n);
          t += 0.000005;
        }
      }
    };
  }
}
