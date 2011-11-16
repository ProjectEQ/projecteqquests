#Tratlan_Jowyr.pl
#The Magic Pool


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::emote("looks deeply into the pool in front of him, 'Well darn it! I still can't see anything in this blasted [pool], can you Wicas?");
    #Need to trigger Wicas to say: "Nothing at all. Do you think that he led us astray?" right after this.
    quest::signalwith(202301, 1, 1000);
  }
  if($text=~/pool/i) {
    quest::emote("glances up at you like he just noticed your presence, 'This pool. There is supposed to be strong [magic] in it.'");
  }
  if($text=~/magic/i) {
    quest::say("Scrying magic. These pools can supposedly glance into all of the knowledge past, present, and future.");
    #Need to trigger Wicas to say: "I think we should just do what [Tarerd] wants us to do."
    quest::signalwith(202301, 2, 1000);
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 15960 => 1)) {#The Reflecting Pools of Tanaan
    quest::emote("leafs quickly through the book. 'Thank you, it will take quite some time to go through all the information here. Here is a little something for your troubles.'");
    quest::summonitem(9321); #Fine Cut, Diamond Inlaid Mask
    quest::gainexp(1485000);#Can do at 30, giving 5% of 31 xp...gotta run to droga, bit of a pain.
  }
  
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
    
}


sub EVENT_ENTER
{
	quest::signal(202273,5); #Qadar
}#END of FILE Zone:poknowledge  ID:202061 -- Tratlan_Jowyr 

