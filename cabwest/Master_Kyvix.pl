# items: 17024, 12848, 12420, 4262, 4263, 55978, 4264, 12853, 12852, 4265
sub EVENT_SAY {   
  if($text=~/hail/i) {
    quest::say("Quite busy!! Quite busy!! Things must be done. [New components] to be collected!!");
  }
  if($text=~/hail/i && plugin::check_hasitem($client, 4246)) {
    quest::say("So you are expecting to earn your way to rank of revenant, eh? You shall when I have the base and stem of the candle your occultist skullcap.");
  }
  if($text=~/New components/i) {
    quest::say("Yes, yes!! I will need components from beyond the gates. I must
find an [apprentice of the third rank].");
  }
  if($text=~/apprentice of the third rank/i) {
    quest::say("If you truly be an apprentice of the third circle, then there is a Dark Binder skullcap to be earned. Take this sack and fill it with a creeper cabbage, a heartsting telson with venom, brutling choppers and a scalebone femur. When they are combined within the sack, you may return it to me with your third rank skullcap and and we shall bid farewell to the title, apprentice.");
    quest::summonitem(17024); # Item: Brood Sack
  }
  if($text=~/true mission/i) {
    quest::say("I have been waiting for a Nihilist to return. His name was Ryx and I fear his love of ale and the high seas has kept him from his mission. All I want you to do is find him. He should be disguised as a worker and he will give you a tome to bring to me. Return it with your Dark Binder Cap. I am sure that is simple enough for one as simple as you. Be sure to give him this.");
    quest::summonitem(12848); # Item: Spectacle
  }
  # missing text
  if($text=~/Kor Sha Candlestick/i) {
    quest::say("I need the foot and stem of my candlestick. The Stem comes from
Sarnaks. The foot has been stolen by Gripe, in East Cabilis.");
  }
}
sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 12420 => 1, 4262 => 1)) { #full component sack, apprentice skullcap - 3rd rank
    quest::say("Well done, here's your fourth rank skull cap. You can now start your [true mission].");
    quest::exp(200);
    quest::summonitem(4263); #dark binder skullcap
    quest::faction(441,20); # Faction: Legion of Cabilis
    quest::faction(443,20); # Faction: Brood of Kotiz
  }
  if(plugin::check_handin(\%itemcount, 55978 => 1, 4263 => 1)) { #a journal and dark binder skullcap
    quest::say("Well done, here's your fifth rank skull cap. You can now track
down the [Kor Sha Candlestick].");
    quest::exp(200);
    quest::summonitem(4264); #occultist skullcap
    quest::faction(441,20); # Faction: Legion of Cabilis
    quest::faction(443,20); # Faction: Brood of Kotiz
  }
  if (plugin::check_handin(\%itemcount, 12853 => 1, 12852 => 1, 4264 => 1 )) { 
#Stem of Candlestick, Foot of Candlestick, occultist skullcap
    quest::emote("grabs the candle parts and puts them in an odd pouch, then
takes your cap which disintegrates in his palm. He hands you another cap.");
    quest::say("Welcome, Revenant $name. You have done well. The Harbinger awaits you. He seeks a [new revenant].");
    quest::exp(200);
    quest::summonitem(4265); #Revenant Skullcap
    quest::faction(441,20); # Faction: Legion of Cabilis
    quest::faction(443,20); # Faction: Brood of Kotiz
    quest::givecash(0,0,6,0);
  }
    plugin::return_items(\%itemcount);
}
#END of FILE Zone:cabwest  ID:3430 -- Master_Kyvix
