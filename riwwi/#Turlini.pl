# items: 52150, 52161, 52233, 52085, 52234, 52086, 52235, 52087, 52236, 52088, 52237, 52089, 52238, 52090, 52239, 52091, 52240, 52092, 52241, 52093, 52242, 52094, 67417
sub EVENT_SAY {
  if($text=~/hail/i) {
    if (defined $qglobals{bic_riw} && $qglobals{bic_riw} == 7) {
      quest::emote("beams with excitement");
      quest::say("I recognize you! One of the adventurers we've heard tales about! There are rumors of you destroying the Legion of Mata Muram. Have you come to [" . quest::saylink("set you free",0,"set us free?") . "]");
    }
  }
  if($text=~/set you free/i) {
    if (defined $qglobals{bic_riw} && $qglobals{bic_riw} == 7) {
      quest::say("Bless you, we're saved! Listen up, friend. I've already formulated a plan to stage a quick and decisive escape, but first we need to get our hands on a complete set of shackle keys. Just a few won't suffice; it must be entire set. If we were to rescue only some of my brethren, those that remain behind would be brutally tortured beyond imagination. Now, I've watched the guards carefully and counted the silvery keys they carry. There are ten in total. Combine the set in this sack and return it to me. I knew you would help!");
      quest::summonitem(52150); # Item: Turlini's Key Bag
    }
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52161 =>1 )) {
    quest::emote("fishes a jagged key from the sack and tries it on his manacles. They unlock with a loud snap and slide off his wrists. His expression melts into simultaneous shock and elation. ");
    quest::say("YES! We will be freed. Very soon now, these chains will bind my people no longer! And as for you, $name, you will become a legend among my people.");
    quest::emote("can barely contain his excitement.");
    quest::say("This is wonderful news, friend. Freedom is within our grasp! The only problem remaining is the ever-present guards. They are always watching over us. We would need a monumental distraction to buy enough time for me to release everyone. Which is where you come in. One of your kind who goes by the name of Reyna has been taken to the arena and has been tortured daily in front of the Muramite masses. If you were to create enough of a ruckus in the arena trying to free her I think we could make our escape.");
    quest::faction(1770,10); # Faction: Yunjo Slave Resistance
    quest::faction(1771,-10); # Faction: Gladiators of Mata Muram
    quest::exp(10000);
    quest::setglobal("bic_riw",8,5,"F");
    $client->Message(12,"You have received a character flag!");
  }
  if (plugin::check_handin(\%itemcount, 52233 =>1 )) {
    quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52085); # Item: Yunjo's Braided Cord
    quest::setglobal("riwwiarena",2,5,"F");
    quest::depop_withtimer();
  }
  if (plugin::check_handin(\%itemcount, 52234 =>1 )) {
        quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52086); # Item: Yunjo's Sea Kelp Cord
    quest::setglobal("riwwiarena",3,5,"F");
    quest::depop_withtimer();
  }
  if (plugin::check_handin(\%itemcount, 52235 =>1 )) {
        quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52087); # Item: Yunjo's Woven Twine Cord
    quest::setglobal("riwwiarena",4,5,"F");
    quest::depop_withtimer();
    }
      if (plugin::check_handin(\%itemcount, 52236 =>1 )) {
        quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52088); # Item: Yunjo's Plaited Hynid-Fur Cord
    quest::setglobal("riwwiarena",5,5,"F");
    quest::depop_withtimer();
    }
        if (plugin::check_handin(\%itemcount, 52237 =>1 )) {
        quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52089); # Item: Yunjo's Hynid Fang Cord
    quest::setglobal("riwwiarena",6,5,"F");
    quest::depop_withtimer(); 
    }
   if (plugin::check_handin(\%itemcount, 52238 =>1 )) {
       quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52090); # Item: Pressed Leather Yunjo Sash
    quest::setglobal("riwwiarena",7,5,"F");    
    quest::depop_withtimer(); 
     }
   if (plugin::check_handin(\%itemcount, 52239 =>1 )) {
       quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52091); # Item: Spiked Leather Yunjo Sash
    quest::setglobal("riwwiarena",8,5,"F");    
    quest::depop_withtimer(); 
     }
   if (plugin::check_handin(\%itemcount, 52240 =>1 )) {
       quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52092); # Item: Woven Bone Yunjo Sash
    quest::setglobal("riwwiarena",9,5,"F");    
    quest::depop_withtimer(); 
     }   
   if (plugin::check_handin(\%itemcount, 52241 =>1 )) {
       quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52093); # Item: Silvery Mesh Yunjo Sash
    quest::setglobal("riwwiarena",10,5,"F");    
    quest::depop_withtimer(); 
     }  
   if (plugin::check_handin(\%itemcount, 52242 =>1 )) {
    quest::emote("shouts with joy");
    quest::say("Aha, you've done it! Thanks to your distractions in the coliseum, the Muramite legion is engulfed in utter chaos. We will take this opportunity to escape. You have saved us all. Oh, I almost forgot! Before I go, take this as a final gift from the Yunjo. It holds much strength, just as you do. Unfortunately I have bad news. Something I could not tell you until now. Reyna passed on a few days ago. Her last request was that I give this to someone who had proven his or her worth. You have more than done that. I wish there were more I could do, but we are masters of shaping stone not life.");
    quest::summonitem(52094); # Item: Sash of the Yunjo's Champion
    quest::say("I can't wait to be reunited with my family! Let's get out of this place.");
    quest::summonitem(67417); # Item: Reyna's Scout Report
    quest::setglobal("bic_riw",9,5,"F");
    $client->Message(12,"You have received a character flag!");
    quest::delglobal("riwwiarena");
    quest::depop(282098);
    quest::depop_withtimer();
 }    
  plugin::return_items(\%itemcount);
}
