#BeginFile: natimbi\#Whiahdi.pl
#Quest file for Natimbi - Whiahdi: Necromancer Epic 1.5 (Soulwhisper) & 2.0 (Deathwhisper)

sub EVENT_SAY {
  if(plugin::check_hasitem($client,15784)) { #Orb of Deathspeaking
    if($text=~/hail/i) {
      quest::say("You speak to the dead? Not many have that talent. What is it you want from me, mortal?");
    }
    if(($text=~/i want the staff/i) && (defined($qglobals{Soulwhisper}) && ($qglobals{Soulwhisper} == 1))) {
      quest::say("Yes. I did see a paladin with a staff. Before I give you any more information however. I wish for you to perform a task for me. I need you to travel to Barindu and find my most precious possessions from when I was once alive. A muramite in Barindu killed me and took all I owned. If you can get my earthly possessions back, I will help you in regards to the location of the paladin. Find my brother, Taiandao in Barindu. He is still among the living, but is a slave of the vile muramites. Ask him if he knows of the muramite that killed me.");
      quest::setglobal("Soulwhisper",2,5,"F");
    }
    if(($text=~/power/i) && (defined($qglobals{Soulwhisper}) && ($qglobals{Soulwhisper} == 3))) {
      quest::say("I have come to know many spirits from other realms. They speak of a being known as Tarlang who resides in the Realm of Discord in a area known as the Nobles Causeway. He has wronged many of my kin and I wish to see him pay for what he has done. If you bring me his head. I will reward you with a weapon of great power. He believes himself to be indestructible, but he is not. In fact I think you have what it takes to destroy him.");
      quest::setglobal("Soulwhisper",4,5,"F");
    }
    if($text=~/locate the paladin/i) {
      quest::say("I fear for you should you seek the staff, but I promised to help you. I can still hear the staff's dark whispers. It appears that the paladin wielding the staff has been killed and the staff returned to its master. The staff's master has broken the staff into three pieces. two of the pieces have been given to his most trusted minions, and the third piece, a globe of discordant energy, resides in a location known as Anguish, in the Realm of Discord. If you wish to somehow rebuild the staff you must find these three pieces. I can still hear the staff begging for its master. The staff tells me the only way the minions will appear is if a certain phrase is uttered at a place where the power of discord seeks to engulf all. The phrase is, 'Sanait Sanaiij Tsulum'. I don't know what it means or where this place of great discord is however. I'm sorry that's all the staff has told me. If you find all three staff pieces, return them to me along with Soulwhisper and I will see if I can reform the staff for you.");
    }
  }
}

sub EVENT_ITEM {
  if((defined($qglobals{Soulwhisper}) && ($qglobals{Soulwhisper} == 2)) && plugin::check_handin(\%itemcount, 11174 => 1)) { #Whiahdi's Earthly Possessions
    quest::say("You found my possessions! I am most greatful. The paladin you seek did walk by here some time ago. I believe he was on his way to Qinimi. He had a curious staff with him that seemed to whisper dark tidings. That staff seemed to have a very evil presence about it. I would advise you to let the paladin destroy it. I have in my possession another staff of great [power]. I can tell you about if you give up your quest for the paladin and the dark staff. However if you wish to [locate the paladin] I will help you since you did help me.");
    quest::setglobal("Soulwhisper",3,5,"F");
  }
  elsif((defined($qglobals{Soulwhisper}) && ($qglobals{Soulwhisper} == 3)) && plugin::check_handin(\%itemcount, 55855 => 1)) { #Tarlang's Head
    quest::say("Take this weapon for helping me. I regret giving away a weapon of such power, but having it near me was most unsettling. Do not ask how I obtained it.");
    quest::summonitem(62581); #Soulwhisper
    quest::delglobal("Soulwhisper");
	$client->AddAAPoints(5);
	$client->Message(15,"You have gained 5 ability points!");	
	quest::ding();
#    quest::settitle("Deathspeaker");
#    quest::giveAA(5);
  }
  elsif(plugin::check_handin(\%itemcount, 55940 => 1, 55932 => 1, 47100 => 1, 62581 => 1)) { #Staff Piece Number Two, Staff Piece Number Three, Globe of Discordant Engergy, Soulwhisper
    quest::say("It is against my better judgment to rebuild this staff, but I agreed to help you, if you helped me.");
    quest::emote("takes the staff pieces from you and sets them down on the ground. She waves her ghostly hands over the pieces and they begin to glow. A bright, orange flame engulfs the pieces as they begin to join, forming the staff. A bone-chilling shriek fills your ears. You look down to see the staff fully formed. 'Take the staff and leave. I have done something that I should not have done this day.'");
    quest::summonitem(64067); #Deathwhisper
#    quest::settitle("Grand Occultist");
#    quest::giveAA(10);
  }
  plugin::return_items(\%itemcount);
}
#EndFile: natimbi\#Whiahdi.pl (280073)