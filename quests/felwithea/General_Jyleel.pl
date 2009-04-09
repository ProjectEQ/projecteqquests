# Orc Runner
# Illegible scroll
# The Falchion
# Paladin Guildmaster

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Stand at attention!!  I am General Jyleel. of the Koada'Vie. defenders of Felwithe.  Do you [follow Tunare]. the Mother of All. or do you still [seek your enlightenment]?");
}
if($text=~/follow Tunare/i){
quest::say("Then you are wise indeed.  Would you like to [assist the defenders] in our conflicts or have you other business to attend to?");
}
if($text=~/seek my enlightenment/i){
quest::say("Then seek it within these walls.  We welcome all fine upstanding Koada'Dal.");
}
if($text=~/what assist the defenders/i){
quest::say("Seek out the Crushbone orcs of the Faydarks.  We must have their oracle scrolls.  They are illegible to you. but we will study them here in Felwithe.  Only the orc oracles will carry them. so be very careful.  There is also the problem with the [Crushbone runners]."); 
}
if($text=~/what crushbone runners/i){
quest::say("The Crushbone orcs are sending messages across the Ocean of Tears to Antonica.  Why. we do not know.  The runner is usually spotted on the open pathways of Butcherblock. running toward the docks.  Find him. kill him. and return his note pouch.");
}
if($text=~/faithful paladin of this court/i){
quest::say("I command you to seek out this Ambassor DVinn and rip his heart from his lifeless body. Next, find the supreme caster of the orcs and, finally, find the spot where supplies are dropped by the Teir`Dal for the orcs. There you should find the supply crate. Return all 3 items and you shall wield the falchion.");
}
}

sub EVENT_ITEM { 
 if(plugin::check_handin(\%itemcount, 13225 => 1)){
	quest::say("Very fine work. A pity you are not Koada'Vie. Here is a small reward for you. Anytime you come upon an oracle. remember to return its scroll to me. Go and find your fate on the field of battle.");
	quest::summonitem(quest::ChooseRandom(15200, 15042, 15226, 13360, 15246, 15276)); #low level spell or Rotted Illegible Scroll
	quest::givecash(1,2,0,0);
	quest::faction(178,1); # King Tearis Thex
	quest::faction(8,1); # Anti Mage
	quest::faction(43,1); # Clerics of Tunare
 }
  elsif(plugin::check_handin(\%itemcount, 13226 => 1)){
	quest::say("So, the Teir'Dal are behind the recent advances of the orcs?!! Your news has shed light on their union. It is time to step forth and prove yourself a [faithful paladin of this court].");
	quest::givecash(1,2,0,0);
	quest::faction(178,1); # King Tearis Thex
	quest::faction(8,1); # Anti Mage
	quest::faction(43,1); # Clerics of Tunare
} 
  elsif(plugin::check_handin(\%itemcount, 12330 => 1, 12329 => 1, 13227 => 1)){ # A Large Locked Crate, Blue Orc Head, Black Heart
	quest::say("Very fine work. A pity you are not Koada'Vie. Here is a small reward for you. Anytime you come upon an oracle. remember to return its scroll to me. Go and find your fate on the field of battle.");
	quest::summonitem(5379); # Falchion of the Koada'Vie 
}
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:felwithea  ID:61026 -- General_Jyleel.pl

