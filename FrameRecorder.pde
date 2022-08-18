// if you want to use <a href="https://www.funprogramming.org/VideoExport-for-Processing/">Video Export</a>,
// delete comment after this comment.
//import com.hamoid.*;

/**
 * FrameRecorder abstract class
 */
abstract class FrameRecorder {
  abstract void recordFrame();
  abstract void bindTo(String fileName, int frameRate);
  abstract void bindTo(String fileName, String soundFilePath, int frameRate);
  abstract void finish();

  protected String getRecordPath() {
    return MessageFormat.format(
      "{0}{1}img",
      sketchPath(),
      File.separator
    );
  }

  protected String makeImageFileName(String fileNameFormat) {
    return MessageFormat.format(
      "img{0}{1}",
      File.separator,
      fileNameFormat
    );
  }
}

/**
 * Synchronous frame recorder
 */
final class SyncFrameRecorder extends FrameRecorder {
  private final String imgExt;
  private final String frameFormat;

  SyncFrameRecorder(String ext) {
    imgExt = ext;
    frameFormat = makeImageFileName("########." + ext);
  }

  void recordFrame() {
    saveFrame(frameFormat);
  }

  void bindTo(String fileName, int frameRate) {
    new FrameBinder(fileName, getRecordPath(), imgExt, null, frameRate).bind();
  } 

  void bindTo(String fileName, String soundFilePath, int frameRate) {
    new FrameBinder(fileName, getRecordPath(), imgExt, soundFilePath, frameRate).bind();
  } 

  void finish() {
  } 
}

/**
 * Asynchronous frame recorder
 */
final class AsyncFrameRecorder extends FrameRecorder {
  private final ExecutorService executor = Executors.newCachedThreadPool();
  private final List<Future<?>> futures = new ArrayList<Future<?>>();
  
  AsyncFrameRecorder() {
  }

  void recordFrame() {
    if (executor.isShutdown()) {
      return;
    }

    loadPixels();

    final int[] savePixels = Arrays.copyOf(pixels, pixels.length);
    final long saveFrameCount = frameCount;
    Runnable saveTask = new Runnable() {
      public void run() {
        final PImage frameImage = createImage(width, height, HSB);
        frameImage.pixels = savePixels;
        final String saveFilePath = makeImageFileName(formatFileName(saveFrameCount));
        frameImage.save(saveFilePath);
      }
    };
    
    Iterator<Future<?>> it = futures.iterator();
    while (it.hasNext()) {
      final Future<?> f = it.next();
      if (f.isDone()) {
        it.remove();
      }
    }
    futures.add(executor.submit(saveTask));
  }

  void bindTo(String fileName, int frameRate) {
    new FrameBinder(fileName, getRecordPath(), "jpg", null, frameRate).bind();
  }

  void bindTo(String fileName, String soundFilePath, int frameRate) {
    new FrameBinder(fileName, getRecordPath(), "jpg", soundFilePath, frameRate).bind();
  } 

  void finish() {
    final File expectFilePath = new File(getRecordPath(), formatFileName(frameCount));
    for (int i = 0; i < 10; ++i) {
      try {
        Thread.sleep(1000);
      }
      catch (InterruptedException e) {
      }
      if (expectFilePath.exists()) {
        break;
      }
    }
    
    for (Future<?> f : futures) {
      if (f.isDone() == false && f.isCancelled() == false) {
        try {
          f.get();
        }
        catch (InterruptedException e) {
        }
        catch (ExecutionException e) {
        }
      }
    }
    if (executor.isShutdown() == false) {
      executor.shutdown();
      try {
        if (executor.awaitTermination(5, TimeUnit.SECONDS) == false) {
          executor.shutdownNow();
          executor.awaitTermination(5, TimeUnit.SECONDS);
        }
      }
      catch (InterruptedException e) {
        executor.shutdownNow();
      }
    }
  }

  private String formatFileName(long frameCount) {
    return String.format("%08d.jpg", frameCount);
  }
}

/*
final class VideoExportRecorder extends FrameRecorder {
  private final VideoExport videoExport;
  
  VideoExportRecorder(PApplet applet) {
    videoExport = new VideoExport(applet, "movie.mp4");
    videoExport.startMovie();
  }

  void recordFrame() {
    videoExport.saveFrame();
  }
  

  void bindTo(String fileName, int frameRate) {
    // Do nothing.
  }

  void bindTo(String fileName, String soundFile, int frameRate) {
    throw new java.lang.UnsupportedOperationException();
  }

  void finish() {
    videoExport.endMovie();
  }
}
 */

enum FrameRecorderType {
  //VideoExportRecorder,
  SyncTgaRecorder,
  SyncPngRecorder,
  AsyncRecorder
}

FrameRecorder createFrameRecorderInstanceOf(FrameRecorderType type) {
  switch (type) {
    /*
    case VideoExportRecorder:
      return new VideoExportRecorder(this);
     */
    case SyncTgaRecorder:
      return new SyncFrameRecorder("tga");
    case SyncPngRecorder:
      return new SyncFrameRecorder("png");
    case AsyncRecorder:
      return new AsyncFrameRecorder();
    default:
      throw new RuntimeException();
  }
}
