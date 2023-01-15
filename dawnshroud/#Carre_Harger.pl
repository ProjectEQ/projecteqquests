# items: 31781, 31783, 31784, 31785, 31786, 31782
sub EVENT_ITEM {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
  if (plugin::check_handin(\%itemcount, 31781 => 1)) {
quest::say("There's been four wolves that have been ravaging the forest. We need them killed. When you are done bring me back their pelts. I know one to be bloodthristy, while the other is enraged. The other two I haven't even seen. But I can hear 'em.");
quest::spawn2(174273,0,0,$x + 5,$y,$z,$h); # NPC: #an_enraged_beast
quest::spawn2(174320,0,0,$x - 5,$y,$z,$h); # NPC: #a_ravenous_beast
}
 if (plugin::check_handin(\%itemcount, 31783 => 1, 31784 => 1, 31785 => 1, 31786 => 1)) {
quest::say("I'm still in shock. I can't believe those pesky wolves are finally gone. Bring this note to Wils, he should have something for you.");
quest::summonitem(31782); # Item: Note to Wils
quest::depop_withtimer();
 }
}
