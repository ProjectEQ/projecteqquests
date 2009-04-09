sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to The Abattoir fellow Cazicite. I am Shwara Volerno. Mistress of Necromancy. If you have just begun to study the Necromantic arts I will assist you with obtaining some [clothing] and a robe that will be most useful when conducting research outside of The Abattoirs walls. We members of the Abattoir are the most feared of the residents of Paineel by the citizens of Erudin. to venture too far beyond the safety of our city unprepared would be foolish.");
}
if($text=~/clothing/i){
quest::say("You will require this Curing Kit that has been specially prepared for the crafting of a suit and robe of Abattoir Initiate Clothing. The components necessary to craft the clothing vary according to the article that  you desire to fabricate. Once you have been outfitted in the proper attire return to me and you may assist with some [important research]. Do you desire to fabricate an [abattoir initiate cap]. [abattoir initiate wristband]. [abattoir initiate gloves]. [abattoir initiate boots]. [abattoir initiate sleeves]. [abattoir initiate pantaloons]. or [abattoir initiate robe]?");
quest::summonitem("17125");
}
if($text=~/important research/i){
quest::say("We Cazicites of the Abattoir are the most advanced Necromancers in all of Norrath. Our greatness is due to the diligence and studiousness we apply to our research. and our powers over fear. The foolish sorcerers in Erudin are afraid of the knowledge we possess. They fear the magic we wield and control. for their minds are too weak to harness it themselves. Despite our vast knowledge there is always more to learn that can prove to be beneficial to The Abattoir. I require your assistance in obtaining some [new information].");
}
if($text=~/new information/i){
quest::say("The Abattoir has recently discovered a Kobold Spiritist that wields necromantic powers. We believe this unusual kobold resides in the Warrens of Clan Kolbok as he has been sighted entering and exiting those ruinous caverns. It is possible that this kobold has somehow acquired this necromantic knowledge from Paineel but I would not like to rule out the possibility that it is a rare form of kobold sorcery. Find this Kobold Spiritist and bring me whatever arcane parchments you discover in his possession.");
}
if($text=~/cap/i){
quest::say("To craft an Abattoir Initiate Cap you must obtain two [silk thread]. woven widow silk. and a briar snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
quest::summonitem("19555","1");
}
if($text=~/gloves/i){
quest::say("To craft Abattoir Initiate Gloves you must obtain two [silk thread]. woven widow silk. two briar snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
quest::summonitem("19559","1");
}
if($text=~/wristband/i){
quest::say("To craft an Abattoir initiate Wristband you must obtain a [silk thread]. woven widow silk. and a briar snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
quest::summonitem("19558","1");
}
if($text=~/sleeves/i){
quest::say("To craft Abattoir Initiate Sleeves you must obtain two [silk thread]. woven widow silk. and two large briar snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
quest::summonitem("19557","1");
}
if($text=~/boots/i){
quest::say("To craft Abattoir Initiate Boots you must obtain two [silk thread]. two woven widow silk. and two briar snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
quest::summonitem("19561","1");
}
if($text=~/pantaloons/i){
quest::say("To craft Abattoir Initiate Pantaloons you must obtain two [silk thread]. woven widow silk. and four large briar snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Leggings Pattern.");
quest::summonitem("19560","1");
}
if($text=~/robe/i){
quest::say("To craft an Abattoir Initiate Robe you must obtain three [silk thread]. two woven widow silks. and two giant briar snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Robe Pattern.");
quest::summonitem("11395","1"); }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 20420 => 1)) {
    quest::say("Well done $name.These parchments will be inspected immediately by some of The Abattoirs most experienced translators and researchers. Take this Rough Abattoir initiate Staff then go forth an obtain a Giant Briar Snake Skin and a Petrified Eyeball. Once you have done so bring me those items and the rough abattoir initiate staff and I will put the final touches on what will be your new instrument of power.");
    quest::summonitem(20358);
    quest::faction(143, 1);
    quest::faction(79, -3);
    quest::faction(112, -3);
    quest::faction(56, -3);
    quest::faction(60, -3);
}
 if (plugin::check_handin(\%itemcount, 20358 => 1, 20356 => 1, 20402 => 1)) {
    quest::emote("fashions a grip out of the Giant Briar Snake Skin, fastens the Petrified Eyeball to a steel mount on one end of the staff, and tarnishes the wood of the staff with a shimmering black substance.");
    quest::say("Here is your new Abattoirs Initiate Staff, $name. May it serve you well in your pursuit for power.");
    quest::summonitem(20418);
    quest::faction(143, 1);
    quest::faction(79, -3);
    quest::faction(112, -3);
    quest::faction(56, -3);
    quest::faction(60, -3);
    quest::ding();
}
  else {
    quest::emote("will not accept this item.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:paineel  ID:75015 -- Shwara_Volerno 

