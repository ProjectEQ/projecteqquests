sub EVENT_ENTERZONE 
{
	my $p2trig = $entity_list->GetMobByNpcTypeID(223191);
	my $p3trig = $entity_list->GetMobByNpcTypeID(223154);
	my $p4trig = $entity_list->GetMobByNpcTypeID(223157);
	my $p5trig = $entity_list->GetMobByNpcTypeID(223158);
	my $p6trig = $entity_list->GetMobByNpcTypeID(223159);
	
	quest::settimer("pokport",15);
	
	if (defined $qglobals{potb_p1_comp} && !$p2trig) 
	{ #looks like we crashed... restart the phase we crashed on
		quest::signalwith(223177,802,0);
	}
	elsif (defined $qglobals{potb_p2_comp} && !$p3trig) 
	{
		quest::signalwith(223177,803,0);
		quest::delglobal("potb_p2_comp_pl");
		quest::setglobal("potb_p2_comp_pl",1,5,"M135");
	}
	elsif (defined $qglobals{potb_p3_comp} && !$p4trig) 
	{
		quest::signalwith(223177,804,0);
		quest::delglobal("potb_p3_comp_pl");
		quest::setglobal("potb_p3_comp_pl",1,5,"D2");
	}
	elsif (defined $qglobals{potb_p4_comp} && !$p5trig) 
	{
		quest::signalwith(223177,805,0);
		quest::delglobal("potb_p4_comp_pl");
		quest::setglobal("potb_p4_comp_pl",1,5,"D5");
	}
	elsif (defined $qglobals{potb_p5_comp} && !$p6trig) 
	{
		quest::signalwith(223177,806,0);
		quest::delglobal("potb_p5_comp_pl");
		quest::setglobal("potb_p5_comp_pl",1,5,"D5");
	}
	$qglobals{potb_p1_comp} = undef;
	$qglobals{potb_p2_comp} = undef;
	$qglobals{potb_p3_comp} = undef;
	$qglobals{potb_p4_comp} = undef;
	$qglobals{potb_p5_comp} = undef;
	$qglobals{timepokport} = undef;
}

sub EVENT_TIMER 
{
	if ($timer eq "pokport")
	{
		if (defined $qglobals{timepokport}) 
		{ #boot them to pok if quarm is dead or they fail
			quest::movegrp(202,-55.82,43.93,-158.81);
			$qglobals{timepokport} = undef;
  		}
		elsif (defined $qglobals{potb_p1_start} || defined $qglobals{potb_p1_comp}) 
		{
			quest::delglobal("potb_p2_comp_pl");
			quest::delglobal("potb_p3_comp_pl");
			quest::delglobal("potb_p4_comp_pl");
			quest::delglobal("potb_p5_comp_pl");
		}
		elsif (defined $qglobals{potb_p2_comp} && !defined $qglobals{potb_p2_comp_pl}) 
		{ #here we set the globals so they can re-enter the zone if they leave.
			quest::delglobal("potb_p2_comp_pl");
			quest::setglobal("potb_p2_comp_pl",1,5,"M135");
		}
		elsif (defined $qglobals{potb_p3_comp} && !defined $qglobals{potb_p3_comp_pl}) 
		{
			quest::delglobal("potb_p2_comp_pl");
			quest::setglobal("potb_p3_comp_pl",1,5,"D2");
		}
		elsif (defined $qglobals{potb_p4_comp} && !defined $qglobals{potb_p4_comp_pl}) 
		{
			quest::delglobal("potb_p3_comp_pl");
			quest::setglobal("potb_p4_comp_pl",1,5,"D5");
		}
		elsif (defined $qglobals{potb_p5_comp} && !defined $qglobals{potb_p5_comp_pl}) 
		{
			quest::delglobal("potb_p4_comp_pl");
			quest::setglobal("potb_p5_comp_pl",1,5,"D5");
		}
		elsif (defined $qglobals{quarm_down} && !defined $qglobals{quarm}) 
		{
			quest::delglobal("potb_p5_comp_pl");
			quest::setglobal("quarm",1,5,"D5");
		}
	}
	$qglobals{potb_p1_start} = undef;
	$qglobals{potb_p1_comp} = undef;
	$qglobals{potb_p2_comp} = undef;
	$qglobals{potb_p2_comp_pl} = undef;
	$qglobals{potb_p3_comp} = undef;
	$qglobals{potb_p3_comp_pl} = undef;
	$qglobals{potb_p4_comp} = undef;
	$qglobals{potb_p4_comp_pl} = undef;
	$qglobals{potb_p5_comp} = undef;
	$qglobals{potb_p5_comp_pl} = undef;
	$qglobals{quarm_down} = undef;
	$qglobals{quarm} = undef;
	$qglobals{timepokport} = undef; 
}

sub EVENT_CLICKDOOR 
{
	my $d_id = ($doorid % 256);
    	if($d_id == 62 && defined $qglobals{potb_p3_comp})
    	{
            	quest::movepc(223,-401,0,348,128);
       	}
    	elsif($d_id == 24 && defined $qglobals{potb_p4_comp})
    	{
              	quest::movepc(223,-419,0,3,128);
    	}
    	elsif($d_id == 51 && defined $qglobals{potb_p5_comp})
    	{
              	quest::movepc(223,251,-1124,-1,348);
       	}
    	else
    	{
       		$client->Message(0,"You lack the will to use this object.");
       	}
       	$qglobals{potb_p3_comp}=undef;
       	$qglobals{potb_p4_comp}=undef;
       	$qglobals{potb_p5_comp}=undef;
}