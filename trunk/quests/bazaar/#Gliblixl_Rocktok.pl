#my $x;
#my $y;
#my $z;
#my $h;

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail $name! I sell the finest quality ore imported from the mines of Norrath! It's difficult to keep enough ore available with the demands of the local smiths however and could use some [assistance] in restocking my supplies.");
  }
  if ($text=~/assistance/i) {
    quest::say("Hooray! Fill this crate with either four small bricks of unrefined ore or four large Bricks of unrefined ore from Norrath and I will pay you for your assistance in keeping me in business.");
    quest::summonitem(17814);
  }
}

sub EVENT_ITEM {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $h = $npc->GetHeading();

  if(plugin::check_handin(\%itemcount, 10953 => 1)) {
    quest::say("Thank you $name! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
    quest::exp(250);
    quest::faction(152, 10);
    quest::faction(153, 10);
    quest::faction(154, 10);
    quest::faction(338, 10);
    quest::givecash(0, 0, 0, 44);
    quest::spawn2(151057, 0, 0, $x, $y, $z, $h);
    quest::depop_withtimer();
  }
  elsif(plugin::check_handin(\%itemcount, 10952 => 1)) {
    quest::say("Thank you $name! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
    quest::exp(250);
    quest::faction(152, 10);
    quest::faction(153, 10);
    quest::faction(154, 10);
    quest::faction(338, 10);
    quest::givecash(0, 0, 0, 14);
    quest::spawn2(151057, 0, 0, $x, $y, $z, $h);
    quest::depop_withtimer();
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:bazaar  ID:151004 -- Gliblixl_Rocktok