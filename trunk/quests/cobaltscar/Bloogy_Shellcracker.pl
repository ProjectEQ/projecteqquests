# Quest requires 5 items.  Extra code allows this to happen.  There's probably a better way to do it, but oh well.

my $first_item = 0;
my $second_item = 0;
my $third_item = 0;

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, strange one. I am Bloogy Shellcracker, the preparer of meals for my people. I am not familiar with the culinary tastes of your kind but you are welcome to purchase some of my supplies. I will also barter for ingredients to some of my exotic dishes.");
  }
  if ($text=~/ingredients/i) {
    quest::say("The rarest treat I can prepare for my people is saucy salted seadragon steak. I wish to barter for some water dragon or sea dragon meat, saltwater seaweed, and fish eggs. The rest of the ingredients are collected locally by our collectors.");
  }
  if ($text=~/flags/i) {
    quest::say("$first_item $second_item $third_item");
  }
}

sub EVENT_ITEM {
  if ($itemcount{19113} > 0) {
    $first_item = $first_item + $itemcount{19113};
  }
  if ($itemcount{16498} > 0) {
    $second_item = $second_item + $itemcount{16498};
  }
  if ($itemcount{22813} > 0) {
    $third_item = $third_item + $itemcount{22813};
  }
  if ($itemcount{22812} > 0) {
    $third_item = $third_item + $itemcount{22812};
  }

  if (($first_item >= 2) && ($second_item >= 2) && ($third_item >= 1)) {
    $first_item = 0;
    $second_item = 0;
    $third_item = 0;
    quest::emote("claps enthusiastically and hands you your reward.");  # text made up
    quest::summonitem(28514);
    quest::exp(150000);
    quest::faction(241, 30);
    quest::faction(345, -60);
  }

}

# Quest by mystic414