#zone: dulak NPC:Chester_Steelblade (225164)
#Angelox
#note; I did this quest as per the original, "Titanium" version
# items: 59028, 59004

sub EVENT_SAY { 
 if ($text=~/Hail/i){
  quest::emote("A soft glow fills the cavern as an ethereal form begins to form in front of you. The stern face of a middle aged Erudite forms from the swirling mists and begins to speak to you. 'Find the key to Brokenskull and free me from my torment.'");
 }
}

sub EVENT_ITEM{
  if (plugin::check_handin(\%itemcount, 59028 => 1)){
    quest::emote("Chester Steelblade twitches as the necklace touches the ethereal form. You feel unfamiliar hands in your packs, but before you can check them, the stern face of the ghost turns into a snarl. The spirit's hands dart forward and take hold of your throat with an unholy strength.");
    quest::summonitem(59004); # Item: Spell: Light of Life
    quest::attack($name);
  }
  plugin::return_items(\%itemcount);
}