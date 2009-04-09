# Enchanter epic weapon Staff of the Serpent lead-in quest
# added "of Kunark" to npc dialogue since the quest is six years old now
# Altered for Scryer's Trespass turnins -Kilelen


sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Good day, I have discovered something truly wonderful! If I only had the materials required so I can copy my notes and send them to my teacher.");
  }
  if ($text=~/discover/i) {
    quest::say("I was researching a new spell, and discovered new information concerning the history of the Serpent.");
  }
  if ($text=~/materials/i) {
    quest::say("The materials I need are a mechanical pen, ink of the dark, and white paper. Bring me those and I will give you a copy of this information.");
  }
  if ($text=~/teacher/i) {
    quest::say("My teacher is Jeb Lumsed. He was last seen in the regions of the newly discovered lands of Kunark. If you wish to find him that is where you must seek him out.");
  }
  if ($text=~/ink of the dark/i) {
    quest::say("Dark illusions, thievery, and the plague of the living will guide you. These are the only hints I can provide. Safe travels and may you be protected from all maladies.");
  }
  if ($text=~/mechanical pen/i) {
    quest::say("The answer you seek is in your question. If you are unable to figure it out, then perhaps you are not ready to travel along this path.");
  }
  if ($text=~/white paper/i) {
    quest::say("It may seem like ordinary paper at first. However, this paper was enchanted by a friend of mine. This paper was given to a lass in the Karanas to help with her writings. The paper will guide her hands and draw forth the thoughts in her mind. I no longer have any and I have not had contact with my friend in some time. Search them out.");
  }
}

sub EVENT_ITEM {
  # check for ink of the dark, mechanical pen and white paper
  if (plugin::check_handin(\%itemcount, 10600 => 1, 10601 => 1, 10602 => 1)) {
    quest::say("Yes, that is what I wanted. Here, take these notes. My teacher will be very interested if he is shown what I have found.");
    quest::exp(50000);
    quest::faction(342,30);
    quest::summonitem(10603);
  }
  elsif(plugin::check_handin(\%itemcount, 54008 => 1, 54007 => 1)){#A Dimly Glowing Ring, Note to Stofo
  	quest::emote("scans the note quickly and gasps. Hardly glancing at you, he begins examining the ring, tearing through notes and books scattered about his dark room. As he pores over a scroll of parchment covered in strange texts his eyes light up, 'Yes, yes this is it! Ofala really found something quite remarkable in this one! Watch my friend.' The slim Erudite slips the ring onto his finger and the gem begins to throb, Stofo seems to draw the power into himself for a moment then carefully places the ring back onto his desk. He closes his eyes a moment then turns to you, the darkness in his eyes almost lends fear for a moment before he smiles. 'Thank you my friend, this stone is very dangerous, but I believe that I have accessed the powers within me through it. Take these words and use them well, perhaps the power shall work for you as well, and please tell my dear sister hello.'");
  	quest::summonitem(59016);#Spell: Scryer's Trespass
  	quest::exp(1750000);#1% of level 51 xp
  }
  else {
    plugin::return_items(\%itemcount);
    quest::say("This is not what I wanted.");
  }
}

# EOF Zone: erudnext ID: 24013 NPC: Stofo_Olan

