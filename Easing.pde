/**
 * Easing value calculator
 * @see https://easings.net/ja
 */
final class Easing {
  /**
   * Get in-out-cubic
   *
   * @param x Source value(0<=x<=1)
   * @return Caluclated value
   */
  float easeInOutCubic(float x) {
    return x < 0.5 ? 4 * x * x * x : 1 - pow(-2 * x + 2, 3) / 2;
  }
}