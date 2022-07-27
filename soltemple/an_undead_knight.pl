# Quest for Darkforge Gauntlets/Greaves/Boots
# items: 12292, 12291, 16507, 3144, 12294, 12293, 12297, 3145, 12296, 12295, 12106, 3146

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Away from this place of torment!  Make haste and flee before you, too, share my [gruesome fate]!!");
  }
  if($text=~/gruesome fate/i){
    quest::say("I was once a proud shadowknight, but failed I did in my master's quest.  I was sent into a lizard fortress deep in the swamplands.  I was to seek out an ancient item for my master.  I failed and was captured. The lizards stripped me of my [darkforge armor] and planned to boil me alive.  Before they could do so, I escaped.  Upon my return to my master's lair I found myself in a [worse predicament].");
  }
  if($text=~/worse predicament/i){
    quest::say("I was torn apart by my master and my bones were given as toys to my master's associates!!  I am now only half Grandyf the Vile.  My hands, feet and legs were sent here and assembled with spare bones of other unfortunates.  Since this is the case, I can only [create darkforge armor] in the form of boots, greaves and gauntlets.");
  }
  if($text=~/create darkforge armor/i){
    quest::say("I and I alone have the power to create darkforge armor!!  It was crafted for me so naturally it is to be worn by shadowknights only.  My armor was taken by the lizardman crusaders.  Unfortunately for them, it lost all power and cannot be worn.  I would be glad to see it put to good use. Do you [seek the darkforge armor]?");
  }
  if($text=~/seek the darkforge armor/i){
    quest::say("Darkforge gauntlets require both of my decayed gauntlets and one enchanted platinum bar.  For the darkforge greaves, I will need both decayed legplates and two pieces of melatite from the Solusek Mining Company.  For the boots, I need both my decayed boots and two parts of fairy dust.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12292 => 1, 12291 => 1, 16507 => 1)) {
    quest::say("Well done, $name, here is your reward.");
    quest::summonitem(3144); # Item: Darkforge Gauntlets
  }
  elsif(plugin::check_handin(\%itemcount, 12294 => 1, 12293 => 1, 12297 => 2)) {
    quest::say("Well done, $name, here is your reward.");
    quest::summonitem(3145); # Item: Darkforge Greaves
  }
  elsif(plugin::check_handin(\%itemcount, 12296 => 1, 12295 => 1, 12106 => 2)) {
    quest::say("Well done, $name, here is your reward.");
    quest::summonitem(3146); # Item: Darkforge Boots
  }
  else {
    if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
    }
  }
  plugin::return_items(\%itemcount);
}
# Updated and corrected by mystic414
# END of FILE Zone:soltemple  ID:80000 -- an_undead_knight