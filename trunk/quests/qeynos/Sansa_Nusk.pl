sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello..  Welcome to the Wind Spirit's Song.  I'm Sansa, and I help out the local bards here."); 
}
if ($text=~/Fabian/i) {
  quest::say("Ahh - jolly Fabian. He is one of our best customers! That is, of course, due to the fact that he has the heaviest fingers of any bard I know. Anyhow, down to business. I assume he sent you for a new set of strings. Unfortunately, I have not been able to procure any of the special - uhh - things needed to make his strings lately.");
}
if ($text=~/special things/i) {
  quest::say("Uhh - ummm - uhhh - Fabian does not know this, but his strings are - uh - made of - uh - troll guts.");
}
if ($text=~/troll guts/i) {
  quest::say("Well, Fabian likes the thick resonance that only troll gut strings can provide. Trouble is, trolls are scarce around these parts,
thank the gods, but Fabian breaks his strings as fast as I find suppliers. Trolls sometimes wander the Karanas in search of food but that is so rare, to see one there. Anyhow, if you find one out in the Karanas, bring me his guts and I can make the strings to take to Fabian.");
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13703 => 1, $platinum >= 1)) {
    quest::say("I am not even going to bother asking where you got that. Just take this set I already made and hurry them back to Fabian.");
    quest::faction( 192, 30);
    quest::faction( 184, 30);
    quest::faction( 135, 30);
    quest::faction( 273, -30);
    quest::faction( 207, -30);
  }
}
#END of FILE Zone:qeynos  ID:1132 -- Sansa_Nusk 

