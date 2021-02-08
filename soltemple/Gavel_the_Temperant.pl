# Cleric quests
# items: 16507, 19010, 19009, 4925, 19016, 19015, 6407, 19047, 19011, 19012, 4926, 19048, 19013, 19014, 9427

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("May the fires of Solusek Ro warm your innards! I am Gavel the Temperant. I work with Sister Blaize to forge the most elegant finery for clerics known to man or beast. Because we have no need for material wealth here in the temple, we ask that you retrieve [ingots and icons] from the lost or fallen brothers and sisters of our order. When mixed with some enchanted, [galvanized], [vulcanized], or [magnetized] platinum into an alloy, the items I can forge are splendid indeed!");
  }
  if($text=~/ingots and icons/i){
    quest::say("The ingots and icons are all named after the virtues of the cleric who held them. The virtues I require are those of the [reverent], the [constant], and the [devout].");
  }
  if($text=~/reverent/i){
    quest::say("Regis the Reverent fell in love with a gypsy girl named Lianna Ferasa who lives in the Rathe Mountains. Ask her what has become of him. Bring me the ingot of the Reverent, the icon of the Reverent, and two enchanted platinum bars and I will forge them into a reward for you.");
  }
  if($text=~/constant/i){
    quest::say("Althuryn the Constant was brutally slain by two aqua goblins. The one called Sludge fled to Runnyeye. The one called Dwigus lives in Dagnor's Cauldron. Bring me the ingot of the Constant, the icon of the Constant, and two galvanized platinum bars and I will forge them into a reward for you.");
  }
  if($text=~/devout/i){
    quest::say("Nebbletob the Devout was once a slave in the mines of Meldrath. The Minotaur Sentry there was particularly cruel to him. He was in the expedition to Everfrost when Brother Theo drowned. When trying to rescue Theo, he came upon some caves under the river. He also narrowly escaped death when a great white beast attacked him. He never saw what the beast was, but it shredded his pack where he kept his icon. Bring me the ingot of the Devout, the icon of the Devout, and two vulcanized platinum bars and I will forge them into a reward for you.");
  }
  if($text=~/galvanized/i){
    quest::say("Enchanted platinum bars can be galvanized by Genni, vulcanized by Vilissia, and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest.");
  }
  if($text=~/vulcanized/i){
    quest::say("Enchanted platinum bars can be galvanized by Genni, vulcanized by Vilissia, and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest.");
  }
  if($text=~/magnetized/i){
    quest::say("Enchanted platinum bars can be galvanized by Genni, vulcanized by Vilissia, and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest.");
  }
}

sub EVENT_ITEM {

  #bracers turn in
  if(plugin::check_handin(\%itemcount,16507 => 2, 19010 => 1, 19009 => 1)) {
    quest::say("Well done! You are truly a skilled cleric. I have crafted you a bracer - take it.");
    quest::summonitem(4925); # Item: Bracers of the Reverent
    quest::faction("415","15");
    quest::faction("416","-15");
    quest::exp(1000);
  }

  # Caduceus of Sacrament
  if(plugin::check_handin(\%itemcount,16507 => 2, 19016 => 1, 19015 => 1)) {
    quest::say("Well done! You are truly a skilled cleric. I have crafted you a weapon - take it.");
    quest::summonitem(6407); # Item: Caduceus of Sacrament
    quest::faction("415","15");
    quest::faction("416","-15");
    quest::exp(1000);
  }

  #chestplate turn in
  if(plugin::check_handin(\%itemcount,19047 => 2, 19011 => 1, 19012 => 1)) {
    quest::say("Well done! You are truly a skilled cleric. I have crafted you a chestplate - take it.");
    quest::summonitem(4926); # Item: Chestplate of the Constant
    quest::faction("415","15");
    quest::faction("416","-15");
    quest::exp(1000);
  }

  #shield turn in
  if(plugin::check_handin(\%itemcount,19048 => 2, 19013 => 1, 19014 => 1)) {
    quest::say("Well done! You are truly a skilled cleric. I have crafted you a shield - take it.");
    quest::summonitem(9427); # Item: Shield of the Devout
    quest::faction("415","15");
    quest::faction("416","-15");
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}

# Quest edited by mystic414

