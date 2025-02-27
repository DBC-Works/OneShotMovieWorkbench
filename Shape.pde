/**
 * Shape drawer
 */
final class Shape {
  /**
   * Draw regular polygon
   * @param radius Radius
   * @param number Number of sides
   * @param pos Position to draw
   */
  void polygon(float radius, int number, PVector pos) {
    beginShape();
    for (float angle = 0; angle < TWO_PI; angle += (TWO_PI / number)) {
      vertex(pos.x + (radius * cos(angle)), pos.y + (radius * sin(angle)), pos.z);
    }
    endShape(CLOSE);
  }
}