#Malcolm_Thimbleton.pl
#Tunic Conversion

my $tunic_text;

sub EVENT_SPAWN {
  $tunic_text = "takes the tunic from you and peers at it. 'What'd you give me this for $name? It's clearly not my size! Oh! you wanted it modified that's right.' He turns and puts the robe on his work bench and slowly but surely goes to work on it. Half way through he spills some of his wine on it. Undaunted, he continues to work until he finally turns back to you and hands you a very well made tunic. Although it does smell of elven wine now.";
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::emote("reeks of elven wine and dwarven ale as you approach him. He's having a hard time putting a sentence together. 'Salut. . . sassaf. . .swee. . .erm. . .hello $name! *hic* I'm sure you're here to. . .to. . .What was I saying? *hic* oh yes! you're here to turn your silly robe into a proper tunic! And I'm just the gnome to do it! Now where'd I put my needle and thread. *hic* Give me that silly robe and I'll make a proper piece of clothing out of it.'");
  }
}
  
  
sub EVENT_ITEM {

  if(plugin::check_handin(\%itemcount, 26528 => 1)) { #Bile Stained Robes
    quest::emote($tunic_text);
    quest::summonitem(77503); #Bile Stained Jerkin
  }
  elsif(plugin::check_handin(\%itemcount, 6073 => 1)) { #Cured Shade Silk Robe
    quest::emote($tunic_text);
    quest::summonitem(77501); #Cured Shade Silk Tunic
  }
  elsif(plugin::check_handin(\%itemcount, 29084 => 1)) { #Guardian Robe
    quest::emote($tunic_text);
    quest::summonitem(77504); #Guardian Jerkin
  }
  elsif(plugin::check_handin(\%itemcount, 10845 => 1)) { #Robe of the Azure Sky
    quest::emote($tunic_text);
    quest::summonitem(77502); #Tunic of the Azure Sky
  }
  elsif(plugin::check_handin(\%itemcount, 2798 => 1)) { #Shade Silk Robe
    quest::emote($tunic_text);
    quest::summonitem(77500); #Shade Silk Tunic
  }
  elsif(plugin::check_handin(\%itemcount, 30858 => 1)) { #Shainai's Nightie
    quest::emote($tunic_text);
    quest::summonitem(77505); #Shainai's Tunic
  }
  plugin::return_items(\%itemcount);
}
#Done