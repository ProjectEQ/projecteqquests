 sub EVENT_SAY {
  my $charKey = $client->CharacterID() . "-MAO-Progress";
  my $progress = quest::get_data($charKey);
  if ($text=~/hail/i) {
    POPUP_DISPLAY();
  }
 }

sub POPUP_DISPLAY {

  my $yellow = plugin::PWColor("Yellow");
  my $green = plugin::PWColor("Green"); 

  my $discord = "Server Discord: " . plugin::PWHyperLink("https://discord.com/invite/5cFCA7TVgA","5cFCA7TVgA") . "<br><br>";
  my $header = $yellow . plugin::PWAutoCenter("Welcome to Pyrelight!") . "</c><br><br>";

  my $desc = "Pyrelight is a solo-balanced server, meant to offer a challenging experience for veteran players and an alternative take on the 'solo progression' mold.<br><br>
              For more information, please join the server discord and read the " . $green . "#server-info</c> channel.";

  my $text = $header .
             $discord .
             $desc;  
  quest::popup('', $text);
}