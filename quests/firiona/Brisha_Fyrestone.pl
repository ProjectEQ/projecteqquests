# special gemstone for paladin quest spell divine might
#

sub EVENT_SAY {
  if ($text=~/special fire emerald/i) {
    quest::say("Why would you want one of those? Not many people request them, except in special cases. Even you with all your powers can't tell the difference between them. Simply give Drake any fire emerald that you may have and he will make sure you get the special one.");
  }
}

# EOF zone: firiona ID: 84165 NPC: Brisha_Fyrestone

