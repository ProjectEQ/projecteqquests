# Field Supplies
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You obviously have no idea where you have trespassed so I will generously allow you to live. I suggest you leave immediately before my generosity runs out however......Unless, you're looking for work.");
  }
  if ($text=~/looking for work/i) {
    quest::say("Well, you might do. Out in the deepest scar, known as the Wakening Land we have deployed several mercenaries to harass the local annoying population. They are in need of constant supplies so we hire those we can trust to deliver those supplies to the mercenaries wandering out in the field. Are you interested, $race?");
  }
  if ($text=~/i am interested/i) {
    quest::say("Very well. Take this pack of supplies to any of the Mercenaries you come across in the field. They will pay you upon delivery. Return here for more supplies to deliver when you are ready.");
    quest::summonitem(1724);
  }
}

# EOF zone: kael ID: 113108 NPC: Noble_Helssen

