#my $x;
#my $y;
#my $z;
#my $h;

sub EVENT_SPAWN {
    quest::settimer("warning", 21480);#Timer for 5 hours and 58 minutes
    quest::settimer("despawn", 21600);#Timer for 6 hours
}

sub EVENT_TIMER {
if ($timer == "warning") {
    quest::say("Running out of ore soon, get em while they're hot!");
    quest::stoptimer("warning");
    }
if ($timer == "despawn") {
    quest::depop_withtimer();
    quest::stoptimer("despawn");
    }
}


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
  if(plugin::check_handin(\%itemcount, 10953 => 1)) {
quest::say("Thank you $name! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
    quest::exp(250);
    quest::faction(152, 10);
    quest::faction(153, 10);
    quest::faction(154, 10);
    quest::faction(338, 10);
    quest::givecash(0, 0, 0, 44);
   	$x = $npc->GetX();
	$y = $npc->GetY();		
        $z = $npc->GetZ();		
        $h = $npc->GetHeading();
    quest::spawn2(151057, 0, 0, $x, $y, $z, $h);
    quest::depop_withtimer();
  }
if(plugin::check_handin(\%itemcount, 10952 => 1)) {
quest::say("Thank you $name! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
    quest::exp(250);
    quest::faction(152, 10);
    quest::faction(153, 10);
    quest::faction(154, 10);
    quest::faction(338, 10);
    quest::givecash(0, 0, 0, 14);
   	$x = $npc->GetX();
	$y = $npc->GetY();		
        $z = $npc->GetZ();		
        $h = $npc->GetHeading();
    quest::spawn2(151057, 0, 0, $x, $y, $z, $h);
    quest::depop_withtimer();
  }
}