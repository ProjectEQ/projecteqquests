# Heretic remains
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, citizen! This is no place for you. Make sure you keep it that way. We do not need any more [hollow men].");
  }
  if ($text=~/hollow men/i) {
    quest::say("There is only one sentence in Erudin, death!! And death by purging is the most common. The insides of the criminal are literally pulled out chunk by chunk through the mouth. Then the hollow man is set adrift to float the seas of Erud's Crossing, his body cleansed of all anarchy.");
  }
  if ($text=~/give me the heretic's remains/i) {
    quest::say("I am afraid the heretic prisoner has escaped. There was a skirmish on the palace grounds so I went to assist. When I returned to my post he was gone! I don't know how... he was locked away in the first cell, across from that no-good, thieving gnome, and it is impossible to break the lock with or without magic. We will find him soon. Tell Guildmaster Markus he has escaped.");
  }
}

#EOF zone: erudnint ID: 23022 NPC: Warden_Lius

