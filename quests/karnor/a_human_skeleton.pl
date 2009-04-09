# Zone: Karnor's Castle
# Short name: Karnor
#
# NPC Name: a_human_skeleton
# NPC ID: 102097
#

# Quest: Brain Bite (Concussion)
# NPC's Involved: Despondo (Firiona Vie), a_human_skeleton (x3, Trakanon's Teeth, Karnor's Castle, City of Mist)

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Save my.. Soul.. Find.. Wizard.. Desp..");
  }
}

sub EVENT_ITEM {

# Hand in Ryla's Bottle
  if (plugin::check_handin(\%itemcount, 12964 => 1)) {
    quest::summonitem(12967); # Bottle of swirling smoke (Ryla's soul)
    quest::depop();
  }
  plugin::return_items(\%itemcount); 
}

