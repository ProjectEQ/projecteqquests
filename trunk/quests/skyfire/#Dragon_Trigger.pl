sub EVENT_SPAWN {
    quest::settimer(1,1);
}
sub EVENT_TIMER {
      {

      quest::stoptimer(1);

      quest::settimer(1,1);

      }

        if($timer == 1 && defined $qglobals{door_one} && defined $qglobals{door_two} && defined $qglobals{door_three} && defined $qglobals{door_four} && !defined $qglobals{dragon_not_ready}) {
          quest::spawn2(91097,0,0,921.7,936.8,-172.7,144.4);
          quest::depop_withtimer();
          }
}
