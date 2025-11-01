## Translocator_Chan.pl
# Zone: Bazaar
# Purpose: Teleports players to common city/plane hubs via clean menu + DRY handler.

sub EVENT_SAY {
  my %DESTS = (
    "Greater Faydark"        => [54,   67.30,   389.55,   25.33],
    "North Qeynos"           => [2,   -54.21,   436.00,    3.33, 119],
    "West Freeport"          => [9,   197.38,   108.63,  -21.03],
    "Misty Thicket"          => [33, -2127.69,  362.05,   -4.96],
    "Toxxulia Forest"        => [38,  242.42,  2211.27,  -46.37],
    "Nektulos Forest"        => [25, -917.10,  1928.21,   18.31],
    "Innothule Swamp"        => [46, -170.46, -2590.76,  -18.02],
    "The Feerrott"           => [47,  239.81,  1239.50,   -0.48],
    "Halas"                  => [30,  673.33,  3196.61,  -60.77],
    "Steamfont Mountains"    => [56,  554.70, -1603.22, -108.90],
    "Butcherblock Mountains" => [68, -220.70,  2758.13,    7.16],
    "Field of Bone"          => [78, 3061.57, -2011.65,   27.60],
    "Firiona Vie"            => [84, 1456.89, -2391.57,   -5.85],
    "The Overthere"          => [93, 1776.32,  3358.73,  -48.10],
    "Plane of Hate"          => [76, -349.22,  -387.16,    3.13],
    "Plane of Fear"          => [72, 1031.45,  -827.66,  101.60],
    "Cobaltscar"             => [117,-1633.66, -1066.62, 298.81],
    "Plane of Sky"           => [71,  539.00,  1384.00, -666.99],
    "Bazaar"                 => [151,-157.84,  -750.08,    4.10, 142],
    "Thurgadin"              => [118, -70.00,  -254.00,   98.00, 396],
    "East Wastes"            => [116, 478.02,  -4044.71,  145.64, 510.50],
    "West Wastes"            => [120,-3746.00, -4368.00, -114.00],
  );

  if ($text =~ /hail/i) {
    my $menu = _build_menu(\%DESTS);
    quest::say(
      "As a mage of the Academy of Arcane Sciences, I've devoted my life to studying magic and exploring Norrath. ".
      "Our guild offers teleportation services to adventurers. Jeeves stands ready outside your cities to assist you ".
      "with returning to the East Commons tunnel. I can offer you a secure journey back to the cities. ".
      "Choose your destination and I will ensure your safe passage:\n\n$menu"
    );
    return;
  }

  # Match exact destination names case-insensitively
  for my $name (keys %DESTS) {
    if ($text =~ /^\s*\Q$name\E\s*$/i) {
      _teleport($name, $DESTS{$name});
      return;
    }
  }
}

sub _build_menu {
  my ($href) = @_;
  # Sort alphabetically for a tidy menu
  my @names = sort { lc($a) cmp lc($b) } keys %{$href};
  my @lines = map { "[" . quest::saylink($_) . "]" } @names;
  # 4 columns-ish for readability (wrap every ~4 links)
  my $out = "";
  my $i = 0;
  for my $line (@lines) {
    $out .= $line . " ";
    $i++;
    if ($i % 4 == 0) { $out .= "\n"; }
  }
  return $out;
}

sub _teleport {
  my ($name, $ref) = @_;
  my ($zid, $x, $y, $z, $h) = @{$ref};
  quest::say("Off you go to $name!");
  if (defined $h) {
    quest::movepc($zid, $x, $y, $z, $h);
  } else {
    quest::movepc($zid, $x, $y, $z);
  }
}
