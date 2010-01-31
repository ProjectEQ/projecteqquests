# NPC: General_Bragmur_
# NPC ID: 110118
# Armored version of the General for the 8th coldain prayer shawl quest.
#

sub EVENT_SAY {
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 8897 => 1)) {
    # Expedition Orders
    quest::say("The final orders, follow me closely! I pray that the Kromrif have not learned of our plans to allign with the gnomes.");
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2(110118,55,0,$x,$y,$z,$h);
    quest::depop();
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_SIGNAL {
   # 10 is from the Avatar that the shawl was handed in
   if ($signal == 10) {
      quest::say("I must go tell the Dain of these events immediately!");
      quest::signalwith(110069, 10, 1000);
      quest::settimer("bragmur4", 5);
   }
   elsif($signal == 2) {
      quest::say("Greetings Captain Nalot, I have come to you with a proposition to make.");
      quest::signalwith(110069, 3, 1000);
   }
   elsif($signal == 3) {
      quest::say("Well ya see sir, we have a surplus of Velium that we would not mind sharing with you for yer tinkerin' but would ask a favor in return for it.");
      quest::signalwith(110069, 4, 1000);
   }
   elsif($signal == 4) {
      quest::say("I represent the Dain in this matter, we would like for you to use yer Icebreaker there to head to Antonica and bring reinforcements for the war that is preparing to ensue. We are needin' all the help we can get against the Kromrif.");
      quest::settimer("bragmur3", 3);
   }
}

sub EVENT_WAYPOINT_ARRIVE {
   # Ambush 1
   if ($wp eq "13") {
      # Commander Vjorik shout signal
      quest::signalwith(110096, 102);
      # 110097 - Kromif trackin wolf (first version)
      quest::spawn2(110097, 0, 0, 7518.8, -3539.8, 164.0, 95.1);
      quest::spawn2(110097, 0, 0, 7536.8, -3525.8, 163.2, 125.4);
      quest::spawn2(110097, 0, 0, 7555.5, -3530.8, 162.2, 155.6);
      quest::spawn2(110097, 0, 0, 7512.5, -3575.6, 165.3, 32.8);
   }
   # Ambush 2
   elsif($wp eq "20") {
      # 110120 - Frost Giant Skrimisher (level 54)
      quest::spawn2(110120, 0, 0, 7243.8, -2153.7, 150.2, 110.8);
      quest::spawn2(110120, 0, 0, 7211.8, -2204.5, 145.6, 69.9);
      quest::spawn2(110120, 0, 0, 7254.1, -2246.1, 147.5, 8.9);
      quest::spawn2(110120, 0, 0, 7324.7, -2196.4, 153.9, 188.1);
   }
   # Ambush 3
   elsif($wp eq "33") {
      # 110112 - Commander Kvarid
      # 110121 - Frost Giant Skirmisher (level 55)
      quest::spawn2(110112, 0, 0, 5923.9, -1015.7, 162.5, 129.3);
      quest::spawn2(110121, 0, 0, 5864.8, -1063.2, 157.7, 66.6);
      quest::spawn2(110121, 0, 0, 5894.9, -1110.1, 160.6, 21.6);
      quest::spawn2(110121, 0, 0, 5973.3, -1041.8, 163.0, 177.6);
   }
   # Ambush 4
   elsif($wp eq "68") {
      # 110122 - Kromrif trackin wolf (second version)
      quest::spawn2(110122, 0, 0, 2265.1, 1530.2, 60.1, 142.6);
      quest::spawn2(110122, 0, 0, 2249.0, 1536.2, 56.0, 123.4);
      quest::spawn2(110122, 0, 0, 2234.1, 1530.7, 52.4, 112.4);
      quest::spawn2(110122, 0, 0, 2220.9, 1500.8, 50.4, 87.9);
      quest::spawn2(110122, 0, 0, 2242.6, 1458.6, 52.0, 19.3);
   }
   # Ambush 5
   elsif($wp eq "80") {
      # 110121 - Frost Giant Skirmisher (level 55)
      # 110109 - Commander Vjorik
      quest::spawn2(110109, 0, 0, 2695.9, 3725.1, 249.2, 128.4);
      quest::spawn2(110121, 0, 0, 2678.2, 3719.1, 250.3, 89.4);
      quest::spawn2(110121, 0, 0, 2709.9, 3720.5, 245.5, 165.4);
      quest::spawn2(110121, 0, 0, 2711.9, 3707.5, 242.0, 192.9);
      quest::spawn2(110121, 0, 0, 2678.7, 3690.9, 245.7, 35.4);
      quest::spawn2(110121, 0, 0, 2666.9, 3735.2, 247.8, 95.1);
   }
   # Hail gnome camp
   elsif($wp eq "91") {
      quest::say("Lo there gnomes! Tell me is your camp nearby?");
      # signal Ratop
      quest::signalwith(110052, 101, 500);
   }
   # avatar call conversation
   elsif($wp eq "100") {
      # signal Captain Nalot
      quest::signalwith(110069,1);
   }
   else {
      # do nothing
   }
}

sub EVENT_TIMER {
   if ($timer eq "bragmur4") {
      quest::stoptimer("bragmur4");
      quest::depop();
   }
   if ($timer eq "bragmur3") {
      quest::stoptimer("bragmur3");
      quest::spawn2(110119, 0, 0, 1309.9, 4571.0, 72.6, 24.6);
      # Avatar of Below
   }
}