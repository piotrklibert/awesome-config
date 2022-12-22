package brightness;

import awful.Wibox;
import awful.Widget;
import utils.lua.Macro;
import utils.lua.Macro.T;
import utils.lua.Macro.wrapN;
import sys.io.File;
import lua.Io.popen;
import awful.Spawn.NativeSpawn;
import lib.Globals.Env;

using Safety;
using StringTools;


enum State {
    InProgress(val: Float);
    Ready(val: Float);
}


@:nullSafety(Strict)
private class Reader {
    public static inline function readInt(filePath: String): Int {
        return Std.parseInt(File.getContent(filePath).trim()).sure();
    }
}


@:expose
@:nullSafety(Strict)
class BrightnessWidget {
    static final FONT = "mono 12";
    static final PATH_TO_ICON = "/home/cji/.config/awesome/haxeshigh/res/br-wid-1.png";
    static final BACKLIGHT_PATH = "/sys/class/backlight/intel_backlight/brightness";
    static final MAX_BRIGHTNESS_PATH = "/sys/class/backlight/intel_backlight/max_brightness";

    static final max: Int = get_max_brightness();

    var state: State;
    var widget: Null<awful.Widget>;
    var brightnessWidget: Null<awful.Widget>;


    public function new() {
        state = Ready(get_percent_brightness());
    }

    private static function get_max_brightness() {
        return Reader.readInt(MAX_BRIGHTNESS_PATH);
    }

    public static function get_percent_brightness() {
        final val = Reader.readInt(BACKLIGHT_PATH);
        return Std.int(val / max * 100);
    }

    public function set_brightness(percent: Float): Int {
        if (!(percent >= 0 && percent <= 100)) return -1;
        final val = Std.int(percent / 100 * max);
        final cmd = 'sudo bash -c "echo ${val} >${BACKLIGHT_PATH}"';
        state = InProgress(percent);
        NativeSpawn.easy_async(cmd, (_) -> {
            state = Ready(get_percent_brightness());
        });
        return val;
    }

    private inline function makeText(txt: String) {
        return T({widget: Wibox.widget.textbox, font: FONT, text: txt});
    }

    private inline function makeSeparator(thickness: Int = 1) {
        return wrapN(
            {top: 3, bottom: 3, widget: Wibox.container.margin},
            {
                thickness: thickness,
                forced_width: 5,
                widget: Wibox.widget.separator
            }
        );
    }

    // TODO: refactor, handle errors better, fix package definition after
    public function w(): Widget {
        final brightness_text =
            Widget.widget(makeText(' ${get_percent_brightness()}%'));

        final brightnessIcon = T({
            widget: Wibox.widget.imagebox,
            image: PATH_TO_ICON,
            resize: false,
            forced_width: 25
        });

        this.brightnessWidget = wrapN(
            {layout: Wibox.layout.fixed.horizontal, forced_width: 85},
            wrapN(
                {top: 5, widget: Wibox.container.margin},
                brightnessIcon
            ),
            brightness_text
        );

        this.widget = Widget.widget(wrapN(
            {
                widget: Wibox.layout.align.horizontal, id: "brightness",
            },
            this.brightnessWidget,
            makeSeparator(),
            PowerWidget.getWidget()
        ));

        this.connect_signals(brightness_text);
        return this.widget.unsafe();
    }

    private extern inline function connect_signals(brightness_text: Widget) {
        this.widget.sure().connect_signal("button::press", (_, _, _, button) -> {
            final percent = get_percent_brightness();
            switch [state, button] {
            case [InProgress(_), _]: return;
            case [Ready(_), 4]:
                // mouse wheel up - brightness increase
                brightness_text.set_text(" " + Math.min(percent + 5, 100) + "%");
                set_brightness(Math.min(percent + 5, 100));
            case [Ready(_), 5]:
                // mouse wheel down - brightness decrease
                brightness_text.set_text(" " + Math.max(percent - 5, 0) + "%");
                set_brightness(Math.max(percent - 5, 0));
            default:
            }
        });
    }
}

@:nullSafety(Strict)
class PowerWidget {
    public static function getWidget(): Widget {
        final power_widget = Widget.widget(
            T({color: "#777777", widget: Wibox.widget.textbox})
        );
        final short = ["5/5",      "PERF",        "BAT"        ];
        final long  = ["balanced", "performance", "power-saver"];
        var state = long.indexOf(popen("sudo powerprofilesctl get").read());
        power_widget.set_text(short[state]);
        power_widget.connect_signal("button::press", (_, _, _, button) -> {
            if (button != 1) return;
            if (++state > 2) { state = 0; }
            power_widget.set_text(short[state]);
            NativeSpawn.easy_async('sudo powerprofilesctl set ${long[state]}', (x) -> {});
        });
        return wrapN({left: 10, widget: Wibox.container.margin}, power_widget);
    }
}


// Local Variables:
// haxe-module: "hx_brightness"
// End:
