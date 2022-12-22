package brightness;

import pkg.PackageBase;
import log.Log;
import utils.lua.Macro.wrapN;
import utils.lua.Macro.T;
import brightness.BrightnessWidget;
import lib.Globals.Env;
import lib.Globals;
import awful.Mouse;
import awful.Wibox;
import awful.Timer;
import Math.round;

using Safety;
using Lambda;

import lib.Globals.Prelude.*;


class MyPopup {
	final timer: Timer;
	final wibox: Wibox;

	var pinned: Bool = false;

	public function new() {
        function centered(x: Int, y: Int) { return x - round(y / 2); }
		final coords = Mouse.get();
		final h = 215;
		final w = 495;
		final txt = lua.Package.cpath.split(";").join("\n");
		final wdg = Wibox.makeWidget(T({
			widget: Wibox.widget.textbox,
			text: txt // inspect(coords)
		}));
		this.wibox = new Wibox(T({
			x: centered(coords.x, w),
			y: centered(coords.y, h),
			height: h,
			width: w,
		}));
		wibox.setup(T({
			id: "bg",
			border_color: "#919191",
			border_width: 1,
			border_strategy: "inner",
			widget: wdg
		}));
		wibox.visible = true;
		this.timer = Timer.callInterval(0.1, () -> {
			if (!this.pinned) {
				final coords = Mouse.get();
				wibox.geometry({
			        x: centered(coords.x, w),
			        y: centered(coords.y, h),
                });
			}
		});
		wdg.connect_signal("button::release", () -> {
			this.pinned = !this.pinned;
		});
	}

	public function toggle() {
		this.wibox.visible = !this.wibox.visible;
	}
}

@:expose
@:nullSafety(Strict)
class Pkg extends PackageBase implements PackageDefinition {
	@:keep static function main() {
		// Env.set("MyPopup", new MyPopup());
	}

	public final name = "brightness";

	public static function instance()
		return new Pkg();

	public var widget:Null<BrightnessWidget> = null;

	public function get_widget():awful.Widget {
		return widget.sure().w();
	}

	public function start() {
		if (this.widget == null)
			this.widget = new BrightnessWidget();
	}

	public function stop() {
		final wb = this.widget.sure();
		// wb.visible = false;
		this.widget = null;
	}

	public function unload() {
		try
			this.stop()
		catch (_) {}
		Log.info('BRIGHTNESS(): unload!');
	}

	public function load() {
		Log.info('BRIGHTNESS() loaded!');
	}
}

// Local Variables:
// haxe-module: "hx_brightness"
// End:
