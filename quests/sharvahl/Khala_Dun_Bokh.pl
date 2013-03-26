sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Greetings traveler. If you are headed through these gates you should be aware that there are many [dangers] you may encounter.");
  }
  if($text=~/dangers/i){
    quest::say("Recently there have been numerous [brigand] encounters. The [Shak Dratha] have also taken arms against our people.");
  }
  if($text=~/shak dratha/i){
    quest::say("Very little is known about the Shak Dratha. They appeared shortly after the explosion heard in the thicket. Although they are not really our enemies, they have been known to attack when those unknown to them approach.");
  }
#Unfinished section
#  if($text=~/who are the shak dratha/i){
#    quest::say("The Khala Dun are the king's warriors. They are charged with defending the city of Shar Vahl and commanding any offensives necessary. They are named after Khala Dun who was King Vah Kerrath's protec");
#  }
#
  if($text=~/brigand/i){
    quest::say("The brigands arrived shortly after the disappearance [Loda Kai]. Although it shames me to say it. I believe he may in some way be involved with these attacks. I can not bear to think about such an atrocity. Nevertheless there is a bounty on the brigands.");
  }
  if($text=~/loda kai/i){
    quest::say("Loda Kai was a strong member of the Taruun. he was off to investigate the spirit deaths in shadeweavers thicket when a strong explosion was felt throughout the thickets. He has not been seen since. It was around the time of his disappearance that the brigands began to raid our trade route to shadow haven.");
  }
  if($text=~/assigned/i) {  #Quest: Beetle Eyes
    quest::say("Thank you for coming to assist. We are always looking for hungry new soldiers. Young soldiers get old much too fast these days. Just look at me.' He smiles at this comment. 'Do this old soldier a favor and go down there and gather up a handful of rhino beetle eyes', he says and looks at the mass of crawling creatures that wait below. 'Beetle eyes not only taste good... they keep your fur shiny as well.");
   }
}
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,14587=>4)){ #Beetle Eyes (4)
    quest::emote("tosses the beetle eyes into his mouth & attempts to say something to the effect of 'here is your payment.' The sound of crunching gristle & popping eyeballs prevents him from saying it properly.");
    quest::givecash(3,3,0,0); 
    quest::exp(1000);
    quest::ding();
  }  #Quest: Beetle Eyes (End) 
  # takes repair order from master Barkhem
  elsif (plugin::check_handin(\%itemcount,29803=>1)) {
    quest::say("Outstanding! Nothing like a sharp-looking shield to scare off the undesirables. And if you bring it back full of food I wouldn't complain either,");
    quest::emote("laughs, flashing a mischievous grin your way.");
    quest::say("Just kidding! You have much to do and Barkhem would have my hide if I kept you from your studies."); 
    quest::summonitem(29813);
  } 
  # You receive Bokh's Dented Shield. Take the dented shield and place it into a forge with your Vah Shir Apprentice Mallet. This creates Bokh's Immaculate Shield (the mallet will be returned). Give this shield back to Jasir to receive Bokh's Work Order.
  elsif (plugin::check_handin(\%itemcount,29814=>1)) {
    quest::say("Well done, shiny enough to eat off of. My compliments to you $name, Barkhem would be most pleased."); 
    quest::summonitem(29815);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:7038 -- Khala_Dun_Bokh