#Zone: Iceclad Ocean
#Short Name: iceclad
#Zone ID: 110
#
#NPC Name: Ami
#NPC ID: 110062
#Quest Status: finished
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("flips through a few pages of a small book, reading intently before answering you.");
    quest::say("Ye scurvy dog. I'll strike yer colors 'fore ya can put me on a gibbet. Take that, ya crimp!");
    quest::emote("flips through a few more pages then smiles at you.");
    quest::say("Arrrr!");
  }
  if ($text=~/ye scurvy dog/i) {
    quest::say("Hey, that's pretty good. You did it without a book too. Nice to meet you. I'm the bosun here.");
  }
  if ($text=~/a bosun/i) {
    quest::say("Yup. I think it means I'm in charge of the flag cause that's what the Cap'n told me to take care of. I'm the one who made our symbol, so I get to protect it. I even got my own copy of the grammar manual so I can practice my pirate speech.");    
  }
  if ($text=~/grammar manual/i) {
    quest::emote("nods and shows you the book for a moment.");
    quest::say("We don't have many of them and usually we share. My book is missing a chapter, though.");
  }
  if ($text=~/chapter/i) {
    quest::emote("nods.");
    quest::say("A mate of mine borrowed the P Chapter to draw a map on but then he went and got himself lost. I've memorized the rest of the book but that chapter. Oh, well, I guess I can get by with what I have. Walk the mizenmast and batten down the boom!");
    quest::emote("looks at you proudly.");
    quest::say("Good, eh? I'm one of the best pirates we have.");
  }
}

sub EVENT_ITEM {
  if ($itemcount{30042} == 1) {
    quest::say("Oh! I've been needing this!' She reads over the pages intently. 'Uh. Pirate - A sea robber.' She scratches her head. 'I totally forgot we were supposed to be robbing people. Put down yer weapons and hand over yer platinum and gold ya port side bilge suckers! Heh. This is great. Thank you, $name.");
    quest::emote("grins and goes back to reading.");
    quest::summonitem(18962);
  }
}

#END of FILE Zone: iceclad ID:110062 -- Ami

