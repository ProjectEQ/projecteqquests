sub EVENT_SAY {
  if($text=~/hail/i) {
    if (defined $qglobals{bic_riw} && $qglobals{bic_riw} == 7) {
      quest::emote("beams with excitement");
      quest::say("I recognize you! One of the adventurers we've heard tales about! There are rumors of you destroying the Legion of Mata Muram. Have you come to set us free?");
    }
  }
  if($text=~/set you free/i) {
    if (defined $qglobals{bic_riw} && $qglobals{bic_riw} == 7) {
      quest::say("Bless you, we're saved! Listen up, friend. I've already formulated a plan to stage a quick and decisive escape, but first we need to get our hands on a complete set of shackle keys. Just a few won't suffice; it must be entire set. If we were to rescue only some of my brethren, those that remain behind would be brutally tortured beyond imagination. Now, I've watched the guards carefully and counted the silvery keys they carry. There are ten in total. Combine the set in this sack and return it to me. I knew you would help!");
      quest::summonitem(52150);
    }
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52161 =>1 )) {
    quest::emote("fishes a jagged key from the sack and tries it on his manacles. They unlock with a loud snap and slide off his wrists. His expression melts into simultaneous shock and elation. ");
    quest::say("YES! We will be freed. Very soon now, these chains will bind my people no longer! And as for you, $name, you will become a legend among my people.");
    quest::emote("can barely contain his excitement.");
    quest::say("This is wonderful news, friend. Freedom is within our grasp! The only problem remaining is the ever-present guards. They are always watching over us. We would need a monumental distraction to buy enough time for me to release everyone. Which is where you come in. One of your kind who goes by the name of Reyna has been taken to the arena and has been tortured daily in front of the Muramite masses. If you were to create enough of a ruckus in the arena trying to free her I think we could make our escape.");
    quest::faction(363,10);
    quest::faction(416,-10);
    quest::exp(10000);
    quest::setglobal("bic_riw",8,5,"F");
    $client->Message(12,"You have received a character flag!");
  }
  if (plugin::check_handin(\%itemcount, 52233 =>1 )) {
    quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52085);
    quest::setglobal("riwwiarena",2,5,"H8");
    quest::depop();
  }
  if (plugin::check_handin(\%itemcount, 52234 =>1 )) {
        quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52086);
    quest::setglobal("riwwiarena",3,5,"H8");
    quest::depop();
  }
  if (plugin::check_handin(\%itemcount, 52235 =>1 )) {
        quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52087);
    quest::setglobal("riwwiarena",4,5,"H8");
    quest::depop();
    }
      if (plugin::check_handin(\%itemcount, 52236 =>1 )) {
        quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52088);
    quest::setglobal("riwwiarena",5,5,"H8");
    quest::depop();
    }
        if (plugin::check_handin(\%itemcount, 52237 =>1 )) {
        quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52089);
    quest::setglobal("riwwiarena",6,5,"H8");
    quest::depop(); 
    }
   if (plugin::check_handin(\%itemcount, 52238 =>1 )) {
       quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52090);
    quest::setglobal("riwwiarena",7,5,"H8");    
    quest::depop(); 
     }
   if (plugin::check_handin(\%itemcount, 52239 =>1 )) {
       quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52091);
    quest::setglobal("riwwiarena",8,5,"H8");    
    quest::depop(); 
     }
   if (plugin::check_handin(\%itemcount, 52240 =>1 )) {
       quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52092);
    quest::setglobal("riwwiarena",9,5,"H8");    
    quest::depop(); 
     }   
   if (plugin::check_handin(\%itemcount, 52241 =>1 )) {
       quest::emote("gives you an appraising nod");
    quest::say("Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.");
    quest::summonitem(52093);
    quest::setglobal("riwwiarena",10,5,"H8");    
    quest::depop(); 
     }  
   if (plugin::check_handin(\%itemcount, 52242 =>1 )) {
    quest::emote("shouts with joy");
    quest::say("Aha, you've done it! Thanks to your distractions in the coliseum, the Muramite legion is engulfed in utter chaos. We will take this opportunity to escape. You have saved us all. Oh, I almost forgot! Before I go, take this as a final gift from the Yunjo. It holds much strength, just as you do. Unfortunately I have bad news. Something I could not tell you until now. Reyna passed on a few days ago. Her last request was that I give this to someone who had proven his or her worth. You have more than done that. I wish there were more I could do, but we are masters of shaping stone not life.
");
    quest::summonitem(52094);
    quest::say("I can't wait to be reunited with my family! Let's get out of this place.");
    quest::summonitem(67417);
    quest::setglobal("bic_riw",9,5,"F");
    $client->Message(12,"You have received a character flag!");
    quest::delglobal("riwwiarena");
    quest::depop(282098);
    quest::depop();
 }    
  plugin::return_items(\%itemcount);
}