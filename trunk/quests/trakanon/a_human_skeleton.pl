# Zone: Trakanon's Teeth
# Short name: Trakanon
#
# NPC Name: a_human_skeleton
# NPC ID: 95058, 95125, 95138, 95146
#

# Quest: Brain Bite (Concussion)
# NPC's Involved: Despondo (Firiona Vie), a_human_skeleton (x3, Trakanon's Teeth, Karnor's Castle, City of Mist)

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Save my.. Soul.. Find.. Wizard.. Desp..");
  }
}

sub EVENT_ITEM {

# Hand in Hampton's Bottle
  if (plugin::check_handin(\%itemcount, 12962 => 1)) {
    quest::summonitem(12965); # Bottle of swirling smoke (Hampton's soul)
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}

