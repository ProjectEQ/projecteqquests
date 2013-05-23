#dwarf dude
#npc - Sigan Ilbirku
#zone - Dagnors Cauldron

sub EVENT_SAY {
   if ($text=~/hail/i) {
      if ($faction <= 7) {
         quest::say("Hail!! You are welcome to rest here.");
         quest::signal(70007, 5);
      }
      else {
         quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
      }
   }
   elsif ($text=~/escort you to the pass/i) {
      if ($faction <= 7) {
         quest::say("Yes. Follow me closely!!");
         quest::moveto(-141.75, 1201.45, 141.42, 0, 0);
      }
      else {
         quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
      }
   }
}