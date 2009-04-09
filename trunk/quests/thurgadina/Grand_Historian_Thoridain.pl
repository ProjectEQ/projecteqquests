# snow griffin souffle portion of the 3rd coldain prayer shawl
# part of seventh coldain prayer shawl
#
# since there is no viable way for an untargetted npc to respond to a phrase
# (prayer to brell) said by the player the quest needs to be changed slightly.
# the player will recite the prayer to the grand historian a certain number
# of times to receive the etched rune pattern.

my $counter;

sub EVENT_SPAWN {
  $counter = 0;
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::signalwith(115015,99,0);
  }
  elsif ($text=~/Oh Brell, Thank you for protecting me and seeing me through my trials. Forgive me for the things I think and say and do that displease you. Please reveal to me your will and bless me with the patience and obedience to do that which you desire. Amen./i) {
    $counter += 1;
    if ($counter == 1) {
      quest::signalwith(115230,33,0);
    }
    elsif ($counter == 2) {
      quest::signalwith(115230,66,0);
    }
    elsif ($counter == 3) {
      quest::signalwith(115230,99,0);
      quest::summonitem(1855);
      $counter = 0;
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1418 => 1, 1428 => 1)) {
    quest::say("My compliments, $name, what a wonderful dish! Please accept my personal Seal as a token of my appreciation. May it give you power over your adversaries.");
    quest::summonitem(1422);
    quest::exp(200000);
  }
  elsif (plugin::check_handin(\%itemcount, 1428 => 1)) {
    quest::say("My compliments, $name, what a wonderful dish!");
    quest::exp(5000);
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::faction(49,10); #coldain
  quest::faction(67,10); #dain
  quest::faction(188,-30); #krif
  quest::faction(189,-30); #kzek
}

# EOF zone: thurgadina ID: 115135 NPC: Grand_Historian_Thoridain

