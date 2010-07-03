#BeginFile: barindu\Viarglug.pl
#Quest file for Barindu - Viarglug (Passive): Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_SPAWN {
  quest::settimer("ViarglugDepop",1800); #Despawn after 30 minutes
}

sub EVENT_SAY {
  if(($text=~/hail/i) && (defined($qglobals{Soulwhisper}) && ($qglobals{Soulwhisper} == 2))) {
    quest::say("I wonder how much I could get for the tongue of a blithering fool..leave before I decide to find out for myself.");
    $boss = quest::unique_spawn(283156,0,0,$x,$y,$z,$h); #Viarglug (Active)
    $bossobj = $entity_list->GetMobID($boss);
    $bossnpc = $bossobj->CastToNPC();
    $bossnpc->AddToHateList($client,1);
    quest::stoptimer("ViarglugDepop");
    quest::depop();
  } 
} 

sub EVENT_TIMER {
  quest::stoptimer("ViarglugDepop");
  quest::depop();
}
#EndFile: barindu\Viarglug.pl (283158)