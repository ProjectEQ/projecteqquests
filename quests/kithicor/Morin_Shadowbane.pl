sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Hail, $name. I am the leader of this beleagured troop of rangers. Even though the once fair Kithicor slowly succumbs to the [darkness] at hand, we shall not abandon the woods without a fight.");
 }
 elsif($text=~/darkness/i){
  quest::say("The denizens of these woods are slowly being overrun by dark fiends and shadowed men. As valiantly as we have fought, our numbers dwindle. We know very little about our aggressors, but if we [acquire some information] or perhaps [fine weapons], then we may yet have a chance to retake the woods once more.");
 }
 elsif($text=~/acquire some information/i){
  quest::say("Your tracking skills are invaluable to our cause, brave $name. Our scouts have reported of a Ghoul Messenger. They have spotted him traveling between Kithicor and an undead camp in the Plains of Karana. They have attempted to track the monster and obtain any Strategic Domumentation he may be carrying. Perhaps you can succeed where others have failed. Perhaps you can earn my personal short sword.");
 }
 elsif($text=~/fine weapons/i){
  quest::say("My soldiers are valiant, but poorly equipped. I have heard of a magical weapon of great power, some call it the Ebony Blade. Amongst the Froglocks there can be found a Minotaur who wields this sword of might. If you are a ranger and could provide me with this sword then I would gladly exchange it with my own meager weapon. If you prefer, you may attempt to [acquire some information] for us instead.");
 }
 elsif($text=~/another service/i){
  quest::say("Very well then, your help will bring us closer to solving the mystery of Kithicor! Find Bryn Fynndel in Lesser Faydark and tell him Morin sent you. His band of elven warriors are observing the activities of the Crushbone Orcs and Mistmoore dark elves, perhaps you can help them shed some light on our plight.");
 }
}

sub EVENT_ITEM {
 #Handin: 1x a Strategic Map of Kithicor (16548)
 if(plugin::check_handin(\%itemcount, 16548 => 1)){
  quest::say("Excellent work, $name!! It is obvious that you are a highly skilled tracker and warrior. Accept this reward, my personal sword which has served me well in countless battles.");
  quest::summonitem('5422'); #Short Sword of Morin (5422)
 }
 #Handin: 1x Ebony Bladed Sword (5405)
 elsif(plugin::check_handin(\%itemcount, 5405 => 1)){
  quest::say("Excellent work, $name!! It is obvious that you are a highly skilled tracker and warrior. Accept this reward, my personal sword which has served me well in countless battles.");
  quest::summonitem('5422'); #Short Sword of Morin (5422)
 }
 #Handin: 1x Sealed Ghoul Boss' Log Book (20638)
#elsif(plugin::check_handin(\%itemcount, 20638 => 1)){
# quest::say("We meet again, $name. This log reveals much of the machinations of our dark oppressors, but not enough. Deliver these orders to Bryn in Lesser Faydark, and he will provide you with another weapon to aid in our defense of Kithicor.");
# quest::summonitem('0000'); #Sealed Orders (0000)
#}
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}


#Scripted By: Senzo
