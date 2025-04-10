# items: 5316, 10527
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome! I am Vurgo, follower of Solusek Ro and holder of the [harvester] and the [Words of Darkness].");
  }
  if ($text=~/harvester/i) {
    quest::say("I can forge you one, but you will need to bring me the correct [scythe components].");
  }
  if ($text=~/scythe components/i) {
    quest::say("The first thing I need is a shadowed scythe from our mortal enemies, the shadowed men.");
  }
  if ($text=~/words of darkness/i) {
    quest::say("I can scribe for you the Words of Darkness, but you will need to bring me the correct [word components].");
  }
  if ($text=~/word components/i) {
    quest::say("The first thing that I need is a shadowed book from our mortal enemies, the shadowed men.");
  }
}

sub EVENT_ITEM {
  if (quest::handin({10538 => 1, 10031 => 1, 7331 => 1, 5103 => 1})) { # A Fungus Eye, Fire Opal, Shadowed Knife, Shadowed Scythe
    quest::summonitem(5316); # Harvester
  }
  elsif (quest::handin({10536 => 1, 10537 => 1, 10529 => 1})) { # Book of Darkness, Book of Frost, Shadowed Book
		quest::summonitem(10527); # Words of Darkness
  }
}
#END of FILE Zone:soltemple  ID:80016 -- Vurgo