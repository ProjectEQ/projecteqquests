#BeginFile trakanon\Kaiaren.pl
#Quest for Trakanon's Teeth - Kaiaren (Mad): Monk Epic 1.0

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("AHHH get it away from me go away .. leave me alone");
  }
  if($text=~/celestial fists/i) {
    quest::say("Eh? What's that? Bah! That was destroyed long ago. Don't waste my time with fairy taAAAAAGGHHH GET IT AWAY!!!! HELP!!! They're all over MEHEHEHEHEEEEEEee!!");
  }
}

sub EVENT_ITEM {
  if((plugin::check_handin(\%itemcount, 1683 => 1)) && ($ulevel>=46) && ($class=="Monk")) { #Celestial Fists
    quest::emote("eyes open wide and he attacks you!");
    quest::summonitem(1683); #Celestial Fists
    quest::attack($name);
    quest::spawn(95183,0,0,2470,306,-339); #Kaiaren (True)
  }
  elsif((plugin::check_handin(\%itemcount, 1684 => 1)) && ($ulevel>=46) && ($class=="Monk")) { #Charred Scale
    quest::say("Ahhh, impressive indeed! Now that you have broken the chain of the Fists, the others may come toppling down if you persevere. The Fist of Air is now the weakest, then Earth, and finally Water before the master of them all, Vorash. You must defeat them in order, proving the demise of the last to draw out the one you are after. The task before you now is to take this scale and show it to the Fist of Air wherever he may be. Good luck.");
    quest::summonitem(1684); #Charred Scale
  }
  elsif((plugin::check_handin(\%itemcount, 1688 => 1, 1689 => 1)) && ($ulevel>=46) && ($class=="Monk")) { #Demon Fangs and Book of Celestial Fists
    quest::emote("bows his head and breathes a long sigh as if relived of a great weight. He then looks up at you and says, 'I honestly did not believe you could have defeated Vorash. Even though he sought nothing but war and bloodshed, it is a life nonetheless and we must mourn him. I will sew these fangs into magical fist wraps and they shall be yours. Remember Xenevorash. A purpose can be found for every situation and individual. To achieve perfection is to perceive this truth.'");
    quest::summonitem(10652); #Celestial Fists (Epic)
    quest::targlobal("MnkEpic1",1,"Y1",0000,$charid,000); #Flag for Monk Epic 1.0 completed
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Not bad.. Now lets see if you can find my trueform if you do we discuss this further.");
}
#EndFile trakanon\Kaiaren.pl (95105)