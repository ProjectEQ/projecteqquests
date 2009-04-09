#############
#Erudin Cures
#Author: RealityIncarnate
#NPC: Cipse Tospyr
#Zone: erudnext
#############

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Hello, $name. I welcome you to the Temple of Divine Light. I am the resident healer. If you should ever require the power of Quellious to [bind wounds], [cure disease] or [cure poison], speak with me and I shall help you.");
  }

  if($text=~/bind wounds/i) {
    quest::say("I shall be pleased to help you with your wounds. The Temple of Divine Light requires a tribute of four gold before I may perform the service.");
  }

  if($text=~/cure disease/i) {
    quest::say("Your malady will be nothing more than a memory, but before that can be, we ask that a donation of two gold coins be offered.");
  }

  if($text=~/cure poison/i) {
    quest::say("You must pay the tribute of three gold before I cast the toxin from your body.");
  }
}

sub EVENT_ITEM {
  if ($gold == 3) {
    $npc->CastSpell(203,$userid);
  }

  elsif ($gold == 2) {
    $npc->CastSpell(213,$userid);
  }

  elsif ($gold == 4) {
    $npc->CastSpell(12,$userid);
  }

  else {
    quest::say("We don't offer any services at that price");
    quest::givecash($copper,$silver,$gold,$platinum);
  }
}
  
#END of FILE Zone:erudnext