sub EVENT_SPAWN {
  $start_event = undef;
  quest::set_proximity(0, 100, 0, 100, 0, 20);

}

sub EVENT_PROXIMITY_SAY {
if($start_event == undef) {
if(plugin::check_hasitem($client, 67415)) {
  if ($text=~/i wish to enter/i) {
  quest::say("Enter");
    quest::movegrp(281,-1741, -1078, -4);
    quest::starttimer(1,370);
    quest::starttimer(2,10);
    $start_event = 1;
    }
  }
}
}
sub EVENT_TIMER {
  if ($timer == 1) {
     quest::stoptimer(1);
     quest::movegrp(281,-1053,438,-16);
     quest::depopall(281114);
     quest::depopall(281117);
     quest::depopall(281123);
     quest::depopall(281119);
     quest::ze("Understand that the punishment for spying is death!  Kreshin Silentcog if now executed!  All Hail Pixtt Xictic Krvne!");
     $start_event = undef;
}
 if ($timer == 2) {
     quest::stoptimer(2);
     quest::depopall(281115);
     quest::spawn2(281114,0,0,-1654,-1154,-15,209);
     quest::spawn2(281114,0,0,-1666,-1140,-15,219);
     quest::spawn2(281114,0,0,-1691,-1169,-15,230);
}
 if ($timer == 3) {
   quest::stoptimer(3);
   quest::depop(281124);
   quest::movegrp(281,-1053,438,-16);
   $start_event = undef;
   
}
}
sub EVENT_SIGNAL {
  if($signal == 1) { #signal 1 is from the a_chamber_guardian
         $counter += 1;
}
  if($counter == 3) {
     quest::depopall(281120);
     quest::spawn2(281114,0,0,-1702,-993,-15,139);
     quest::spawn2(281114,0,0,-1686,-999,-15,143);
     quest::spawn2(281114,0,0,-1662,-1012,-15,164);
}
  if($counter == 6)  {
     quest::depopall(281121);
     quest::spawn2(281114,0,0,-1778,-1167,-15,13);
     quest::spawn2(281114,0,0,-1804,-1155,-15,26);
     quest::spawn2(281114,0,0,-1829,-1102,-15,51);
}
  if($counter == 9)  {
    quest::depopall(281118);
    quest::depopall(281122);
    quest::spawn2(281123,0,0,-1741,-1078,-4.8,126.5);
    quest::spawn2(281117,0,0,-1678,-1080,-14.4,193.3);
    quest::spawn2(281117,0,0,-1788,-1079,-14.5,67);
}
 if ($signal == 2) {
   quest::stoptimer(1);
}
  if($signal == 3) {
  quest::starttimer(3,60);
  
    }
  }
