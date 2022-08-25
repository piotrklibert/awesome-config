my @lines = 'moses.lua'.IO.lines;
# @lines.elems;

my $state = 1;
my @buf = [];
my @res = [];

$state = 1; @res = []; @buf = [];
for @lines -> $l {
    if $l.match(/'--- '/) { $state = 2 };
    if $state == 2 && $l.match(/^$/ | /' '* '--'/) { @buf.push($l) }
    elsif $state == 2 {
        $state = 1;
        say @buf;
        @res.push(@buf.clone);
        @buf = [];
    }
};
# 'out'.IO.spurt: to-json @res;
my $rr = do for @res -> $r {
    (
        $r[^$r.first(/'-- @'/, :k)],
        $r.first(/'@name'/),
        $r.grep(/'@param'/),
        $r.first(/'@return'/)
    ).deepmap(*.subst(/' '*'-'+/, ''))
};

sub f($r) {
    '// ' ~ $r[0].join ~ "\n" ~
    $r[2].map({'// ' ~ $_}).join("\n") ~ "\n" ~
    "// " ~ $r[3] ~ "\n" ~
    'public static function ' ~ $r[1].trim.split(/' '/)[1] ~ '(' ~
        $r[2].map({.trim.split: ' '}).map({.[1] ~ ': Dynamic'}).join(", ") ~
    "): Dynamic;\n\n"
};

'out2.txt'.IO.spurt($rr.map(&f).join );
