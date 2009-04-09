#BeginFile: qey2hh1\#Yuanda.pl
#Quest file for West Karana - Yuanda: Necromancer Epic 1.5 (pre)

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Shhh, not so loud. I have heard stories of werewolves in this area..."); #Text made up
  }
}

sub EVENT_ITEM {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();

  if(plugin::check_handin(\%itemcount, 15809 => 1)) { #Note to Yuanda
    quest::say("So you are working for Geboron? Yes I have seen the paladins and the staff they were guarding. They passed through here just one day ago. From what I have been told, they were attacked by a pack of werewolves. All of the paladins were killed and one of the werewolves took the staff. If you want the staff you will need to find these werewolves. Oh, no! Here they come now! I am getting out of here!");
    quest::spawn2(12183, 0, 0, $x-18, $y-35, $z, 180); #a snarling werewolf (normal)
    quest::spawn2(12183, 0, 0, $x+18, $y-35, $z, 180); #a snarling werewolf (normal)
    quest::spawn2(12183, 0, 0, $x-35, $y+10, $z, 180); #a snarling werewolf (normal)
    quest::spawn2(12183, 0, 0, $x+35, $y+10, $z, 180); #a snarling werewolf (normal)
    quest::spawn2(12184, 0, 0, $x,    $y+35, $z, 180); #a snarling werewolf (high)
    quest::depop();
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}

#EndFile: qey2hh1\#Yuanda.pl (00000)