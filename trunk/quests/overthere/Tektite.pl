#Zone: Overthere  NPC: Tektite
#Qadar

sub EVENT_SAY {
  if($text=~/tektite/i){
    quest::emote("makes the sound of grinding rocks as he moves his mouth. You cough uncontrollably from the dust cloud it creates. 'YOU SEEK TO OWN ME?' ");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10011 => 2)){
    quest::emote("takes one hand and pries out one of his eyes, which he casts far into the plains. He then places the carnelian into his eye socket. He turns towards you and holds open his palm. ");
    quest::emote("pries out his other eye and places the second carnelian gem in its place. His eyes burn brightly with scarlet fire. He then hands you a fragment of tektite. ");
    quest::summonitem(12831);
  }
  plugin::return_items(\%itemcount);
}


# 10011 = Carnelian
# 12831 = Tektite