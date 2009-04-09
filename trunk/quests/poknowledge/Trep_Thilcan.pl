#Trep_Thilcan.pl
#Trep's Shopping List

sub EVENT_TIMER {
 if($timer eq "1") {
  $npc->SetAppearance(1);
  quest::stoptimer(1);
 }
}

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hi! You wouldn't be able to do a favor for a poor gnome would you?");
  }
  if($text=~/favor/i) {
    quest::say("Well I am trying to setup a shop here, it is such a choice location! I am afraid if I leave though that nasty Halfling over there may steal my spot! She has been watching me keenly all day. I know she is just waiting for me to walk away. If you would go purchase some supplies for me from various locations around the world I would be able to reward you for your time spent. If you are ready to begin?");
  }
  if($text=~/begin/i) {
    quest::say("Great! Here is a special crate. It needs to be filled with: A purification tablet from Freeport, A keg of beer from Qeynos, A ball of twine from Shadeweaver, A bundle of weapons from Firiona , An armor assortment from Thurgadin, and a case of meat from the Bazaar.  That should give me quite a stock of items to sell to travelers out here.");
    quest::summonitem(17177);#Empty Supplies Crate
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 15978 => 1)) {#Merchant's Crate of Supplies--I'm not sure this is the correct item, but Cavedude said roll with it, so I'm rollin.
    quest::say("Fantastic! You got me everything I need to set up shop. Here is some money for your troubles. I hoped you learned something as well. I am sorry I have nothing more to give you except this advice, if you combine: A clockwork carapace, A metal rod, Gnomish bolts, Firewater, and Grease ..in a Toolbox you should get something nice!");#Formatting of text may be altered, but it's authentic.  Supposedly.
    quest::exp(1029000);#2% of level 36 exp...yeah, xp was nerfed on live.
    quest::givecash(0, 0, 0, 60);#60pp is specified exactly as part of the reward.
  }
 
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);

    
}

#Pre-existing code, to spawn a pet is my guess
sub EVENT_SPAWN
{
 quest::settimer(1,10);
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	quest::signal(202273,5); #Qadar
}

#END of FILE Zone:poknowledge  ID:202056 -- Trep_Thilcan