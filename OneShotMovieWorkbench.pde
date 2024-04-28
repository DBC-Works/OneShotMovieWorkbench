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

import processing.sound.Amplitude;
import processing.sound.SoundFile;

private int TARGET_FRAME_RATE;
private boolean BIND_FRAMES;

private FrameMaker maker;
private FrameRecorder recorder;
private FrameRecorder getFrameRecorder() {
  return recorder;
}

private String soundFilePath;
private SoundFile soundFile;
private SoundFile getSoundFile() {
  return soundFile;
}
private int length;
private int getLength() {
  return length;
}
private int getTotalFrameCount(int min, int sec, int fr) {
  return ((min * 60) + sec) * TARGET_FRAME_RATE + fr;
}
private Amplitude amplitude;
private Amplitude getAmplitude() {
  return amplitude;
}

private int calcLengthFromSoundFile() {
  assert soundFile != null;

  final float duration = soundFile.duration();
  final double s = Math.floor(duration);
  final double ms = duration - s;
  final int lengthMin = (int)Math.floor(s / 60);
  final int lengthSec = (int)s % 60;
  final int lengthFrame = (int)Math.ceil(ms * TARGET_FRAME_RATE);
  return getTotalFrameCount(lengthMin, lengthSec, lengthFrame);
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
  //size(1280, 720);

  // TODO: Set frame maker
  maker = new SampleMaker();
  
  // TODO: Set setting variables
  TARGET_FRAME_RATE = 24;
  //TARGET_FRAME_RATE = 8;
  BIND_FRAMES = false;
  //soundFilePath = "(Write absolute file path of sound file here and enable this line)";

  if (soundFilePath != null) {
    soundFile = new SoundFile(this, soundFilePath);
    length = calcLengthFromSoundFile();
    amplitude = new Amplitude(this);
    amplitude.input(soundFile);
  } else {
    length = BIND_FRAMES != false ? getTotalFrameCount(5, 0, 0) : Integer.MAX_VALUE;
  }
  
  if (BIND_FRAMES != false) {
    recorder = createFrameRecorderInstanceOf(FrameRecorderType.AsyncRecorder);
  }

  frameRate(TARGET_FRAME_RATE);
  maker.setup();
  smooth();
  if (soundFile != null) {
    soundFile.play();
  }
}
void draw() {
  if (frameRate < (TARGET_FRAME_RATE - 2)) {
    println("(frame dropped at " + frameCount + "(frameRate=" + frameRate + "))");
  }
  maker.draw();
  if (recorder != null) {
    recorder.recordFrame();
  }
  
  if (getLength() <= frameCount) {
    if (soundFile != null) {
      soundFile.stop();
      soundFile = null;
    }
    if (recorder != null) {
      recorder.finish();
      if (BIND_FRAMES != false) {
        recorder.bindTo("movie.mp4", soundFilePath, TARGET_FRAME_RATE);
      }
      recorder = null;
    }
    exit();
  }
}

