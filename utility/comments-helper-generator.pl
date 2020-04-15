#!/usr/bin/perl
# Author       Akkadius
# @file        comments-helper-generator.pl
# @description Script used to generate script comment helpers
# @example     perl ./utility/comments-helper-generator.pl ~/server
# @options     --strip-existing-comments Will only over-write comments this script typically generates

#############################################
# modules
#############################################
use warnings FATAL => 'all';
no warnings 'experimental::smartmatch';
use experimental 'smartmatch';
use File::Find;
use Data::Dumper;
use DBI;
use DBD::mysql;
use JSON;
use File::Path;
use File::Find;
use Scalar::Util qw(looks_like_number);

my $json = new JSON();

#############################################
# args
#############################################
my $server_path = $ARGV[0];
my $config_path = $server_path . "/eqemu_config.json";

my $i       = 0;
my %options = ();
while ($ARGV[$i]) {
    $options{$ARGV[$i]} = ($ARGV[$i + 1] ? $ARGV[$i + 1] : 1);
    $i++;
}

#############################################
# validate config
#############################################
if (!-e $config_path) {
    print "Error! Config file [$config_path] not found\n";
    exit;
}

#############################################
# database config
#############################################
my $content;
open(my $fh, '<', $config_path) or die "cannot open file $config_path"; {
    local $/;
    $content = <$fh>;
}
close($fh);

#############################################
# database
#############################################
my $config        = $json->decode($content);
my $database_name = $config->{"server"}{"database"}{"db"};
my $host          = $config->{"server"}{"database"}{"host"};
my $user          = $config->{"server"}{"database"}{"username"};
my $pass          = $config->{"server"}{"database"}{"password"};
my $dsn           = "dbi:mysql:$database_name:$host:3306";
my $connect       = DBI->connect($dsn, $user, $pass);

my $query_handle;

#############################################
# npc
#############################################
$query_handle = $connect->prepare("SELECT `id`, `name`, `lastname` FROM `npc_types`");
$query_handle->execute();

while (@row             = $query_handle->fetchrow_array()) {
    $npc_names{$row[0]} = ($row[1] . ($row[2] ? ' ' . $row[2] : ''));
}

#############################################
# spells
#############################################
$query_handle = $connect->prepare("SELECT `id`, `name` FROM `spells_new`");
$query_handle->execute();

while (@row               = $query_handle->fetchrow_array()) {
    $spell_names{$row[0]} = ($row[1]);
}

#############################################
# items
#############################################
$query_handle = $connect->prepare("SELECT `id`, `Name` FROM `items`");
$query_handle->execute();

while (@row              = $query_handle->fetchrow_array()) {
    $item_names{$row[0]} = ($row[1]);
}

#############################################
# factions
#############################################
$query_handle = $connect->prepare("SELECT `id`, `name` FROM `faction_list`");
$query_handle->execute();
while (@row                 = $query_handle->fetchrow_array()) {
    $faction_names{$row[0]} = ($row[1]);
}

#############################################
# zone
#############################################
$query_handle = $connect->prepare("SELECT `zoneidnumber`, `short_name` FROM `zone`");
$query_handle->execute();
while (@row              = $query_handle->fetchrow_array()) {
    $zone_names{$row[0]} = ($row[1]);
}

my @files;
my $start_dir = ".";
find(
    sub { push @files, $File::Find::name unless -d; },
    $start_dir
);
for my $file (@files) {

    if ($file =~ /generator/i) { next; }
    if ($file !~ /lua|pl/i) { next; }
    print $file . "\n";

    if ($file =~ /\.lua|\.pl/i) {
        my $print_buffer = "";

        open(FILE, $file);
        while (<FILE>) {
            my $line = $_;

            my $npc_id_to_comment     = 0;
            my $spell_id_to_comment   = 0;
            my $item_id_to_comment    = 0;
            my $faction_id_to_comment = 0;
            my $zone_id_to_comment    = 0;

            my $npc_names  = "";
            my $item_names = "";

            if ($options{"--strip-existing-comments"}) {
                if ($line=~/;/ && $line =~ /Spell:|NPC:|NPC\(s\):|Faction:|Zone:|Item:|Item\(s\):/ && $line !~/End of File|EOF|then|if|else/i) {
                    if ($file =~ /\.lua/) {
                        print $line . "\n";
                        $line =~ s/--(.*)//;
                    }
                    if ($file =~ /\.pl/) {
                        print $line . "\n";
                        $line =~ s/#(.*)//;
                    }
                    $line =~ s/\s+$/\n/g;
                }
            }

            if ($line !~ /#|}|--|if|else|End of File|EOF/i) {

                my $comment_prefix = "";
                if ($file =~ /\.pl/) {
                    $comment_prefix = "#";
                }
                if ($file =~ /\.lua/) {
                    $comment_prefix = "--";
                }

                ##########################
                #::: NPC's
                ##########################

                if ($line =~ /unique_spawn|spawn2|signal|depop_all|GetNPCByNPCTypeID|IsMobSpawnedByNpcTypeID/i) {
                    if ($line =~ /ChooseRandom/i) {
                        my @split   = split(quotemeta("ChooseRandom("), $line);
                        my @split_2 = split(quotemeta(")"), $split[1]);
                        my @split_3 = split(",", $split_2[0]);
                        foreach my $ids (@split_3) {
                            if ($ids > 0) {
                                my $npc_name = trim($npc_names{$ids});
                                if ($npc_name ne "") {
                                    $npc_names .= $npc_name . " (" . $ids . "), ";
                                }
                            }
                        }
                        if ($npc_names ne "") {
                            $npc_names = substr($npc_names, 0, -2);
                            $line =~ s/;/; $comment_prefix NPC(s): $npc_names/g;
                        }
                    }
                    else {
                        my @split = split('\(', $line);
                        foreach my $split_arg (@split) {
                            my @split_2 = split(",", $split_arg);
                            if (looks_like_number($split_2[0])) {
                                $npc_id_to_comment = trim($split_2[0]);
                            }
                        }
                        if ($npc_id_to_comment > 0) {
                            my $npc_name = trim($npc_names{$npc_id_to_comment});
                            if ($npc_name ne "") {
                                $line =~ s/;/; $comment_prefix NPC: $npc_name/g;
                            }
                        }
                    }
                }

                ##########################
                #::: Spells
                ##########################

                if ($line =~ /AddAISpell|RemoveAISpell|CastSpell/i) {
                    my @split     = split('\(', $line);
                    my $split_arg = $split[1];
                    my @split_2   = split(",", $split_arg);
                    if (looks_like_number($split_2[0])) {
                        $spell_id_to_comment = trim($split_2[0]);
                    }
                }
                if ($spell_id_to_comment > 0) {
                    my $spell_name = trim($spell_names{$spell_id_to_comment});
                    if ($spell_name ne "") {
                        $line =~ s/;/; $comment_prefix Spell: $spell_name/g;
                    }
                }

                ##########################
                #::: Items
                ##########################

                if ($line =~ /SummonItem|HasItem/i) {
                    if ($line =~ /ChooseRandom/i) {
                        my @split   = split(quotemeta("ChooseRandom("), $line);
                        my @split_2 = split(quotemeta(")"), $split[1]);
                        my @split_3 = split(",", $split_2[0]);
                        foreach my $ids (@split_3) {
                            if ($ids > 0) {
                                my $item_name = trim($item_names{$ids});
                                if ($item_name ne "") {
                                    $item_names .= $item_name . " (" . $ids . "), ";
                                }
                            }
                        }
                        if ($item_names ne "") {
                            $item_names = substr($item_names, 0, -2);
                            $line =~ s/;/; $comment_prefix Item(s): $item_names/g;
                        }
                    }
                    else {
                        my @split = split('\(', $line);
                        foreach my $split_arg (@split) {
                            my @split_2 = ();
                            if ($line =~ /,/i) {
                                @split_2 = split(",", $split_arg);
                            }
                            else {
                                @split_2 = split(quotemeta(")"), $split_arg);
                            }
                            if (looks_like_number($split_2[0])) {
                                $item_id_to_comment = trim($split_2[0]);
                            }
                        }
                        if ($item_id_to_comment > 0) {
                            my $item_name = trim($item_names{$item_id_to_comment});
                            if ($item_name ne "") {
                                $line =~ s/;/; $comment_prefix Item: $item_name/g;
                            }
                        }
                    }
                }


                ##########################
                #::: Factions
                ##########################

                if ($line =~ /Faction/i) {
                    my @split     = split('\(', $line);
                    my $split_arg = $split[1];
                    if ($split_arg) {
                        my @split_2 = ();
                        if ($line =~ /,/i) {
                            @split_2 = split(",", $split_arg);
                        }
                        else {
                            @split_2 = split(quotemeta(")"), $split_arg);
                        }

                        if (looks_like_number($split_2[0])) {
                            $faction_id_to_comment = trim($split_2[0]);
                        }
                    }
                }
                if ($faction_id_to_comment > 0) {
                    my $faction_name = trim($faction_names{$faction_id_to_comment});
                    if ($faction_name ne "") {
                        $line =~ s/;/; $comment_prefix Faction: $faction_name/g;
                    }
                }

                ##########################
                #::: Zones
                ##########################

                if ($line =~ /MovePC/i) {
                    my @split     = split('\(', $line);
                    my $split_arg = $split[1];
                    my @split_2   = ();
                    if ($line =~ /,/i) {
                        @split_2 = split(",", $split_arg);
                    }
                    else {
                        @split_2 = split(quotemeta(")"), $split_arg);
                    }

                    if (looks_like_number($split_2[0])) {
                        $zone_id_to_comment = trim($split_2[0]);
                    }
                }

                #::: We have a valid Spell ID
                if ($zone_id_to_comment > 0) {
                    my $zone_name = trim($zone_names{$zone_id_to_comment});
                    if ($zone_name ne "") {
                        $line =~ s/;/; $comment_prefix Zone: $zone_name/g;
                    }
                }

            }
            $print_buffer .= $line;
        }
        close(FILE);

        #::: Write changes
        open(NEW_FILE, '>', $file);
        print NEW_FILE $print_buffer;
        close NEW_FILE;

    }

}

#::: Trim Whitespaces
sub trim {
    my $string = $_[0];
    if (!defined $string) {
        return "";
    }

    $string =~ s/^\s+//;
    $string =~ s/\s+$//;
    return $string;
}
