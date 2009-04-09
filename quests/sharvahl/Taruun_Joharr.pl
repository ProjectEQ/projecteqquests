#Rogue #3
#Zone:sharvahl  ID:155056 -- Taruun_Joharr




sub EVENT_ITEM {

if(plugin::check_handin(\%itemcount,3466=>1)){
   quest::emote("takes the buckler and spins it in his hand for a moment. Eventually he says");
   quest::say("I suppose assumin' you were sent here by Harbin isn't too far from the reality
 of things. I'll try to think of a few things for you to do, but in the meantime, take these daggers
 and practice until you can use both of them. You need to get out of the habit of toting this shield
 around. If your enemy is gettin' close enough to hit you on it, you ain't doin' your job right
 anyway. I'll do what I can to train you from here, but I'm going to need to eat first. It's been
 a while since my last meal. Take this meal voucher to Cook Yalkiin. Once they fill the order bring
 it back and we'll start your lesson. Now scoot.");
   quest::summonitem(5560);
   quest::summonitem(5561);
   quest::summonitem(5559);
}

if(plugin::check_handin(\%itemcount,5563=>1)){
   quest::emote("takes the bag and takes a huge bite of the sandwich.");
   quest::say("This sandwich is almost worth the wait.");
   quest::emote("rubs the crumbs from his mouth");
   quest::say("hope that you've been practicin' with those daggers. Elder Ternq came by while
 you were away. He stated that I, well... you... need to go scout the caves around the thicket.
 Gather the skulls of any Shak Dratha that you may... um... run into while you scout. Once you've
 filled this backpack, return it to me and I'll fill out a report for Ternq.");
   quest::summonitem(17607);
   quest::ding();
   quest::exp(1250);
   quest::faction(319,10);
}

if(plugin::check_handin(\%itemcount,5568=>1)){
   quest::say("Very good, $name! Elder Ternq will be very pleased with the results of your
 patrol. Take this regional status report to him and see if he has anything else for you to do.
 Your skill as a hunter is really starting to show. You can keep the daggers that I gave you. Make
 good use of them. I'm sure that you're going to be too busy to come back this way for a bit. Take
 care.");
   quest::summonitem(5564);
   quest::ding();
   quest::exp(1500);
   quest::faction(319,10);
}
plugin::return_items(\%itemcount);
}




#End of File  Zone:sharvahl  ID:155056 -- Taruun_Joharr 