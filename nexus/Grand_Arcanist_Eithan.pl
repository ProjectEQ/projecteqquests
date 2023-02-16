sub EVENT_SAY {
  POPUP_DISPLAY();
  my $charKey = $client->CharacterID() . "-MAO-Progress";
  my $progress = quest::get_data($charKey);
  if ($text=~/hail/i) {     
      
  }
}

sub POPUP_DISPLAY {

  my $yellow = plugin::PWColor("Yellow");

  my $discord = "Server Discord: " . plugin::PWHyperLink("https://discord.com/invite/5cFCA7TVgA","5cFCA7TVgA") . "<br>";
  my $header = $yellow . plugin::PWAutoCenter("Welcome to Pyrelight!") . "</c><br><br>";

  my $desc = "Pyrelight is a solo-balanced server, meant to offer a challenging experience for veteran players and an alternative take on the 'solo progression' mold.";


  my $text = $header .
             $discord .
             $desc;  
  quest::popup('', $text);
}