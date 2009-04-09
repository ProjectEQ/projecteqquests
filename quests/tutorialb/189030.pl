sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello. There are many things one can do with spells and you should take the time to learn them. If you wish I can [bless] you with the power of the gods using one such spell.");  
  }
}
sub EVENT_SAY {
  if ($text=~/bless/i) {
	quest::say("Very well ......... there you have been blessed.");
 	quest::selfcast(5150);
   }
}
