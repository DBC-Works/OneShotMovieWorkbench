# OneShotMovieWorkbench

OneShotMovieWorkbench is a simple Processing sketch for edit to record drawing results.

## Requirements

OneShotMovieWorkbench needs [Processing 3.5 or later](https://processing.org/) to run.

If you want to make a movie file immediately, you need to install [FFmpeg](https://ffmpeg.org/) and set up your path for FFmpeg executable.

## Usage

1. Create a new class that implements the `FrameMaker` interface.
2. Edit the beginning of the `setup` function in `OneShotMovieWorkbench.pde` to set up the movie.
   - Dimension of the display window
   - Frame maker class to create frames
   - Frame rate per second
   - Bind frames to movie file immediately
   - Sound file path that play and merge into generated movie(option)
3. Run.

## Rules

### Commit message format

[Conventional Commits](https://www.conventionalcommits.org/)

## License

MIT
