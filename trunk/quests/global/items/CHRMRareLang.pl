sub EVENT_SCALE_CALC {
  # Used for charms that scale with number of rare languages learned
  my $langmastered = 0;
 
  #check each rare language: Old Erudian through Elder Dragon
  for (my $i = 11; $i <= 22; $i++) {
    if($client->GetLanguageSkill($i) == 100) {
      $langmastered++;
    }
  }
  $questitem->SetScale($langmastered/12);
}