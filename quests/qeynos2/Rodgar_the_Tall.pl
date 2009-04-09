sub EVENT_SAY {

if($text=~/Hail/i){

quest::say("Greetings. $name!  You look like you could use some new footwear.");
}
if ($text =~/I need treant wood/i){
quest::say ("What is all this talk of Treant Wood? I can get you some. In about two months, I shall have a new stock. Perhaps I may have some to trade... if you do me a [favor]...");
}
if ($text =~/What favor/i){
quest::say ("I will be glad to part with some Treant Wood for an Odus Pearl from the waters surrounding Erudin. On second thought... make that four Odus Pearls.");
}
}


sub EVENT_ITEM {
  if  (plugin::check_handin(\%itemcount, 13878 => 4)){#Pearl of Odus
 
  quest::say("Wonderful!! I am sure that was a lot safer than battling a treant.");
  quest::faction("217","10"); # +Merchants of Qeynos
  quest::faction("33","10"); # -Circle Of Unseen Hands
  quest::faction("9","10"); # +Antonius Bayle
  quest::faction("47","10"); # +Coalition of Tradefolk
  quest::faction("135","10"); # +Guards of Qeynos
  quest::exp(2432);
  quest::summonitem("13824"); #Wooden Shards
  }
  else {     
  quest::say("You know the deal!! Four Odus Pearls and you get the Treant Wood.");
  plugin::return_items(\%itemcount);
  }
  }
   
#END of FILE Zone:qeynos2  ID:2055 -- Rodgar_the_Tall

