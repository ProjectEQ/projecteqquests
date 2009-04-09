#Gandan Tailfist is part of the quest line for the Whistling Fists

sub EVENT_SPAWN {
 quest::settimer("Feign",5);
}

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("places a foul smelling book in your hands and speaks to you slowly. 'Take this rotting book given to me by lord Cazic Thule himself, I was given another but it has been lost. The search for the fists will be the end of me. If you are a monk of the final rung show me your Shackle of Tynnonium and I will share with you what I have found.");
  quest::summonitem(18899);
 }
}

sub EVENT_ITEM {
  if($itemcount{4199} == 1){
  quest::say("The search for the fists has killed many so I hope that your strength is more than mine and those in the past. I was given this satchel by the lord Cazic Thule. I have searched for the fists in this place but they are not here. I suggest you seek audience with our lord. Tell him that I have failed in my task. I am sure that he ugnnnnnhnnn.' One last look to you is given before falling completely lifeless to the cold stone.");
  quest::summonitem(4199);
  quest::summonitem(17364);
  quest::exp(20000);
  quest::ding();
  quest::depop();
 }
 else{ 
 plugin::return_items(\%itemcount);
 quest::say("That is not what I sent you for."); #Made this up
 }
}

sub EVENT_TIMER {
 if($timer eq "Feign") {
 $npc->SetAppearance(3);
 quest::stoptimer("Feign");
 }
}

#Submitted by: Jim Mills