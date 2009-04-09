sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Hail there, $name! If you are not a [member of the White Rose], then it be best that you stay on the lower level. This here floor is for honest ...ermm respectable rogues only.");
  quest::signalwith(29070,1001,100);
  }
  if($text=~/i am a member of the white rose/i){
    quest::say("I hope that you are indeed respectable and loyal to Halas and the Rogues of the White Rose. To do otherwise would bring the wrath of the Six Hammers down on you. But enough with talk! Our caravan to the frigid north leaves in less than two days. and we are short on mammoth calf hides. Return four of them and you will be given items that show your loyalty to our Clan.");      
  }
}

sub EVENT_ITEM {
  if($itemcount{5243} == 4){ # Mammoth Calf Hide X 4
    quest::say("You returned? We believed the gnoll pups got you. The caravan has already left, and these do me little good now. But, as I said before, one must remain respectable. Here is what I promised.");
    quest::exp("2500");
    quest::ding();
quest::ChooseRandom(5238,5239,5242,5236,5233,5231,5240,5241,5234,5232,5235,5237);
    quest::faction("275","10"); # 275 : Faction Rogue's of the White Rose
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:halas  ID:29071 -- Cappi_McTarnigal 
