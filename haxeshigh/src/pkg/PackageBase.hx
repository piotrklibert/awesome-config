package pkg;

import haxe.Constraints;
import utils.lua.Globals;

using StringTools;


class PackageCommand {
  public final PackageManager = Globals.PackageManager;

  public final argFilePath =
    "/home/cji/portless/lua/awesome-config/haxeshigh/tmp/loading";

  public function getPackage(): String
    return sys.io.File.getContent(argFilePath).trim();

  public function new(){}
}


interface PackageDefinition {
  public final name: String;
  public function load(): Void;
  public function start(): Void;
  public function stop(): Void;
  public function unload(): Void;
}

// @:generic
// class PackageBase<T: Constructible<() -> Void> > {
class PackageBase {
  private function new(){}
}