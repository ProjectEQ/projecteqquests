sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I've been told that you may be the wolf slayer. I don't know though. You look a little scrawny to be the one. I suggest you prove it and bring me the Wolf Slayer. Once I've seen it we shall speak again."); 
}
 }

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 32170 => 1)) {
quest::say("I'm sorry to have doubted you before. Please forgive me. My mind is not what it used to be. Since you are the wolf slayer perhaps you can help us find something. We've been unable to find it. If you can combine the Centerstone along with the Wolf Slayer in this box and bring back what you have. I should be able to reward you once we are through here.");
quest::summonitem(32170);
quest::summonitem(17073);
}
  if (plugin::check_handin(\%itemcount, 32300 => 1)) {
quest::say("I knew you'd come through. This is going to make someone really happy. Take this for your troubles.");
quest::summonitem(32189);
}
 }

#END of FILE Zone:dawnshroud  ID:174089 -- Dragen_Faux 

