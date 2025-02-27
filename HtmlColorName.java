/**
 * HTML color name definitions
 */
public enum HtmlColorName {
  DARK_RED("dark red", 139, 0, 0),
  DODGER_BLUE("dodger blue", 30, 144, 255),
  MAROON("maroon", 128, 0, 0),
  MIDNIGHT_BLUE("midnight blue", 25, 25, 112),
  CRIMSON("crimson", 220, 20, 60);

  /**
   * name
   */
  private final String name;

  /**
   * Red(0 - 255)
   */
  private final int red;

  /**
   * Green(0 - 255)
   */
  private final int green;

  /**
   * Blue(0 - 255)
   */
  private final int blue;

  /**
   * Constructor
   * 
   * @param n name
   * @param r red([0,255])
   * @param g green([0,255])
   * @param b blue([0,255])
   */
  HtmlColorName(final String n, final int r, final int g, final int b) {
    name = n;
    red = r;
    green = g;
    blue = b;
  }

  /**
   * Get name
   * 
   * @return name
   */
  public String getName() {
    return name;
  }

  /**
   * Get red value
   * 
   * @return red([0,255])
   */
  public int getRed() {
    return red;
  }

  /**
   * Get green value
   * 
   * @return green([0,255])
   */
  public int getGreen() {
    return green;
  }

  /**
   * Get blue value
   * 
   * @return blue([0,255])
   */
  public int getBlue() {
    return blue;
  }

  /**
   * Get hue value
   * 
   * @return hue([0,360])
   */
  public float getHue() {
    if (red == green && green == blue) {
      return 0;
    }

    /*
     * Rが最大値の場合 色相 H = 60 × ((G - B) ÷ (MAX - MIN))
     * Gが最大値の場合 色相 H = 60 × ((B - R) ÷ (MAX - MIN)) + 120
     * Bが最大値の場合 色相 H = 60 × ((R - G) ÷ (MAX - MIN)) + 240
     */
    final float diff = getMax() - getMin();
    float hue = 0;
    if (blue <= red && green <= red) {
      hue = 60 * ((green - blue) / diff);
    } else if (blue <= green && red <= green) {
      hue = 60 * ((blue - red) / diff) + 120;
    } else {
      hue = 60 * ((red - green) / diff) + 240;
    }
    return hue < 0 ? hue + 360 : hue;
  }

  /**
   * Get saturation value
   * 
   * @return saturation([0,1])
   */
  public float getSaturation() {
    final int max = getMax();
    return (max - getMin()) / (float)max;
  }

  /**
   * Get saturation value as integer
   * 
   * @return saturation([0,100])
   */
  public int getSaturationAsInt() {
    return Math.round(getSaturation() * 100);
  }

  /**
   * Get brightness value
   * 
   * @return brightness([0,1])
   */
  public float getBrightness() {
    return getMax() / 255.0f;
  }

  /**
   * Get brightness value as integer
   * 
   * @return brightness([0,100])
   */
  public int getBrightnessAsInt() {
    return Math.round(getBrightness() * 100);
  }

  @Override
  public String toString() {
    return String.format("%s(%d, %d, %d)", name, red, green, blue);
  }

  private int getMax() {
    return Math.max(Math.max(red, green), blue);
  }

  private int getMin() {
    return Math.min(Math.min(red, green), blue);
  }
}
