use strict;

use Time::HiRes qw(time);

my @regexps = (
	"Twain",
	"(?i)Twain",
	"[a-z]shing",
	"Huck[a-zA-Z]+|Saw[a-zA-Z]+",
	'\b\w+nn\b',
	"[a-q][^u-z]{13}x",
	"Tom|Sawyer|Huckleberry|Finn",
	"(?i)Tom|Sawyer|Huckleberry|Finn",
	".{0,2}(Tom|Sawyer|Huckleberry|Finn)",
	".{2,4}(Tom|Sawyer|Huckleberry|Finn)",
	"Tom.{10,25}river|river.{10,25}Tom",
	"[a-zA-Z]+ing",
	'\s[a-zA-Z]{0,12}ing\s',
	'([A-Za-z]awyer|[A-Za-z]inn)\s',
	'["\'][^"\']{0,30}[?!\.]["\']',
	'\p{Sm}',
);


my $tString = '';

{
    local $/;
    $tString = <STDIN>;
}

printf("testing on %d bytes\n", length($tString));

my $sTime = time();

foreach my $re (@regexps) {
    my @matches = $tString =~ m/$re/g
}

printf("perl regexp: %fs\n", time()-$sTime)
