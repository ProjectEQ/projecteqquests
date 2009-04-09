# Part of Coldain Ring 6 Quest

my $icefang;

sub EVENT_SIGNAL {
  if ($signal == 1161101) {
    quest::moveto(3213, -8064, 146);
    $icefang = 10;
  }
  elsif ($signal == 1161102) {
    quest::moveto(1803, -7757, 193);
    $icefang = 25;
  }
}

sub EVENT_WAYPOINT {

  if ($icefang == 10) {
    quest::moveto(3235, -7970, 146);
    $icefang = 20;
  }

  elsif ($icefang == 20) {
    quest::signalwith(116567, 116567, 0);
    $icefang = 0;
  }

  elsif ($icefang == 25) {
    quest::moveto(1401, -7748, 210);
    $icefang = 30;
  }


  elsif ($icefang == 30) {
    quest::moveto(1030, -7713, 196);
    $icefang = 40;
  }

  elsif ($icefang == 40) {
    quest::moveto(793, -7685, 179);
    $icefang = 50;
  }

  elsif ($icefang == 50) {
    quest::moveto(273, -7149, 146);
    $icefang = 60;
  }

  elsif ($icefang == 60) {
    quest::moveto(165, -6949, 169);
    $icefang = 70;
  }

  elsif ($icefang == 70) {
    quest::moveto(61, -6753, 180);
    $icefang = 80;
  }

  elsif ($icefang == 80) {
    quest::moveto(-159, -6331, 157);
    $icefang = 90;
  }

  elsif ($icefang == 90) {
    quest::moveto(-263, -5697, 164);
    $icefang = 100;
  }

  elsif ($icefang == 100) {
    quest::moveto(-394, -5054, 146);
    $icefang = 110;
  }

  elsif ($icefang == 110) {
    quest::moveto(-171, -4746, 219);
    $icefang = 120;
  }

  elsif ($icefang == 120) {
    quest::moveto(25, -4538, 158);
    $icefang = 125;
  }

  elsif ($icefang == 125) {
    quest::moveto(-300, -4353, 182);
    $icefang = 130;
  }

  elsif ($icefang == 130) {
    quest::moveto(-604, -4180, 243);
    $icefang = 135;
  }

  elsif ($icefang == 135) {
    quest::moveto(-850, -4050, 207);
    $icefang = 137;
  }

  elsif ($icefang == 137) {
    quest::moveto(-1158, -3800, 155);
    $icefang = 140;
  }

  elsif ($icefang == 140) {
    quest::moveto(-1368, -3686, 195);
    $icefang = 145;
  }

  elsif ($icefang == 145) {
    quest::moveto(-1688, -3450, 154);
    $icefang = 150;
  }

  elsif ($icefang == 150) {
    quest::moveto(-2095, -3147, 228);
    $icefang = 160;
  }

  elsif ($icefang == 160) {
    quest::moveto(-3024, -3156, 147);
    $icefang = 170;
  }

  elsif ($icefang == 170) {
    quest::emote("sniffs the ground and growls.");
    quest::moveto(-3730, -3305, 197);
    quest::settimer("icefang", 600);
    $icefang = 180;
    
    my $entid = quest::spawn2(116571, 0, 0, -4319, -3500, 150, 0);
    my $mob = $entity_list->GetMobID($entid);
    my $mobnpc = $mob->CastToNPC();
    $mobnpc->SignalNPC(1);
  }

  elsif ($icefang == 180) {
    quest::moveto(-4404, -3354, 146);
    $icefang = 190;
  }
}

sub EVENT_TIMER {
  if ($timer eq "icefang") {
    quest::stoptimer("icefang");
    # made text up
    quest::emote("blends into the snowy landscape and disappears from sight.");
    quest::depop();
  }
}

# Quest by mystic414