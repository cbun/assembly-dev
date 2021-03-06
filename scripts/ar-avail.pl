
use strict;
use Carp;
use Data::Dumper;
use Getopt::Long;
Getopt::Long::Configure("pass_through");

my $usage = <<End_of_Usage;

Usage: ar-avail [-h]

List available AssemblyRAST modules

Optional arguments:
  -h, --help  show this help message and exit

End_of_Usage

my $help;
my $server;

my $rc = GetOptions("h|help" => \$help,
                    "s=s" => \$server);

$rc or die $usage;
if ($help) {
    print $usage;
    exit 0;
}

# my $target = $ENV{HOME}. "/kb/assembly";
# my $arast  = "ar_client/ar_client/ar_client.py";
# system "$target/$arast avail @ARGV";

my $arast = 'arast';
$arast .= " -s $server" if $server;

system "$arast avail @ARGV";
                    
