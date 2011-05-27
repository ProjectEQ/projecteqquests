sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. I am Astaed Wemor of the Paladins of the Temple of Life. We are the defenders of the all-giving Prime Healer.  Are you [here to pray] or are you [here to assist the temple]?");
}
if($text=~/here to pray/i){
quest::say("Then pray long and silently, $name.  Fill your soul with the breath of life.");
}
if($text=~/i am here to assist the temple/i){
quest::say("Good.  There are a few in the congregation who require assistance.  Will you be [traveling afar] or are you [staying close to Qeynos]?");
}
if($text=~/i will be traveling afar/i){
  if ($faction >= 3){
quest::say("Then outfit yourself well. We will require you to visit Rivervale, the village of the halflings. There you shall find an herb merchant named Kizzie Mintopp. She has an ingredient we require. Tell her you are from the Temple of Life");
}
  else {
   quest::say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.  Perhaps you can assist us in ridding the land of diseased animals.  Priestess Caulria will accept all pelts from rabid beasts."); 
   }
   }
if($text=~/i will be staying close to qeynos/i){
  if ($faction >= 3) {
    quest::say("Then you can help with one of our distraught members. The priests have noticed that Nerissa Clothspinner has been a little down lately. Go console her and ask her how she is doing. She is a sweet girl and the temple is worried about her.");
    }
  else {
   quest::say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.  Perhaps you can assist us in ridding the land of diseased animals.  Priestess Caulria will accept all pelts from rabid beasts."); 
   }
}
}
sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18862 =>1 )) {
   if ($faction >= 3) {
     quest::say("So you have helped Nerissa. That is good. Here, then, is a small reward. May you find it useful. Keep fighting the good fight!");
     quest::ChooseRandom(26022,26023,26024,26025);
     quest::givecash(0,7,12,0);
     quest::faction(257,1);
     quest::faction(183,1);
     quest::faction(135,1);
     quest::faction(21,-1);
     quest::faction(9,1);
     quest::exp(4000);
     }
     if (plugin::check_handin(\%itemcount, 13952 => 1)) {
       quest::say("I pray to Rodcet Nife that you have made it back in time. Let's add a small amount of this honey jum to this and.. here is the potion. This potion must be taken to a sick member of the congregation. The man is Lempeck Hargrin. He lives in the west plains of Karana between the river and the crop fields. He is in dire need of this potion. He has an odd disease. We have tried everything to cure him and this is his last chance. Run to him.");
       quest::faction(257 ,30 );
       quest::faction( 183, 30);
       quest::faction( 135, 10);
       quest::faction( 21, -10);
       quest::faction( 9, 10);
       quest::exp(1000);
       quest::givecash(0,5,0,0);
       quest::summonitem(13954);
     }
     if (plugin::check_handin(\%itemcount, 13970 => 1)) {
       quest::say("It is good to know that we saved Lempeck. He has given us his scythe as a donation to the temple. We shall find a use for it. As for your fine work at preserving the life of another, I reward you with the Shining Star of Life. Should you ever desire more strength in battle, call upon it to give you strength, but let it be known that at battle's end, you shall feel weaker than before you called upon the power. Just for a short time. When the power is drained, go to our temple storehouse and ask Whysia to [recharge the Shining Star of Life]. Go and serve life.");
       quest::summonitem(6356);
       quest::faction(257 ,30 );
       quest::faction( 183, 30);
       quest::faction( 135, 10);
       quest::faction( 21, -10);
       quest::faction( 9, 10);
       quest::exp(1000);
       quest::givecash(0,11,8,0);
     }
 } 
 else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:qeynos2  ID:2094 -- Astaed_Wemor 

