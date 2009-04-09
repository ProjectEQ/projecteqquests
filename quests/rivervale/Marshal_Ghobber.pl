sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings!  Allow me to introduce myself.  I am Marshal Ghobber Truppack.  Marshal of the Great Wall Patrol.  Are you [new to the squad]?");
}
if($text=~/I am new to the squad/i && $faction > 5){
quest::say("How can you expect to just waltz into Guardian Stronghold and expect to gather information?! Consider yourself lucky I don't command the Guardian of the Vale deputies to show you the sharpness of their blades!");
}
if($text=~/I am new to the squad/i && $faction < 6 && $faction > 2){
quest::say("Great!!! We require more deputies in this squad. We are suffering great losses to the [new threat]. Welcome to the Great Wall Patrol where our motto is, 'United we shall defend.' It will be some time before you can earn your squad ring - first you must prove your strength in battle. Report to the squad leader. He is Deputy Budo. You can find him at the Great Wall of Serilis in the Misty Thicket. Go to him at once and tell him you are reporting for duty.");
}
if($text=~/I am new to the squad/i && $faction == 2){
quest::say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.");
}
if($text=~/Am I one with the wall/i && $faction < 6 && $faction > 1){
quest::say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.");
}
if($text=~/Am I one with the wall/i && $faction == 1){
quest::say("Yes!! Welcome, Deputy $name! You are now an elite member of the Great Wall Division. Wear this ring with pride. You may take it to Hendi Mrubble of the Clerics of Mischief for healing at any time. Wear it with pride.");
quest::summonitem(13936);
quest::faction(133, -500); #YES! This is correct. Sucks, eh?
}
if($text=~/what new threat/i && $faction < 6){
quest::say("The new threat I refer to is the community of goblins which was found beyond the Great Wall of Serilis. They are called Clan Runnyeye. They have begun to sneak over the wall. The deputies have reported seeing them launch themselves up the wall in a matter of seconds using ornate grappling hooks. We have attempted to obtain one of these devices for further inspection, but we have yet to find one on any of the dead goblins. If you should ever find one, be sure to bring it to me immediately."); 
 }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:rivervale  ID:19060 -- Marshal_Ghobber 
