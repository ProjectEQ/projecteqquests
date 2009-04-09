# NPC: a_boat_scrubber
# Angelox

sub EVENT_COMBAT{
    quest::say("You come any nearer to my boat and you'll be in need of some scrubbin' yerself");
}

sub EVENT_DEATH{
  quest::emote("clutches his chest and collapses to the ground.");
 }

# EOF zone: dulak