package ut;
import haxe.ds.Either;

class EitherTools {
  public static function left<T>(v: T): Either<T, Dynamic> {
    return Left(v);
  }
  public static function right<T>(v: T): Either<Dynamic, T> {
    return Right(v);
  }
}
