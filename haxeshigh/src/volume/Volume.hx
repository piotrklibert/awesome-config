package volume;

import lua.Table;
import lua.Table.AnyTable;
import haxe.Rest;

import lib.Inspect.inspect;

import awful.Naughty;
import awful.Wibox;
import utils.lua.Macro.T;
import utils.lua.Macro.A;
import utils.lua.Macro.wrap1;
import taglist.TaglistAnimator;
import haxe.ds.Option;
import awful.Spawn.spawn;
import awful.Spawn.NativeSpawn;

using Safety;
using utils.OptionTools;
using Lambda;
using StringTools;
using utils.lua.LuaTools;




@:tink
@:nullSafety(Strict)
class Settings {
    static inline final path_to_icons = "/home/cji/.config/awesome/icons";
    static inline final pamixer = "/usr/local/bin/pamixer";
    public static final GET_VOLUME_CMD  = [pamixer, "--get-volume", "--get-mute"];
    public static final INC_VOLUME_CMD  = ([pamixer, "-i", "5"]);
    public static final DEC_VOLUME_CMD  = ([pamixer, "-d", "5"]);
    public static final TOGGLE_MUTE_CMD = ([pamixer, "-t"]);
    public static final volume_to_icons = [
        0 => "audio-volume-muted-symbolic-red",
        25 => "audio-volume-muted-symbolic",
        50 => "audio-volume-low-symbolic",
        75 => "audio-volume-medium-symbolic",
        100 => "audio-volume-high-symbolic",
    ];

    public static function cmd_for_button(btn: String) {
        return switch Std.parseInt(btn) {
            case 4: INC_VOLUME_CMD;
            case 5: DEC_VOLUME_CMD;
            case 1: TOGGLE_MUTE_CMD;
            default: throw new haxe.Exception('bad button number: ${btn}');
        }
    }
    public static function choose_icon(vol: Null<Int>) {
        if (vol == null || vol <= 0) {
            return '${path_to_icons}/audio-volume-muted-symbolic-red.svg';
        }
        var icon_name: Null<String> = null;
        final keys = [for (k in volume_to_icons.keys()) k];
        keys.sort(Reflect.compare);
        for (k in keys) {
            if (vol <= k) {
                icon_name = volume_to_icons[k];
                break;
            }
        }
        if (icon_name != null)
            return '${path_to_icons}/${icon_name}.svg';
        else
            throw new haxe.Exception("Can't find icon for vol #{vol}");
    }
}


typedef State = {
    volume: Int,
    is_muted: Bool,
    icon: String,
    notification_widget: Null<awful.widget.Base>,
    volume_widget: Null<awful.widget.Base>,
};

class Volume {
    static final state: State = {
        volume: 100,
        is_muted: false,
        icon: Settings.choose_icon(100),
        notification_widget: null,
        volume_widget: null,
    };

    static function set_volume(stdout:String) {
        final words = stdout.trim().split(" ");
        state.is_muted = words[0] == "true";
        state.volume = Std.parseInt(words[1]);
        state.icon = Settings.choose_icon(if (!state.is_muted) state.volume else null);
    }

    static function update_widgets() {
        untyped state.volume_widget.icon.image = state.icon;
        var txt: String = "";
        if (state.notification_widget != null)
            txt = '${state.volume}%';
        if (state.is_muted)
            txt = "muted";
        untyped state.notification_widget.get_children_by_id("text")[1].text = txt;
    }

    static function handle_mouse(_, _, _, button: Int) {
        if (button == 3) {
            NativeSpawn.spawn("pavucontrol", {floating: true});
            return;
        }

        spawn(Settings.cmd_for_button(Std.string(button)))
            .flatMap((_) -> spawn(Settings.GET_VOLUME_CMD))
            .map((out) -> {
                set_volume(out);
                update_widgets();
            });
    }

    public static function main() {
        state.volume_widget = Wibox.makeWidget(wrap1(
            {
                layout: Wibox.container.margin,
                left: 5, right: 5, top: 1, bottom: 1
            },
            {
                id: "icon",
                resize: true,
                image: choose_icon(100),
                widget: Wibox.widget.imagebox,
            }
        ));
        untyped state.volume_widget.connect_signal("button::press", handle_mouse);
        //   state.volume_widget\connect_signal("mouse::enter",  this\popup_create)
          // state.volume_widget\connect_signal("mouse::leave",  this\popup_destroy)
        NativeSpawn.spawn("pavucontrol", {floating: true});

        trace(Settings.choose_icon(45));
        trace(Settings.choose_icon(78));
        trace(state);
    }
}
