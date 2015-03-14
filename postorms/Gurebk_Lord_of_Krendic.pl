#Check if any a jotna fannsk,a jotna her megir,Solnebk the Unruly,Pendubk the Turbulent
#This includes BOTH desert camps!
#If none alive depop and spawn real named

my $x;
my $y;
my $z;
my $h;
my $trash1check;
my $trash2check;
my $trash3check;
my $name1check;
my $name2check;

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $h = $npc->GetHeading();
}

sub EVENT_SIGNAL { # Signal from the death of any appropriate named or trash
  $trash1check = $entity_list->GetMobByNpcTypeID(210030); # a jotna fannsk
  $trash2check = $entity_list->GetMobByNpcTypeID(210035); # a jotna fannsk
  $trash3check = $entity_list->GetMobByNpcTypeID(210022); # a jotna her megir
  $name1check = $entity_list->GetMobByNpcTypeID(210033); # Solnebk the Unruly
  $name2check = $entity_list->GetMobByNpcTypeID(210032); # Pendubk the Turbulent

  if(!$trash1check && !$trash2check && !$trash3check && !$name1check && !$name2check) {
    quest::spawn2(210230,0,0,$x,$y,$z,$h); #Gurebk_Lord_of_Krendic
    quest::depop_withtimer(); # Will need to repop
  }
}

# End of File  Zone: PoStorms ID: 210178 -- Gurebk_Lord_of_Krendic