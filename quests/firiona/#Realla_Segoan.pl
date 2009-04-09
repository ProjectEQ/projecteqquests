# Al'Kabor's Research - Ring of the Messenger
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name. I am Realla Segoan from the city of Erudin. I cannot spend time chatting with you now. I have [official tasks] to perform.");
  }
  if ($text=~/official tasks/i) {
    quest::say("I have been sent to this continent by the High Council of Erudin to find information about the disappearance of [Al'Kabor].");
  }
  if ($text=~/al'kabor/i) {
    quest::say("Al'Kabor is believed to be the most powerful living wizard on Norrath. In addition, he is also one of Erudin's oldest citizens. The High Council is very interested in receiving information about his disappearance. So far, from the [reports] that I have collected, there appears to have been a [troublemaking gnome] involved.");
  }
  if ($text=~/reports/i) {
    quest::say("I have received many reports regarding the disappearance. Adventurers upon this continent have reported sightings of some of Al'Kabor's [missing research notes].");
  }
  if ($text=~/troublemaking gnome/i) {
    quest::say("Yes, a gnome. I have received reports that the gnomish wizard, Ognit Eznertob, was near Al'Kabor when he disappeared. I have attempted to contact him about it, however, he seems to be avoiding me and the city of Erudin. This is not the first time that this gnome has caused trouble for the Erudites. He was arrested a while back for tampering with hatch in the Hole, releasing evil denizens from the Underfoot. If he is responsible for the disappearance, great lengths will be taken to assure the citizens of Erudin that the gnome will no longer be trouble for them.");
  }
  if ($text=~/missing research notes/i) {
    quest::say("It appears that through his travels, the great wizard has misplaced some of his research notes. Perhaps if I can find someone to [help collect the research notes], the High Council may be able to determine what caused Al'Kabor's disappearance. However, only those who truly know the path the great wizard's research has taken him will know where to find the missing research notes.");
  }
  if ($text=~/help collect the research notes/i) {
    quest::say("Excellent! Take this Research Binder and fill it with the research notes when you find them. Once it is filled, seal it and take it to Noilgin Mindtune here at the outpost, so that he may deliver it to Erudin. Be forewarned though, it will be a dangerous path to follow. Most likely, the research notes have fallen into possession of some very dangerous beings.");
    quest::summonitem(17088);
  }
}

# EOF zone: firiona ID: 84161 NPC: #Realla_Segoan

