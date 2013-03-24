#BeginFile trakanon\#Kaiaren.pl
#Quest for Trakanon's Teeth - Kaiaren (True): Monk Epic 1.0

sub EVENT_SPAWN {
  quest::settimer(1,3600); #Depop in 1 hour
}

sub EVENT_SAY {
  if(plugin::check_hasitem($client, 1689)) {
    if($text=~/lheao/i) {
      quest::say("Hmmm, never heard of him. Well, it doesn't matter, the book is here now. Curse that idiot for writing it in the first place. Not even sure why I let him stick around. If you ever see that clown monk Aradiel kick him in the shins for me! At any rate, I suppose you'd like to find the Fists and [have a nice chat with them], eh? Their master owes me much. I would reward you well if you were to bring me proof of the master's defeat.");
    }
    if($text=~/have a nice chat with them/i) {
      quest::say("Yes, I suppose you would. All you children looking for fame and glory will eventually learn the poison of ambition. But how will you find them? They are able to meld with their elements seamlessly and they certainly have no interest in fooling with the likes of you. No, you will need to get their attention. Fortunately, I know [how you can do this].");
    }
    if($text=~/how can i do this/i) {
      quest::say("My guess is that the weakest of the Fists will be the easiest to draw out. He is egotistical and arrogant. How he came to master the Discipline of Fire, I do not know. He will most likely be in another form, one of his element. When you find the one you believe to be the Fist, you must challenge him. If you use his true name, Eejag, in your formal challenge, he will respond. A flame can burn intensely but it cannot last for long. Know this when you battle him.");
    }
  }
}

sub EVENT_ITEM {
  if((plugin::check_handin(\%itemcount, 1683 => 1)) && ($ulevel>=46) && ($class=="Monk")) { #Celestial Fists (Book)
    quest::say("Now, then. Where did you find this, monk? This is not just some light reading to be borrowed from the town library. Who gave this to you?");
    quest::summonitem(1689); #Book of Celestial Fists
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
  else {
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_TIMER {
  quest::depop();
}
#EndFile trakanon\#Kaiaren.pl (95183)