#check if any Hleytis Maor,Hleyta Menn, or Named are up
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
  $trash1check = $entity_list->GetMobByNpcTypeID(210056); # a_hleytis_maor
  $trash2check = $entity_list->GetMobByNpcTypeID(210057); # a_hleyta_menn
  $trash3check = $entity_list->GetMobByNpcTypeID(210058); # a_hleyta_menn
  $name1check = $entity_list->GetMobByNpcTypeID(210028);  # Paruek_the_Strong
  $name2check = $entity_list->GetMobByNpcTypeID(210029);  # Faruek_the_Bold
  if(!$trash1check && !$trash2check && !$trash3check && !$name1check && !$name2check) {
    quest::spawn2(210231,0,0,$x,$y,$z,$h); #Jeplak_Lord_of_Srerendi
    $npc->Depop(1);
  }
}
# End of File  Zone: PoStorms ID: 210179 -- Jeplak_Lord_of_Srerendi