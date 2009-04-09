#Zone: Soltemple  NPC: Lord_Lyfyx_of_Burwood (80038)
#Qadar

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::doanim(24);
    quest::emote("bows as a courtesy. His face gleams as if tinged with red.  'Greetings, my friend. Welcome to the Temple of Ro, sanctuary to those who follow the words of the Burning Prince.' ");
  }
  if ($text=~/scale/i){
    quest::say("Tektite and peridot shall get you what you desire.");
  }
  if ($text=~/xyfyl/i){
    quest::say("So you can pronounce my name backwards..  Is that your lot in life?  Pronouncing names backwards?  Be gone with your silliness!  We need no court fool.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10028 => 1, 12831 => 1)){
    quest::emote("places the gems inside an ornate metal box.  He begins to tug at his skin.  Your vision blurs as he performs his magic. 'This is what you seek.  Now leave and bother me no further.' ");
    quest::faction(320,15);        # Temple of Solusek Ro better
    quest::faction(291,-15);       # Shadow Men worse
    quest::summonitem(12952);
    quest::exp(50000);
  }
  else{
    quest::say("This is of no use to me.");
    plugin::return_items(\%itemcount);    
  }
}

# 10028 = Peridot
# 12831 = Tektite
# Reward = 12952 - dragon scale (xyfyl)

