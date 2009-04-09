sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $name! I am Megosh Thistlethorn first Ranger of the Storm Reapers of Rivervale. I journeyed many years ago to the Surefall Glade far to the west of our lovely shire. It was there I trained with the human and half-elven rangers that like the Storm Reapers are faithful disciples of Karana. I have returned now to Rivervale to teach our interested young people the ways of a ranger of the Storm Lord. so that we may defend our shire and the wilds of Norrath from the [evil forces] that would see it destroyed.");
}
if($text=~/what evil forces/i){
quest::say("Currently the Death Fist Clan of Orcs. a race of bloodthirsty humanoids concerned only with expanding their territory and slaughtering all who stand in their path. threatens our homeland. The Orcs have long had a minor presence in the Misty Thicket but lately they have been amassing in greater numbers. The Death Fist has been chopping down our trees and quarrying rock from the nearby mountains. We know only that they have been shipping the materials to the commonlands and stockpiling it for what purpose we do not know. As rangers of the Storm Reapers it is our duty to [stop the desecration] of the thicket.");
}
if($text=~/I will stop the desecration/i){
quest::say("First you must outfit yourself for battle with the Death Fists. Seek Bipdo Hargin here in Rivervale and give him this letter. He will instruct you further on getting yourself outfitted for the tasks ahead. Once you have been outfitted in a suit of Thorn Mail Armor return to me and I will instruct you for your [next task].");
quest::summonitem("19627");
}
if($text=~/what next task/i){
quest::say("If you feel you are ready to face the Orcs of Clan Death Fist then journey to the Misty Thicket beyond the protection of the Wall of Cetelt. Hunt the Orcs that are cutting down the trees of the thicket and bring me two of the Orc Lumberjack Axes and two of the Orc Lumberjack Machetes.");
}
if($text=~/what forge/i){
quest::say("What forge?  Didn't you see it on the way in, young $name?  Oh, and check with Smithy Bodbin about the sharpening stones, he usually has a good supply of them.");
}
 } 


sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  if (plugin::check_handin(\%itemcount, 19622 => 2, 19623 => 2)) {
   quest::say("Excellent work young Storm Reaper $name. Now take this Dull Storm Reaper Machete to a [forge] and sharpen it with a sharpening stone. It may take several attempts to get the blade to an adequate sharpness if you are unfamiliar with the process. Once it is sharpened give it to Bodbin Gimple with a ruined thorn drakeling scales and he will put the finishing touches on what will be a fine weapon!");
    quest::faction(316,5);
    quest::faction(208,5);
    quest::faction(218,5);
    quest::faction(347,-5);
    quest::exp(10);
    quest::summonitem("19624");
  } 
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:rivervale  ID:19050 -- Megosh_Thistlethorn 
