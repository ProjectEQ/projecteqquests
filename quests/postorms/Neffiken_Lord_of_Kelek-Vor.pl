#Check if any an_irmin_her_megir,an_irmin_fannsk, Zertuken_the_Unyielding or Laruken_the_Rigid are up
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
  $trash1check = $entity_list->GetMobByNpcTypeID(210015); # an_irmin_her_megir
  $trash2check = $entity_list->GetMobByNpcTypeID(210037); # an_irmin_fannsk
  $trash3check = $entity_list->GetMobByNpcTypeID(210038); # an_irmin_fannsk
  $name1check = $entity_list->GetMobByNpcTypeID(210026);  # Laruken_the_Rigid
  $name2check = $entity_list->GetMobByNpcTypeID(210027);  # Zertuken_the_Unyielding
  if(!$trash1check && !$trash2check && !$trash3check && !$name1check && !$name2check) {
    quest::spawn2(210229,0,0,$x,$y,$z,$h); #Neffiken_Lord_Kelek-Vor
    quest::depop_withtimer();
  }
}

# End of File  Zone: PoStorms ID: 210176 -- Neffiken_Lord_of_Kelek'Vor