# Zone: City Of Mist
# Short name: citymist
#
# NPC Name: a_human_skeleton
# NPC ID: 90167, 90170
#

# Quest: Brain Bite (Concussion)
# NPC's Involved: Despondo (Firiona Vie), a_human_skeleton (x3, Trakanon's Teeth, Karnor's Castle, City of Mist)

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Save my.. Soul.. Find.. Wizard.. Desp..");
  }
}

sub EVENT_ITEM {

# Hand in Mardon's Bottle
  if (plugin::check_handin(\%itemcount, 12963 => 1)) {
    quest::summonitem(12966); # Bottle of swirling smoke (Mardon's soul)
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}

