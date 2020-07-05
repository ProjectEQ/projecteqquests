# items: 29062, 30215, 30219, 30212, 30263, 1199, 8895
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings and welcome to Thurgadin, $name. I am Chamberlain Krystorf and it is my duty to assist the Dain in the management of Icewell Keep and the Royal Court. One could say that Seneschal Aldikar is the Sword of the Dain while I am the Shield, protecting all of his interests and those of the kingdom."); 
}
 }
sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 29062 => 4)){
  quest::say("Well done, $name, the Dain is pleased with your efforts. With a few more brave allies like you, we'll soon be tearing down the halls of Kael Drakkel.");
  quest::summonitem(quest::ChooseRandom(30215,30219,30212,30263)); # Item(s): Coldain Velium Morning Star (30215), Coldain Velium Rapier (30219), Coldain Velium Short Sword (30212), Coldain Velium-Pick (30263)
  quest::faction(406, 50); # Faction: Coldain
  quest::faction(405, 50); # Faction: Dain Frostreaver IV
  quest::faction(429, -25); # Faction: King Tormax
  quest::exp(64000);
  quest::ding();
  quest::givecash(0,0,0,20);
 }
   elsif (plugin::check_handin(\%itemcount, 1199 => 1) || plugin::check_handin(\%itemcount, 8895 => 1)) {
      # Runed Coldain Prayer Shawl, either version allowed to
      # account for dynamic zone status. Should only allow summon
      # with 1199
      my $mob = $entity_list->GetMobByNpcTypeID(129003);
      if ($mob) {
         quest::say("The Dain has been waiting for you, show your shawl to him."); #text made up.
         quest::summonitem(8895); # Item: Runed Coldain Prayer Shawl
      } else {
         quest::say("One moment the Dain has been waiting for you. I will call for him.. oh here he is now, show your shawl to him.");
         quest::summonitem(8895); # Item: Runed Coldain Prayer Shawl
         quest::spawn2(129003, 0, 0, 4.0, 690.0, 68.38, 256); # NPC: #Dain_Frostreaver_IV
      }
   }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::shout("The Royal Court of Dain Frostreaver the IV is now closed for the night. Those with official business for the crown may return in the morning.");
	}
	if($signal==2) {
		quest::shout("The Royal Court of Dain Frostreaver IV and his council of advisors is now in session. Those citizens with official business for the crown please report to the throne room at this time.");
	}
}

#END of FILE Zone:thurgadinb  ID:129027 -- Chamberlain_Krystorf 

