/**
 * Drawing Piece
 */
public interface DrawingPiece {
  /**
   * Draw piece
   */
  public void draw();
}

/**
 * Conditional drawing Piece
 */
public interface ConditionalDrawingPiece extends DrawingPiece {
  /**
   * Can draw?
   */
  default boolean canDraw() {
    return false;
  }
}
