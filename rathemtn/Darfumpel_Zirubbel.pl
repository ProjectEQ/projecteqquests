#########################################################
# Darfumpel Zirubbel (ID:50270)
# Zone:   Rathe Mountains (rathemtn)
# Quest:  The Etched Stone
# Author: a_sewer_rat
#########################################################
# items: 10191, 1000, 10192

sub EVENT_SAY {

   if($text=~/Hail/i){
      quest::say("Hail, $name. I am Darfumpel, master jeweler and proprietor of this shop. How might I assist you today? Perhaps you need a stone [cut] or some jewelry [repaired]?");
   }
   if($text=~/cut/i){
      quest::say("Yes, I use a new gemcutting technique I designed myself. It will bring out the beauty of any gem. However, as arrogant as this may sound, I do not cut just any ordinary stone. They must be rare or of extraordinary quality. Have you an exceptional stone that requires faceting? If so, what type of gem is it?");
   }
   if($text=~/repaired/i){
      quest::say("Although more mundane a task. I do have a shop to keep up and so I repair jewelry for a nominal fee.");
   }
   if($text=~/hyacinth/i){
      quest::say("A hyacinth, eh? That is quite a rare stone. Quite fragile and easily shattered, too. With my new technique, I can assure you I will not destroy the gem, however, it will cost you. 1000 platinum coins is my fee. Provide me with the coin and the gem and I will cut it for you.");
   }
}

#Handin
#     1000pp
#     10191 : Uncut Hyacinth (from 13th floor)
#Reward
#     10192 : Faceted Hyacinth (from 13th floor)

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount,10191=>1) && $platinum>=1000) {
      quest::say("I have not seen a gem such as this in quite some time! It was not since I dabbled in a bit of necro? Wait? What are you going to use this for? Never mind. I do not wish to know. Here, take your gem and leave!");
      quest::summonitem(10192); # Item: Faceted Hyacinth
      quest::exp(1000);
   }
   plugin::return_items(\%itemcount);
}

#END of FILE Zone:rathemtn  ID:50270 -- Darfumpel_Zirubbel 

