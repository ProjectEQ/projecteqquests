sub EVENT_SAY {
if (($text=~/hail/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 6)) {  #update global at proper point
   quest::say("Welcome back, $name. Have you found any clues from the [Crumbled Sanctuary] yet? Please find anything you can and return to me as soon as possible!");
  }
  else{
    quest::emote("glances at you suspiciously.");
    quest::say("Can I help you with something? Has someone sent you? Speak up!");
    quest::say("If you want to see what you've completed at any time, just ask me for a [progress update]!");
  }
  if ($text=~/progress update/i) {
  #add kodtaz update via globals
  }
if (($text=~/stone tablet/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 6)) {
  quest::say("You need a stone tablet? What for? What have you got that's so special it requires the use of a stone tablet?");
 }
 }
 
sub EVENT_ITEM {
if (defined $qglobals{ikky} && $qglobals{ikky} == 6) {
  if (plugin::check_handin(\%itemcount, 60146 =>1 )) {
     quest::summonitem(60146);
     GIVE_TABLET();
     }
  if (plugin::check_handin(\%itemcount, 60147 =>1 )) { 
     quest::summonitem(60147);
     GIVE_TABLET();
     }
  if (plugin::check_handin(\%itemcount, 60148 =>1 )) { 
     quest::summonitem(60148);
     GIVE_TABLET();
     }
  if (plugin::check_handin(\%itemcount, 60149 =>1 )) {
     quest::summonitem(60146);
     GIVE_TABLET();
     }
}
plugin::return_items(\%itemcount);
}

sub GIVE_TABLET {
    quest::say("So, you really are helping Kevren with this. My apologies for being so blunt with the requirements, but you never can be too careful with things like this. Here's a stone tablet for your troubles. You're going to need to use as many piles of dust as you have glyphs, then combine the dust and the four glyphs together with the stone tablet to translate them. These glyphs can be tricky, so good luck.");
    quest::summonitem(60175);
  }
