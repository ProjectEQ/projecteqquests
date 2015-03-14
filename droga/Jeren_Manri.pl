#Jeren_Manri.pl
#The Magic Pool


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Shhh, be quiet! The goblins may hear you.");
  }
}
 
 
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 15959 => 1)) {
    quest::emote("Oh! Thank you, I assume this means that Thiran sent you. I ran off with the incorrect book without thinking to check. Would you be kind enough to return this to him?");
    quest::summonitem(15960); #The Reflecting Pools of Tanaan
  }
  plugin::return_items(\%itemcount);
} 
