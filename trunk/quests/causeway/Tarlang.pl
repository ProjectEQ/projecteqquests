#BeginFile: causeway\Tarlang.pl
#Quest file for Nobles Causeway - Tarlang (Passive): Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_SAY {
  if(($text=~/hail/i) && (defined($qglobals{Soulwhisper}) && ($qglobals{Soulwhisper} == 4))) {
    quest::say("You dare speak to me? I do not talk to lesser creatures. Prepare for death!");
    quest::setglobal("Soulwhisper",3,5,"F");
    $boss = quest::unique_spawn(303083,0,0,$x,$y,$z,$h); #Tarlang (Active)
    $bossobj = $entity_list->GetMobID($boss);
    $bossnpc = $bossobj->CastToNPC();
    $bossnpc->AddToHateList($client,1);
    quest::depop_withtimer();
  }
} 

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#EndFile: causeway\Tarlang.pl (303070)