# items: 5544, 17116, 6264, 6265, 6140
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello Citizen. I am in need of an apprentice.  If you feel that you are capable of assisting me. please show me your Dar Khura Apprentice Cloak and I'll explain the task to you.");
}
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 5544 =>1 )) {
    quest::say("Very well done #name.  I do have use for you if you are able.  Take this bag and fill it with Sonic Wolf Paws and bring it back to me.  I can help you once that has occurred.");
    quest::summonitem(17116); # Item: Brown Leather Bag
    quest::summonitem(5544); # Item: Cloak of the Dar Khura Apprentice
 }
 if (plugin::check_handin(\%itemcount, 6264 =>1 )) {
   quest::say("Well done!  Take this note to Amat and he can provide further instructions.  Also take this strainer as you will need it to make the sealant.");
   quest::summonitem(6265); # Item: Note to Amat
   quest::summonitem(6140); # Item: Ceremonial Metal Strainer
   
 }
 plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155270 -- Jaima_Seyel 

