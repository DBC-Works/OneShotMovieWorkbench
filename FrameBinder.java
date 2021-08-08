import java.io.File;
import java.io.FileFilter;
import java.io.IOException;

/**
 * Frame binder
 */
final public class FrameBinder {
  private final String movieFileName;
  private final String path;
  private final String imgExt;
  private final int rate;

  /**
   * constructor
   * 
   * @param fileName   Movie file name to bind
   * @param targetPath Path where image files exist
   * @param ext        Extension of target image file name
   * @param frameRate  Movie file frame rate(per second)
   */
  public FrameBinder(String fileName, String targetPath, String ext, int frameRate) {
    movieFileName = fileName;
    path = targetPath;
    imgExt = ext;
    rate = frameRate;
  }

  /**
   * Bind image files to a movie file
   */
  public void bind() {
    try {
      final File imgDir = new File(path);

      final File movie = new File(imgDir, movieFileName);
      if (movie.exists()) {
        movie.delete();
      }

      execFfmpeg(imgDir);
      deleteFrames(imgDir);
    } catch (IOException e) {
      e.printStackTrace();
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
  }

  private void execFfmpeg(File imgDir) throws IOException, InterruptedException {
    final String[] cmd = { "ffmpeg", "-framerate", Integer.toString(rate), "-i", String.format("%%08d.%s", imgExt),
        "-pix_fmt", "yuv420p", movieFileName };
    final ProcessBuilder processBuilder = new ProcessBuilder(cmd);
    processBuilder.redirectErrorStream(true);
    processBuilder.inheritIO();
    processBuilder.directory(imgDir);
    final Process process = processBuilder.start();
    process.waitFor();
    process.destroy();
  }

  private void deleteFrames(File imgDir) {
    final File[] files = imgDir.listFiles(new FileFilter() {
      public boolean accept(File pathname) {
        return pathname.getName().endsWith(imgExt);
      }
    });
    for (File file : files) {
      file.delete();
    }
  }
}
