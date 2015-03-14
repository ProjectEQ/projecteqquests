# part of seventh coldain prayer shawl
#
# since there is no viable way for an untargetted npc to respond to a phrase
# (prayer to brell) said by the player the quest needs to be changed slightly.
# the player will recite the prayer to the grand historian a certain number
# of times to receive the etched rune pattern.

sub EVENT_SAY {
  if ($text=~/burin/i) {
    quest::say("You'll need a fletching kit and a fair bit of skill for this one, $name. Round up a tooth from a swordfish and attatch it to an Ulthork tusk wrapped in a Molkor hide.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1852 => 1)) {
    quest::say("Fine piece of work there, $name, especially fer an outlander. Now yer gunna need to make a burin to etch the rune with. Once that's done ye need to kneel in front of the Grand Historian in the chapel and recite this prayer to him with total sincerity in yer heart. If yer plea be heard by our Father Brell he'll bless ya with the knowledge necessary to carry on. With that knowledge you'll take the blank rune, the burin and a fletching kit to etch the rune. Show Grimthor the etched rune and he'll guide you from there.");
    quest::summonitem(1852);
    quest::summonitem(18281);
  }
}

# EOF zone: thurgadina ID: 115073 NPC: Trademaster_Kroven

