#This iksar knight is actually Grizzle, for the fourth quest in the Greenmist line, The Test of the Zealot.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("wipes the sweat from his forehead and spits some flarefire seeds on the ground near your feet. 'Whew!! Good to be back and safe at the Cabilis Gate. The troopers will protect us.'");
  }
 elsif($text=~/chalp diagram/i){ #Test of the Zealot (Greenmist Quest 4/8)
  quest::emote("spits out some flarefire seeds. 'Great!! Sent to retrieve the Chalp diagram. I will give them to you, but I want you to do me a little favor first. I want you to [retrieve some spells] I lost. They are incorrectly scribed and useless, but I yearn for their return nonetheless.'");
  }
 elsif($text=~/retrieve some spells/i){ #Test of the Zealot (Greenmist Quest 4/8)
  quest::emote("spits flarefire seeds on you. 'Oops!! Sorry. Yeah!! You go to Chalp and get two incorrectly scribed spells which they grabbed from me. The third one, I threw in a river crossing by Chalp. It was in a bottle and probably drifted way down the river. Bring me all three and also a shovel and I will make it worth your while.'");
  }
 elsif($text=~/flarefire seeds/i){ #Test of the Zealot (Greenmist Quest 4/8)
  quest::emote("spits some flarefire seeds on your face. 'What? Interested in flarefire seeds? There you go. Ha!!'");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12492 => 1, 12493 => 1, 12494 => 1, 6026 => 1)){ #Test of the Zealot (Greenmist Quest 4/8)
  quest::emote("accidently swallows a mouthful of flarefire seeds. 'ACCCKK!!  I can't believe you did it!! Here is the Chalp diagram.'");
  quest::summonitem(12496);
  quest::exp(1000);
  quest::ding();
  quest::faction(62,20);
  quest::faction(193,10);
  quest::depop_withtimer();
 }
 else{ 
 plugin::return_items(\%itemcount);
 quest::emote("spits flarefire seeds on your chest. 'Listen up!! I asked for the misscribed spells; Fear, Lifetap and Gate, and also, a shovel.'");
 }
}
#Submitted by: Jim Mills