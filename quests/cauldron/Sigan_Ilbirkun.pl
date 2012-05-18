#dwarf dude
#npc - Sigan Ilbirku 
#zone - Dagnors Cauldron
#by Angelox

sub EVENT_SAY {
if($text=~/Hail/i) {
   quest::say("Hail!!  You are welcome to rest here.");
   quest::signal(70007,5);
}else{
  #do nothing
   }
}

