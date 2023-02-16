sub EVENT_SAY {
  POPUP_DISPLAY();
  my $charKey = $client->CharacterID() . "-MAO-Progress";
  my $progress = quest::get_data($charKey);
  if ($text=~/hail/i) {     
      
  }
}

sub POPUP_DISPLAY {

  my $yellow = plugin::PWColor("Yellow");


  my $header = $yellow . plugin::PWAutoCenter("Welcome to Pyrelight!") . "</c>>br>" .
               plugin::PWAutoCenter("Discord: " . plugin::PWHyperLink("https://discord.com/invite/5cFCA7TVgA","5cFCA7TVgA"));
    
  quest::popup('', $header);
}