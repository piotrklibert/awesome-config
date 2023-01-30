package lib;

import externs.gears.Timer;

import lua.Coroutine;
import lua.Coroutine.resume;
import lua.Coroutine.status;

typedef FCallback = (Float) -> Void;
typedef FEasing = (Float) -> Float;


@:publicFields
@:build(lib.BuilderMacro.build())
class StepperBuilder {
    var easing: FEasing;
    var duration: Float;
    var framerate: Float;
    var callback: FCallback;
    var auto: Bool;
    var now: Bool;

    function build(): Stepper {
        final obj = new Stepper(
            this._duration
                ?? throw new haxe.Exception("duration is required"),
            this._framerate ?? Stepper.framerate,
            this._auto ?? true,
            this._now ?? this._auto ?? true,
            (this._easing != null)
                ? (x: Float) -> this._easing(x)
                : (x: Float) -> Easing.linear(x),
            ((x: Float) -> this._callback(x))
                            ?? throw new haxe.Exception("callback is required")
        );
        return obj;
    }
}


@:publicFields
class Stepper {
    static var builder(get, never): StepperBuilder;
    static function get_builder() { return StepperBuilder.inst;  }

    static final framerate = 0.020;  // 20ms - in seconds

    private var paused: Bool = false;
    private final timer: Timer;

    private var start_time: Float;

    /** the total animation time in s. */
    private final duration: Float;

    /** the function to calculate animation progress. Gets a time fraction from
      * 0 to 1, returns the animation progress, usually from 0 to 1. */
    private final easing = (Float) -> Float;

    /** the function to callback the animation. */
    private final callback: (Float) -> Void;

    function new(
        duration: Float,
        framerate: Float,
        auto: Bool,
        now: Bool,
        easing: FEasing,
        callback: FCallback
    ) {
        this.start_time = timestamp();

        this.easing = easing;
        this.callback = callback;
        this.duration = duration;

        this.timer = repeat(framerate, (_) -> this.step(), auto, now);
    }

    function step() {
        // time_fraction goes from 0 to 1
        if (this.paused) {
            this.start_time += framerate;
            return;
        }
        var time_fraction = (timestamp() - this.start_time) / this.duration;
        if (time_fraction > 1) time_fraction = 1;

        // calculate the current animation state
        final progress = this.easing(time_fraction);
        this.callback(progress);

        if (time_fraction >= 1) {
            this.timer.stop();
        }
    }

    function start() {
        this.step();
        this.timer.start();
    }
    function stop() { this.timer.stop(); }

    function pause() { this.paused = true; }
    function resume() { this.paused = false; }
}
