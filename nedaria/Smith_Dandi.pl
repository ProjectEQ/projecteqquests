sub EVENT_SAY {
  if ($text=~/hail/i) {
  quest::emote("Smith Dandi looks to Lirprin for approval and he nods. She turns to you again, smiling broadly, and clasps your fingers in a warm handshake.");
    quest::say("Smith Dandi is my name. I trained under Rondo before we lost him in that horrible incident, bless his poor soul. Lirprin says it's okay to talk, and I understand you have a job for me? Let's see if you have what we need. . .");
    
    #Flag Check
    
    quest::say("Hmm, you're still missing a few things. Keep at it, $name");
    #set Culthor flag
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52346 => 1)) {
    quest::say("By the Gods, where did you come by these embers? These are positively unnatural, and they bare the mark of Solusek himself!' She sprinkles a handful of the smoldering lumps into the forge and -KABOOM- a blast of incredible heat knocks you off your feet. Immediately, the metal of the forge swells and becomes white hot. 'Yep, this will do the trick,' she gloats cheerfully. The blazing heat doesnt seem to bother her. ");
  }
}