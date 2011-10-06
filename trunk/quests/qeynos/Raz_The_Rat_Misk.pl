#The Tattered Pouch



sub EVENT_SAY
{
 if($text=~/Hail/i){
 quest::say("Spare 3 gold so I can get a decent meal for once, master?");
}
if($text=~/What favor?/i){
   quest::say("I found this pouch and do not know whose it is. I would be more than willing to part with it for 5 gold, since the owner would probably reward you more.");
}
}
sub EVENT_ITEM
{
   if($gold == 3)
   {
      quest::say("Thank you, kind master. I don't wish to trouble you further but I do have another [favor] to ask..");
      quest::faction(33,10); # +Circle of Unseen Hands
      quest::faction(217,-10); # -Merchants of Qeynos
      quest::faction(53,10); # Corrupt Qeynos Guards
      quest::faction(135,-10); #-Guards of Qeynos
      quest::faction(164,10); # Kane Bayle
      quest::exp(200);
   }
   elsif($gold == 5)
   {
      quest::say("Very good, master! Best of luck in locating the proper owner. Maybe try giving it to ol' Crow in North Qeynos. Everyone knows if you need to fence.. er.. find something in Qeynos, Crow is your man. He always seems to know who's missing what. I am off to get some food.");
      quest::summonitem(17600); #A Tattered Leather Pouch
      quest::faction(33,10); # +Circle of Unseen Hands
      quest::faction(217,-10); # -Merchants of Qeynos
      quest::faction(53,10); # Corrupt Qeynos Guards
      quest::faction(135,-10); #-Guards of Qeynos
      quest::faction(164,10); # Kane Bayle
      quest::exp(200);
      quest::movepc(2,358.00,91.00,3.13);
   }
plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos  ID:1016 -- Raz_The_Rat_Misk.pl 

