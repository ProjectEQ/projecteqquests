#Part 1
#############
#Quest Name:A Torn Pouch
#Author:Shaznito
#NPCs Involved:Toelia Snuckery
#Items Involved:Torn Old Pouch
#############
#Part 2
#############
#Quest Name:Chomper
#Author:Shaznito
#NPCs Involved:Toelia Snuckery
#Items Involved:Large Ruby
#################

sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Oh. hi.  Listen. um.. $name. was it?  Listen. pal.  I really don't have time for the friendly-friendly. so why don't you just move on?"); 

}

if($text=~/I am the new dishwasher/i && $faction == 5){

quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");

}

if($text=~/I am the new dishwasher/i && $faction < 5 && $faction > 2){

quest::say("Dishwasher, huh?  You must not mind getting your feet wet then, huh?  Well, I do have a job for you.  It seems one of our younger employees got a little nevous around a Deputy and ditched his um..  recent purchase into the river.  We sent the fool after it but ol' [Chomper] got him.  He said he had dropped it off the docks but the currents might have moved it from there.  It should be in an old pouch.  Return the merchandise to me.  Well?  Get going!");

}

if($text=~/Who is chomper/i){

quest::say("Chomper is a big, mean ol' fish.  He looks like a normal fish, but a little bigger, and boy, oh boy, is he mean!"); 
 
 }
}

sub EVENT_ITEM {

 if(plugin::check_handin(\%itemcount, 13785 => 1)){
 quest::say("'What is this?  The pouch is empty!  Where is the Ruby?!  What do you mean you don't have it?  Oh no.  I bet [Chomper] swallowed it!  Get it back and bring it to me.");
 quest::faction(77,5);
 quest::faction(33,5); 
 quest::faction(218,-5);  
 quest::faction(48,5); 
 quest::faction(31,5); 
 quest::exp(5);
 quest::givecash(2,0,0,0);
} 
 elsif(plugin::check_handin(\%itemcount, 13786 => 1)){
 quest::say("'You found it!  Heh.  Good thing you brought it back bub.  This thing isn't priceless, its worthless but at least you proved you are loyal.  Poor ol' Chomper..");
 quest::faction(77,10);
 quest::faction(33,10); 
 quest::faction(218,-10);  
 quest::faction(48,10); 
 quest::faction(31,10); 
 quest::exp(10);
 quest::givecash(12,1,0,0);
} else { quest::say("I have no need for this item $name, you can have it back.");
plugin::return_items(\%itemcount);
   }
plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
}

#END of FILE Zone:rivervale  ID:19063 -- Toelia_Snuckery 
