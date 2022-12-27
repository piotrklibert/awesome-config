package externs.wibox.widget;


@:luaRequire("wibox.widget.imagebox")
extern class Imagebox extends externs.wibox.widget.Base {
    /** A widget to display an image.
     * @see lib/wibox/widget/imagebox.lua:40
     */

    /**
     * The image rendered by the `imagebox`.
     * @see lib/wibox/widget/imagebox.lua:323
     */
    var image: image;

    /**
     * Set a clip shape for this imagebox.
     * @see lib/wibox/widget/imagebox.lua:412
     */
    var clip_shape: extype.extern.Mixed.Mixed2<haxe.Constraints.Function, externs.gears.Shape>;

    /**
     * Should the image be resized to fit into the available space?
     * @see lib/wibox/widget/imagebox.lua:445
     */
    var resize: Bool;

    /**
     * Allow the image to be upscaled (made bigger).
     * @see lib/wibox/widget/imagebox.lua:460
     */
    var upscale: Bool;

    /**
     * Allow the image to be downscaled (made smaller).
     * @see lib/wibox/widget/imagebox.lua:475
     */
    var downscale: Bool;

    /**
     * Set the SVG CSS stylesheet.
     * @see lib/wibox/widget/imagebox.lua:510
     */
    var stylesheet: String;

    /**
     * Set the SVG DPI (dot per inch).
     * @see lib/wibox/widget/imagebox.lua:547
     */
    var dpi: extype.extern.Mixed.Mixed2<Float, lua.Table<String, Dynamic>>;

    /**
     * Use the object DPI when rendering the SVG.
     * @see lib/wibox/widget/imagebox.lua:560
     */
    var auto_dpi: Bool;

    /**
     * Set the horizontal fit policy.
     * @see lib/wibox/widget/imagebox.lua:624
     */
    var horizontal_fit_policy: String;

    /**
     * Set the vertical fit policy.
     * @see lib/wibox/widget/imagebox.lua:647
     */
    var vertical_fit_policy: String;

    /**
     * The vertical alignment.
     * @see lib/wibox/widget/imagebox.lua:686
     */
    var valign: String;

    /**
     * The horizontal alignment.
     * @see lib/wibox/widget/imagebox.lua:725
     */
    var halign: String;

    /**
     * The maximum scaling factor.
     * @see lib/wibox/widget/imagebox.lua:746
     */
    var max_scaling_factor: Float;

    /**
     * Set the scaling aligorithm.
     * @see lib/wibox/widget/imagebox.lua:799
     */
    var scaling_quality: String;

    /** Set the `imagebox` image.
     *
     * @see lib/wibox/widget/imagebox.lua:334
     * @param image image  The image to render.
     */
    function set_image(image: image): Bool;

    /** Set a clip shape for this imagebox.
     *
     * @see lib/wibox/widget/imagebox.lua:424
     * @param clip_shape extype.extern.Mixed.Mixed2<haxe.Constraints.Function, externs.gears.Shape>  A `gears_shape` compatible shape function.
     */
    function set_clip_shape(clip_shape: extype.extern.Mixed.Mixed2<haxe.Constraints.Function, externs.gears.Shape>): Void;

    /** Returns a new `wibox.widget.imagebox` instance.
     *
     * @see lib/wibox/widget/imagebox.lua:850
     * @param image image  The image to display (may be `nil`).
     * @param resize_allowed Bool  If `false`, the image will be clipped, else it will be resized to fit into the available space.
     * @param clip_shape haxe.Constraints.Function  A `gears.shape` compatible function.
     */
    @:selfCall function new(image: image, resize_allowed: Bool, clip_shape: haxe.Constraints.Function): Void;
}

