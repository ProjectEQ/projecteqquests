#Caden_Zharik.pl
#Willamina's Needles
# items: 28084, 28085


sub EVENT_SAY {
	if($text=~/Hail/i) {
    quest::say("What?  Oh, sorry.  You appear to be harmless enough.  Never can be too careful these days, you know.  Say. as long as you're here, would you care to have a look at my stock of supplies and see if there's anything you might need?  I worked really hard to scrounge this together, won't you just like to have a look?");
  }
  if($text=~/standard/i) {
    quest::emote("turns white with fear. 'Ah, so he sent you to rough me up, did he? Fine, but you should know you couldn't hurt me any worse than Agrakath Theric would! I'm in a bit of trouble you see, I owe Agrakath some money I haven't got. So I stole the standard to pay him off. If you could please find him and have him somehow erase my debt, I would gladly give the standard back.'");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28084 => 1)) {#Note to Caden
    quest::emote("eyes go wide with relief. 'Oh thank you thank you! Here, take the standard. And do apologize to Boiron for me. It shall never happen again. Again, thank you!'");
    quest::summonitem(28085);#Boiron's Standard
    quest::exp(250);
  }
   plugin::return_items(\%itemcount);
    
}#END of FILE Zone:poknowledge  ID:202128 -- Caden_Zharik 

