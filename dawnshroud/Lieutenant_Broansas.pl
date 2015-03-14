sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Greetings Stranger, is there something I can help you with? I would love to chat with you but i'm afraid I have to stay focused on the [case] I am investigating.");
  }
  if($text=~/case/i){
    quest::say("Well, $name. I'm monitoring a possible smugglers ring down there ahead of us in the distance. That group down there sure has a large shipment of goods and I intend to find out why.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4760 => 1)) {
    quest::say("You are sent from Lady Mistala I see? Ah of course she needs my reports. I trust you will return these documents to Mistala at once. Here you are, and thank you for your help. I shall have more reports soon.");
    quest::summonitem(4761);
    quest::exp(2500);
    quest::faction(152,10); #house of fordel
    quest::faction(140,10); #haven defenders
    quest::faction(338,10); #traders of the haven
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:dawnshroud  ID:174085 -- Lieutenant_Broansas 

