sub EVENT_ENTERZONE {

  if(!defined $qglobals{tutbind} && $ulevel == 1) {
    quest::selfcast(2049);
    quest::setglobal("tutbind",1,1,"D30");
  }
  if(!defined $qglobals{tutpop}) {
  quest::popup("Join the revolution!", "<br>&nbsp;&nbsp; &nbsp;&nbsp;Welcome to the Mines of Gloomingdeep. Your fellow captives
                                        need your help to fight the kobolds.  When you are ready to leave the tutorial, talk to
                                        Arias and he will show you the way to your home city.  Should you decide to leave, you
                                        will be able to return to the tutorial from the character select screen until you are
                                        level ten.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;If you need to refresh your memory on topics
                                        that we have already covered, feel free to click on the question mark icon on the
                                        <c \"#00A000\">Toolbar</c> located at the top of your screen.
                                      <br ><br>&nbsp;&nbsp;&nbsp;&nbsp;<c \"#F07F00\">Click 'OK' to continue .</c>");
  quest::assigntask(22);
  quest::assigntask(23);
  quest::setglobal("tutpop",1,1,"D30");
  }
  if($ulevel > 15 && $status < 80){
   $client->Message(15,"You are too high in level to be in this zone.");
   quest::selfcast(2433);
}  
 }

sub EVENT_TASK_STAGE_COMPLETE {
   if ($task_id == 34)
   {
      quest::ze(15, "A cheer arises from the slaves as the last of the Kobold overseers fall.");
   }
} 

sub EVENT_CLICKDOOR 
{
	my $d_id = ($doorid % 256);
	if($d_id == 11)
	{
		my $s_zone = $client->GetStartZone();
		if($s_zone == 9)
		{
			quest::movepc(9,-60.9,-61.5,-24.9);
		}
		elsif($s_zone == 19)
		{
			quest::movepc(19,-98.4,11.5,3.1);
		}
		elsif($s_zone == 24)
		{
			quest::movepc(24,-309.8,109.6,23.1);
		}
		elsif($s_zone == 25)
		{
			quest::movepc(25,-965.3,2434.5,5.6);
		}
		elsif($s_zone == 29)
		{
			quest::movepc(29,12.2,-32.9,3.1);
		}
		elsif($s_zone == 45)
		{
			quest::movepc(45,-343,189,-38.22);
		}
		elsif($s_zone == 49)
		{
			quest::movepc(49,520.1,235.4,59.1);
		}
		elsif($s_zone == 50)
		{
			quest::movepc(50,560,-2234,3);
		}
		elsif($s_zone == 52)
		{
			quest::movepc(52,1.1,14.5,3.1);
		}
		elsif($s_zone == 54)
		{
			quest::movepc(54,-197,27,-0.7);
		}
		elsif($s_zone == 55)
		{
			quest::movepc(55,7.6,489.0,-24.9);
		}
		elsif($s_zone == 61)
		{
			quest::movepc(61,26.3,14.9,3.1);
		}
		elsif($s_zone == 68)
		{
			quest::movepc(68,-214.5,2940.1,0.1);
		}
		elsif($s_zone == 75)
		{
			quest::movepc(75,200,800,3.39);
		}
		elsif($s_zone == 106)
		{
			quest::movepc(106,-415.7,1276.6,3.1);
		}
		elsif($s_zone == 155)
		{
			quest::movepc(155,105.6,-850.8,-190.4);
		}
		else
		{
			quest::movepc(202,-55,44,-158.81);
		}
	}
}