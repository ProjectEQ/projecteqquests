#NPC ID: 31080
# items: 20372, 20370
# quest: Bard Epic 1.0

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20372 => 1)) {
    quest::say("Ah! 'Bout time ye got yer lazy bones down here! I was beginnin' ta worry bout ya. Thought ye'd never pick the doll up. Me kin worked and toiled over this thing fer days. That Baenar was sure exact in every detail. For a special child, he said. Must be some child. He spent all he had and some he didn't. Still owes us a show! Anyway, I heard she passed away some time ago. Give the lad muh regards.");
    quest::summonitem(20370); # Item: Mechanical Doll
  }
}

#END of FILE Zone:soldunga  ID:31080 -- Marfen_Binkdirple

