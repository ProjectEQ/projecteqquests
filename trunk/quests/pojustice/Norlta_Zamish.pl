#########################################################
#  Name:  Norlta Zamish
#  zone:  Plane of Justice
#  Author:  Andrew80k
#########################################################
sub EVENT_SAY {
  if ($text =~ /Hail/i) {
     quest::say("Hmm, is someone there?  I've been [wrongfully imprisoned] I'm waiting for appeal, but its been a long time.  Where, in the name of Brell, is my appeal?");
  }
  if ($text =~ /wrongfully imprisoned/i) {
     quest::say("They have me here for a little [white lie], how can that be justice?  What is this, the Plane of Injustice? The Plane of Unfarity?");
  }
  if ($text =~ /white lie/i) {
     quest::say("Well maybe a little more than a little white lie, but I still don't deserve to be here with murderers and crazy people, and the like.  You look like a fair person, why don't you tell me if you think I should be here, want to [know what happened]?");
  }
  if ($text =~ /know what happened/i) {
     quest::say("I was an apprentice for Varkon Theardor in Ak'Anon, and he sent me to scout the minotaur caves, to make sure the hero wasn't out and about.  Well I made it out to Steamfont, and it was one of the most beautiful days I'd ever seen, halfway to the caves I set down to watch some clouds go by.  Next thing I know it was hours later, I didn't rightly have time to make it to the caves and back, so I went to [Varkon] and told him the hero wasn't around.");
  }
  if ($text =~ /Varkon/i) {
     quest::say("Well little did I know, Varkon was planning a trip to the caves, I guess I should have figured it, but I just wasn't thinking.  Hours passed, until finally word came that the minotaur hero had squished poor Varkon.  When news reached Larkon, Varkon's brother, that I was responsible for Varkon's death he asked that I be set before the Tribunal.");
  } 
}