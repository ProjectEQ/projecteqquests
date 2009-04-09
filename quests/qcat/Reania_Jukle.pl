# Ink of the Dark portion of enchanter epic quest lead-in
# 


sub EVENT_SAY {
  if ($text=~/ink of the dark/i) {
    quest::say("Ink of the Dark, you say? That isn't an everyday item, you know. In fact, I can't remember the last time someone requested it. I have given up keeping any here with me. You are going to need to find your own supply now. Sorry.");
  }
  elsif ($text=~/where can i find the ink/i) {
    quest::say("The ink is the blood of a dark scribe. Tempt him and give him this vial. He should cooperate.");
    quest::summonitem(10626);
  }
}

# EOF Zone: qcat ID: 45082 NPC: Reania_Jukle

