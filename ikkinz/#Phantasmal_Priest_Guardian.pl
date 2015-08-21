#     #Phantasmal_Priest_Guardian.pl
#     294611
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60246 =>1 )) {
     quest::signalwith(294614,294611,0);
   }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::spawn2(294610,0,0,$x,$y,$z,$h);
    quest::depop_withtimer();
    }
}
