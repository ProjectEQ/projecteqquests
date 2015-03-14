#REVISED: Angelox
#Zone: timorous
sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hello there. We have most the ships working again. If you need to [travel to Butcherblock] or want to know more about [travel to Overthere],  [travel to Oasis] or [travel to Firiona] I can help you with this."); }
if ($text=~/travel to butcherblock/i){quest::movepc(68,3168.92,851.92,11.66); }
if ($text=~/travel to overthere/i){quest::say("The bloated Belly docks at the ogre camp"); }
if ($text=~/travel to oasis/i){quest::say("Take the raft north of the ogre camp"); }
if ($text=~/travel to firiona/i){quest::say("Take the shuttle to Firiona Vie"); }
}