#########################################################
# Kazzel D`Leryt (ID:50272)
# Zone:   Rathe Mountains (rathemtn)
# Quest:  The Etched Stone
# Author: a_sewer_rat
#########################################################
# items: 10191, 10192, 10147, 10218, 10196, 10193, 10194, 10197, 15692

sub EVENT_SAY {

   if($text=~/Hail/i){
      quest::say("Finally, a servant worthy of my needs! Apparently you are of high status, which perhaps means you might know a master [jeweler] capable of faceting a very magical, yet fragile stone?");
   }
   if($text=~/jeweler/i){
      quest::say("You must provide me with 2000 platinum pieces as a deposit, then you must take this stone to a master jeweler or [Darfumpel], have it faceted and return it to me along with an orb of pure crystal, a gold necklace the color of snow, and the [blood of Xenyari]. Do that and I will provide you with magic beyond that of most knights of darkness.");
   }
   if($text=~/darfumpel/i){
      quest::say("Darfumpel is a gnomish shopkeeper here in the Rathe Mountains. He apparently has a new technique for gemcutting, however, he will not deal with me due to my affiliation with necromancy. Speak with him. Perhaps he might be willing to aid you for a price, but make sure you hide your true nature. He despises dark magic.");
   }
   if($text=~/blood of xenyari/i){
      quest::say("Xenyari is a druid who inhabits these parts. She is rarely seen, however, I require a droplet of her blood. Here is the catch though, and one for which you may be well suited if you desire magic of the knights of darkness - Xenyari must give of herself willingly. In other words, you cannot take her blood by force. Rather, she must give you her blood of her own accord.");
   }
}

#############################################################
#Handin
#     2000pp
#Reward
#     10191 : Uncut Hyacinth (from 13th floor)
#############################################################
#Handin
#     10192 : Faceted Hyacinth (from 13th floor)
#     10147 : White Gold Necklace (from 13th floor)
#     10218 : Crystalline Orb (from 13th floor)
#     10196 : Bloodied piece of Parchment (from 13th floor)
#Reward
#     10193 : Faceted Hyacinth Telesm (from 13th floor)
#############################################################
#Handin
#     10194 : Pulsating Hyacinth Telesm
#Reward
#     A Monstrous Zombie attacks you =)
#############################################################
#Handin
#     10197 : Monstrous Zombie Heart (from 13th floor)
#Reward
#     15692 : Spell: Life Leech (from 13th floor)
#############################################################

sub EVENT_ITEM {

   if($platinum>=2000) {
     quest::say("Very well, $name. Take this gem to a master jeweler and return it to me with the other three items.");
     quest::summonitem(10191); # Item: Uncut Hyacinth
   }
   elsif(plugin::check_handin(\%itemcount,10192=>1,10147=>1,10218=>1,10196=>1)) {
     quest::say("You are quite cunning. After I fashion this telesm, take it back to Xenyari. She would 'enjoy' another 'gift,' eh?");
     quest::summonitem(10193); # Item: Faceted Hyacinth Telesm
   }
   elsif(plugin::check_handin(\%itemcount,10194=>1)) {
     quest::emote("laughs heartily and whispers to you, 'Well done, worm, your servitude to my will has now expired...'");
     quest::exp(25000);
     quest::unique_spawn(50335,0,0,$x,$y,$z); #spawn a_monstrous_zombie
   }
   elsif(plugin::check_handin(\%itemcount,10197=>1)) {
     quest::say("Oh! Umm... Well, I was just playing with you. Certainly you know I was joking! We had a deal and I will abide by the terms of our agreement. Here is my payment for your services. Bye..");
     quest::summonitem(15692); # Item: Spell: Life Leech
     quest::exp(25000);
   }
   plugin::return_items(\%itemcount);
}

#END of FILE Zone:rathemtn  ID:50272 -- Kazzel_D-Leryt 