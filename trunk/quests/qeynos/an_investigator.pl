#an investigator in qeynos
#############
#Quest Name: Qeynos Investigator's Badge (Badge #1)
#Alla URL:  http://everquest.allakhazam.com/db/quest.html?quest=1271
#Author: loglos (just made minor changes)
#NPCs Involved: an investigator, donally stultz, willie garrote, Riley shplotz
#Items Involved: Head of Donally Stultz, Investigator's Badge
#################

sub EVENT_SAY {
  if($text=~/first suspect/i) {
    quest::say("The first suspect was last seen near the shop called Fireprides.");
    #quest::unique_spawn(1183,0,0,$x+10,$y+10,$z+10);
  }
  if($text=~/follow me/i) {
	quest::say("Right, let's get going.");
	quest::follow($userid);
 }
 if($text=~/give me a confession document/i) {
	quest::say("Here you are.'");
	quest::summonitem(2344);
 }
 if($text=~/second suspect/i) {
	quest::say("The second suspect was sighted below the Grounds of Fate.");
        quest::spawn2(1201, 0, 0, -413.66, -3.08, -25.81, 0);
        #loglos added spawn Willie Garrote
	#quest::unique_spawn(1201,0,0,$x+10,$y+10,$z+10);
 }
 if($text=~/third suspect/i) {
	quest::say("The last suspect has been known to hang around that low life known as Raz the Rat.");
        quest::spawn2(1197, 0, 0, 45.92, -310.77, -16.58, 0);
        #loglos added spawn Donally Stultz
        #quest::unique_spawn(1197,0,0,$x+10,$y+10,$z+10);
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18289 => 1)) { #Investigator's Briefing
    quest::say("Very well, let's get to work. I assume you have read the briefing and committed it to memory. This is how you will be tested. I shall play the part of student and you shall play the master who directs me. I promise I won't make it easy on you either, we want only the best. We'll see how you do and then I'll decide if you are worthy to wear the badge or not."); 
    quest::follow($userid);
  }
  elsif(plugin::check_handin(\%itemcount, 2369 => 1, 2394 => 1, 2279 => 1)) { #Riley's Confession, Willie's Confession, Head of Donally Stultz
    quest::say("You have done our city a great service and helped to bring several criminals to justice this day! Wear this Investigator's Badge with pride! Speak again with Vegalys Keldrane, he may have information about [advancing further] in rank.");
    quest::sfollow();
    quest::summonitem(2386); #Investigator's Badge
    quest::faction(9,10);    #Antonius Bayle
    quest::faction(135,10);  #Guards of Qeynos
    quest::faction(273,-10); #Ring of Scale
    quest::faction(164,-10); #Kane Bayle
    quest::faction(217,10);  #Merchants of Qeynos
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}