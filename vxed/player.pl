sub EVENT_COMBINE_SUCCESS {
  my $x = $client->GetX();
  my $y = $client->GetY();
  my $z = $client->GetZ();
  my $h = $client->GetHeading();

  if ($recipe_id == 10344) {
    $client->Message(1,"With the final piece in place, the clockwork scout's eyes light up as it comes to life.");
    quest::spawn2(290059,0,0,$x,$y,$z,$h); #Clockwork Scout Model XIII
  }
}