sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. friend.  I have many fine herbs for sale.  My prices are reasonable for I am not governed by the [Haggle Baron].  If you fancy yourself an adventurer. I would like to hire you for a [simple mission].");
}
if($text=~/haggle baron/i){
quest::say("Haggle Baron Klok Dun Ree is the current Haggle Baron. It is written in the law that all services shall be governed by the Haggle Baron. To do business outside of the law is forbidden, but the merchants of the Tower of Death are exempt from this rule. Klok will not test the temper of the Harbinger and Baron Eator will not upset his most powerful ally.");
}
if($text=~/simple mission/i){
quest::say("I actually have a few items I am presently low on.  I would appreciate some assistance to [collect fern flowers] or maybe you are an alchemist who can [gather bone chips].");
}
if($text=~/fern flowers/i){
quest::say("I have run low on fern flowers and must have more of them.  Take this [flower pouch].  Outside the city can be found carnivorous plants and a strain of them buds the flower in question.  Collect enough of these flowers to fill and combine the pouch and I shall reward you.");
quest::summonitem(17025);
}
if($text=~/bone chips/i){
quest::say("I should tell you. I do not need the bone chips.  I need bone granite powder.  In order to get it. you must find some granite pebbles and then three piles of bone chips from decaying skeletons.  After you gather the items you will have to use your skill in alchemy to combine the items and create bone granite powder.  The powder is what I need."); 
}
  }
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12442 => 1)){
    quest::say("You have done well. Here is your reward."); #Text made up
    quest::summonitem(12443);
  }
}
#END of FILE Zone:cabwest  ID:2846 -- Jondin 

