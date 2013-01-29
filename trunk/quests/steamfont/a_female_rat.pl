#Bertoxxulous Initiate quest npc

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10262 => 1)) {
    quest::emote("sniffs the vial of liquid, then licks up the contents.");
    quest::summonitem(10263); #Empty infectious vial
    quest::exp(100);
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2(56148,0,0,$x,$y,$z,$h);
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}