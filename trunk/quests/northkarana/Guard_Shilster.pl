#############
#Quest Name: Black Burrow Stout (Northern Karana)
#Author: Blaz
#NPCs Involved: 1
#Items Involved: 5 Gold
#################
sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Hey. hey! I have some Blackburrow Stout for sale. Just hand over five gold and I'll give you a bottle of it. Don't get caught though because it is considered [contraband]. [Antonius] don't like it being smuggled and all that but what does he know. anyway?");
}


if($text=~/contraband/i){

quest::say("Well it's brewed by gnolls, ya know. Don't know exactly why it's considered contraband but I think it's because they use the money they get from selling the stout to buy arms. I dunno. I buy low and sell high. Blackburrow Stout is good for you though! It does wonders for me! Now buy some already before someone hears us talking."); }

if($text=~/Antonius/i){

quest::say("That man is as clueless as a froglok tad swimming in a keg of dwarven ale! He has no idea what is going on around him. He won't be around for much longer I wager.");
}

}

sub EVENT_ITEM 
{
 #Give Guard Shilster money
   if ($gold == 5){
   quest::say("There you go, sport. If you get caught with that, you didn't get it from me!");
   #Reward: Black Burrow Stout
   quest::summonitem(13107);
   # Guards of Qeynos
   quest::faction("135","-10");
   # Kane Bayle 
   quest::faction("164","10");
   # Corrupt Qeynos Guards 
   quest::faction("53","10");
   # Circle Of Unseen Hands 
   quest::faction("33","10");
   # Bloodsabers
   quest::faction("21","10");

 }
else{
  #do all other handins first with plugin
  plugin::return_items(\%itemcount);
  quest::say("Thanks, but I do not need this...");
}

}



#END of FILE Zone:northkarana  ID:13021 -- Guard_Shilster
