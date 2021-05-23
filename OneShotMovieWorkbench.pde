import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Iterator;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import java.text.MessageFormat;
import java.io.FileFilter;

private int TARGET_FRAME_RATE;
private boolean BIND_FRAMES;

private FrameMaker maker;
private FrameRecorder recorder;

private int length;
private int getLength() {
  return length;
}
private int getTotalFrameCount(int min, int sec, int fr) {
  return ((min * 60) + sec) * TARGET_FRAME_RATE + fr;
}

/**
 * Get progress
 * @return Progress(percentage)
 */
float getProgress() {
  return frameCount / (float)getLength();
}

void setup() {
  size(1280, 720, P3D);

  // TODO: Set frame maker
  maker = new SampleMaker();

  // TODO: Set setting variables
  TARGET_FRAME_RATE = 24;
  BIND_FRAMES = true;
  length = Integer.MAX_VALUE;
  //recorder = createFrameRecorderInstanceOf(FrameRecorderType.AsyncRecorder);
  //length = getTotalFrameCount(3, 27, 13);

  frameRate(TARGET_FRAME_RATE);
  maker.setup();
  smooth();
}
void draw() {
  maker.draw();
  if (recorder != null) {
    recorder.recordFrame();
  }
  
  if (getLength() <= frameCount) {
    if (recorder != null) {
      recorder.finish();
      if (BIND_FRAMES != false) {
        final String targetPath = MessageFormat.format("{0}{1}img", sketchPath(), File.separator);
        recorder.bindTo("movie.mp4", targetPath, TARGET_FRAME_RATE);
      }
      recorder = null;
    }
    exit();
  }
}

