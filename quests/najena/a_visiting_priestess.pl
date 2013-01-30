# Quest for The Visiting Priestess
# missing how player knows to ask questions
#
# Not sure on Faction (Alla posts say dubious does not work I'm not sure on indiff)
#

# Faction value using function.  The $faction DOES NOT WORK for Priests of Innoruuk (ID 256) in the release on 08/28/2009
my $facval;

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, $name! Are you the champion Najena sent for?");
  }
  if ($text=~/champion of Najena/i) {
    quest::say("Very well champion.  Have you heard of The Staff of Ankexfen?"); # Not real text
  }
  if ($text=~/not heard of the staff/i) {
    quest::say("No? Why am I not surprised? You look too weak and frail to be of any use. You probably could not even best one of those intoxicated, weak-minded goblins controlled by that pathetic eye called Xxorb. Away with you, useless creature!");
  }
  if ($text=~/happened to the Ankexfen/i) {
    quest::say("The wrath of the unnamed gods was grim. Thousands of ogres were instantly slain - their empire left to crumble under the hand of retribution. The giants were flung across the face of Norrath like seeds to the wind. The Ankexfen's fates were more severe. The entire race was exterminated, but from the ashes were born the four goblin races. What is known is that each goblin clan was stripped of any knowledge and was neither informed of the other clans nor of their own origins. Each clan was then transported to a separate environment to help preserve the gods' will. However, the gods were not without mercy and each clan was granted a section of the staff. Upon each staff, a crystal was placed. These staves served to aid the goblin clans in understanding their environments. These remnants of the staff of Ankexfen are what I desire. Bring them to me and the Priests of Innoruuk shall reward you.");
  }
}

sub EVENT_ITEM {
  $facval = quest::factionvalue();
  if ($facval >= 5) { #indifferent or better priests of innoruuk
     # 6323 - Ice Crystal Staff
     # 6324 - Fire Crystal Staff
     # 6335 - Slime Crystal Staff
     # 6336 - Water Crystal Staff
    if (plugin::check_handin(\%itemcount, 6323 => 1, 6324 => 1, 6335 => 1, 6336 => 1)) {
      quest::emote("cackles with glee as she slowly assembles the runed rods, and with a muttered incantation and a flash of light, disappears, leaving only a note that slowly drifts to the ground.");
      quest::summonitem(18401); # Scroll of Flayed Goblin Skin
      quest::faction(256, 20); #Priests of Innoruuk
      quest::faction(177, 20); #King Naythox Thex
      quest::faction(258, -60); #Priests of Marr
      quest::faction(43, -60); #Clerics of Tunare
      quest::faction(257, -60); #Priests of Life
      quest::faction(260, -60); #Primordial Malice
      quest::exp(132775);   # 2.5% @ level 30
      quest::depop_withtimer();
    }
    else {
      quest::say("I don't need this.");
      plugin::return_items(\%itemcount);
    }
  }
  else {
    quest::say("I don't need this."); # not real text
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:najena ID:44107 -- a_visiting_priestess 