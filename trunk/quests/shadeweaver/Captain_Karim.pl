my $count = 0;

sub EVENT_SPAWN {
  quest::settimer("karim",175);
}

sub EVENT_TIMER {
  $count++;
  if ($count == 1) {
    quest::say("Maintain your focus on the attack. Let the Taruun dance around the enemies while you keep them distracted. Working together like this will be to your advantage.");
  }
  if ($count == 2) {
    quest::say("Do not let the enemy attack your unarmored companions. Your heavy armor will protect you much more efficiently than cloth or leather.");
  }
  if ($count == 3) {
    quest::say("Try to lure your enemy to a strategic location for battle. Your are at a disadvantage when you attack them in their lair.");
  }
  if ($count == 4) {
    quest::say("You there! Pay attention! Do not lose focus. Losing focus in battle can result in the death of your comrades. Be aware of your surroundings at all times. You never know when an enemy will leap at you from behind.");
  }
  if ($count == 5) {
    quest::say("If the enemy mutters mystical words, a swift bash in the face with your shield is likely to shut its yap. Remember this young ones, for this advice will one day save your lives.");
  }
  if ($count == 6) {
    quest::say("Be sure to stock yourself with plenty of food and water before forming a battle group. It is not wise to leave your companions without your aid while you return home for more supplies. There is plenty of time to relax at the tavern when your mission is accomplished.");
  }
  if ($count == 7) {
    quest::say("They raid our trade routes even as I speak. We cannot afford to let the Gor Taku supply them with even more aid!");
  }
  if ($count == 8) {
    quest::say("It is our duty to protect the roads. We need to maintain a steady flow of supplies from the furless ones.");
  }
  if ($count == 9) {
    quest::say("It is wise to make use of your enemy's equipment. Our supply is short as it is.");
  }
  if ($count == 10) {
    quest::say("Kick your enemy to throw them off balance. Then strike with your blade. It is important to stay on your toes.");
     $count = 0;
    quest::settimer("karim",175);
  }
}

sub EVENT_COMBAT {
 if($combat_state == 1){
 quest::say("Prepare to greet your ancestors filth!");
 }
 if($combat_state == 0) {
 quest::say("Leave this corpse to scavengers. This scum deserves no burial.");
 }
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings adventurer. Pay no heed to Captain Koldar should you see him. Our true enemy are the Gor Taku. It is very apparent that they are in league with the Loda Kai Brigands. We need to show the Shak Dratha that we are not their enemy. Help me destroy the Gor Taku clan, return to me with four of their earthcaller stones and I will help supply you."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:shadeweaver  ID:165163 -- Captain_Karim 
