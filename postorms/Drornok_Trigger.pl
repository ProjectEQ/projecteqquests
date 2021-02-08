#Check if any tempest toads still alive (210047)
#If none alive, spawn Drornok_Tok_Vo`Lok (210239) at -80,-190,-425,140 and despawn myself

my $temptoadcheck;
my $drornokcheck;

sub EVENT_SIGNAL {  # Signal from the a_tempest_toad death
  $temptoadcheck = $entity_list->GetMobByNpcTypeID(210047); # Are there any frogs left ?
  $drornokcheck = $entity_list->GetMobByNpcTypeID(210239); # Just incase
  if(!$temptoadcheck && !$drornokcheck) {
    quest::spawn2(210239,0,0,-80,-190,-644,280); # Drornok_Tok_Vo`Lok
    quest::depop_withtimer(); #This is the trigger and does need  to repop
  }
}

#Event by Chance - If you break it, you fix it!
