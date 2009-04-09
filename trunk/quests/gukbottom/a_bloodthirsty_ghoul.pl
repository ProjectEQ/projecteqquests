sub EVENT_AGGRO {
my $Phrase1 = "Your faithless devotion to a false god leaves me no choice.";
my $Phrase2 = "I shall rid the land of another infamous villain.";
my $Phrase3 = "Your foul deeds have earned my contempt.";
my $Phrase4 = "${class}s like you are better left dead than alive.";
my $Phrase5 = "It's ${race}s like you who have ruined your own lands, You'll not ruin mine!";
my $Phrase6 = "Heathen! Unbeliever! Norrath must be cleansed!";
my $Phrase7 = "Your beliefs are an insult to us all!";
my $Phrase8 = "Your actions and history are a personal affront to all I stand for.";
my $Phrase9 = "Your intolerable reputation insults all in this realm.";
my $Phrase10 = "It's time for you to take your blasphemy into the next realm.";
my $Phrase11 = "${race}s like you are better left dead than alive.";
my $Phrase = quest::ChooseRandom($Phrase1,$Phrase2,$Phrase3,$Phrase4,$Phrase5,$Phrase6,$Phrase7,$Phrase8,$Phrase9,$Phrase10,$Phrase11);
 quest::say("Rrrrrrrrooooaaakkk!");
my $Chance = quest::ChooseRandom(1,2,3,4);
 if ($Chance == '1') {
  quest::say("$Phrase");
 }
}

#Submitted by: Jim Mills