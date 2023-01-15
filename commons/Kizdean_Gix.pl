#Kizdean_Gix.pl
#Part of Thex Mallet
# items: 18891, 18889

sub EVENT_SAY {
  if($text =~/hail/i) {
    quest::say("If you have business then out with it!! If not, then please be gone. I have little time to waste on chitchat!");
  }
  elsif ($faction > 5) {
    quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
  }
  elsif ($faction > 4) {
    quest::say("When you learn to serve the Dead, then I will find the time to speak of such things.");
  }
  elsif($text =~/utalk adarev otcin/i) {
    quest::say("You speak the words of the Dead. You must be the assistance Loveal was to send. You must work quickly! Inside Befallen are the three pieces to the [Thex Mallet] which are to be returned to Loveal. Find Hubard L'rodd. He was my assistant. Give him this note and he should have information.");
    quest::summonitem(18891); #A Tattered Cloth Note
  }
  elsif($text =~/messages for neriak/i) {
    quest::say("It's about time a courier reached these wastelands of humanity. I have urgent news for the Dead. Take this message at once. Let no one stop you. Be on the lookout for the Feir'Dal [Silent Watch]! They have learned of our quest.");
    quest::summonitem(18889); #Letter To Loveal Of The Dead
  }
  elsif($text =~/silent watch/i) {
    quest::say("The Koada'Dal have created an elite band of paladins, greater even than our own Teir'Dal Dragoons. They exist on the edge of righteousness. They will perform despicable acts in the name of their deity, barely skimming the edge of evil.");
  }
}