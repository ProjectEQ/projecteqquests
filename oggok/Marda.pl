# items: 18884, 15270, 15226, 15279, 15211, 17929
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome to intelligence, young $name! Did you think all ogres were inept? Ha!! I hope you show the glimmer. We shamans need more within our ranks. Our race needs to evolve!! So, are you one of the smart ogres or have I spoken too many syllables?");
  }
  if ($text=~/smart ogre/i) {
    quest::say("Well, I suppose your intelligence shall grow. You will have to do. I have a mission for you. First, go and speak with Grevak of the Greenblood Knights. He will have a job for you. After you have performed some manner of service and advanced at least 5 ranks, return to me and ask me about my secret mission.");
  }
  if ($text=~/secret mission/i) {
    quest::say("I have heard of your advancements. You are a fine addition to Oggok. I require your skill in handling a delicate matter. I want you to run out to the Bouncer's keep near the entrance to Oggok. There, you shall find a froglok named Glib. He will pose no threat to you. He has come on business and I have promised him protection. Tell him the Greenblood shaman sent you. He shall fill you in. Go at once.");
   quest::spawn2(49127,0,0,383,-205.3,66.1,0); # NPC: Emissary_Glib
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18884 => 1)) {
    quest::say("I see you finally decided to return. Hmmm. What is this? Those little hoppers have done well. What!! So the troll scum have been aiding our foes, the lizards!! The lizard mystics are trained by this troll shaman called Zimbittle. Find him!! Kill him. Bring me his shaman pouch!! Now!!");
    quest::faction(394,20); # Faction: Shamen of War
    quest::summonitem(quest::ChooseRandom(15270,15226,15279,15211)); # Item(s): Spell: Drowsy (15270), Spell: Endure Disease (15226), Spell: Spirit of Bear (15279), Spell: Summon Drink (15211)
  }
  if (plugin::check_handin(\%itemcount, 17929 => 1)) {
    quest::say("Ahhh!! Good work. You are a bright one. Now let us see if you can master this spell. Learn it well and may it bring you much glory.");
    quest::faction(394,20); # Faction: Shamen of War
    quest::summonitem(quest::ChooseRandom(15270,15226,15279,15211)); # Item(s): Spell: Drowsy (15270), Spell: Endure Disease (15226), Spell: Spirit of Bear (15279), Spell: Summon Drink (15211)
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:oggok  ID:49038 -- Marda
