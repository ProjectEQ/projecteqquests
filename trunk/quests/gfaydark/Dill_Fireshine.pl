sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome to the treetops and the home of Faydark's Champions. We are the skilled rangers of the Faydarks. You are safe in Kelethin. but watch yourself upon the forest floor. I hear the [blue meanies] have been on the rise.");
  }
  if($text=~/blue meanies/i) {
    quest::say("That is a little name I have given the Crushbone orcs. It appears they have increased their numbers. The Emerald Warriors are charged with our defense against them. We rangers are to seek out the [orc saboteurs].");
  }
  if($text=~/orc saboteurs/i) {
    quest::say("As others move to battle the orc armies. we have word that the orc pawns have been sent into the woods to damage the great trees which support Kelethin. We shall employ the talents of our young rangers to halt their efforts. I currently seek those who will [hunt the orc pawns].");
  }
  if($text=~/hunt the orc pawns/i) {
    quest::say("Go to the forest floor and seek out the orc pawns. Within their ranks can sometimes be found orc hatchetmen. They carry orc hatchets which you must return and I shall reward you for every two orc hatchets and perhaps offer you a weapon in return. should we have any to spare at the time.");
  }
  if($text=~/crushbone allies/i) {
    quest::say("Yes.."); #Real text still needed
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12108 => 2)) {
    quest::say("Fantastic work!! Your actions shall earn you the respect of all Fier'Dal!  Take this as a small bounty for your deed.  We have heard of [Crushbone allies] who wish our demise.");
    quest::summonitem(quest::ChooseRandom(5048,5366,5023,7009,5013));
    quest::givecash(12,0,0,0);
    quest::faction(10404,1);
    quest::faction(105,1);
  }
  
  if (plugin::check_handin(\%itemcount, 13226 => 1)) {
    quest::say("This is excellent, it lets us know of our enemies plans.  You have done all of Kelethin a great service.");
    quest::summonitem(quest::ChooseRandom(5048,5366,5023,7009,5013));
    quest::givecash(12,0,0,0);
    quest::faction( 43, 10);
    quest::faction( 99, 10);
    quest::faction( 178, 10);
    quest::faction( 304, 10);
    quest::faction( 63, -10);
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
    plugin::return_items(\%itemcount);
  }
  
  
}
#END of FILE Zone:gfaydark  ID:54105 -- Dill_Fireshine