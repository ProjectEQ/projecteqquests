#Zone: Soltemple  NPC: Lord_Lyfyx_of_Burwood (80038)
#Qadar
# items: 10028, 12831, 12952

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::doanim(24);
    quest::emote("bows as a courtesy. His face gleams as if tinged with red. 'Greetings, my friend. Welcome to the Temple of Ro, sanctuary to those who follow the words of the Burning Prince.'");
  }
  elsif ($text=~/scale/i) {
    quest::say("Tektite and peridot shall get you what you desire.");
  }
  elsif ($text=~/xyfyl/i) {
    quest::say("So you can pronounce my name backwards.. Is that your lot in life? Pronouncing names backwards? Be gone with your silliness! We need no court fool.");
  }
}

sub EVENT_ITEM {
  if (quest::handin({10028 => 2, 12831 => 1})) { # Items: Peridot x 2, Tektite
    quest::emote("places the gems inside an ornate metal box. He begins to tug at his skin. Your vision blurs as he performs his magic. 'This is what you seek. Now leave and bother me no further.'");
    quest::faction(415,15); # Faction: Temple of Solusek Ro
    quest::faction(416,-15);  # Faction: Shadow Men worse
    quest::summonitem(12952); # Item: Dragon Scales
    quest::exp(50000);
  }
}