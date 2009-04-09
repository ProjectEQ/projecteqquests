#Zone: Burningwood  NPC: Gylton (87070)
#by: Qadar

sub EVENT_COMBAT {
  my $random_result = int(rand(60));
  if($combat_state == 1) {
    quest::say("You will perish!!  You are weak and should have kept to your own realm!!");
    if($random_result <=20) {
      quest::say("${class}s like you always bring out the worst in me!");
    }
    elsif($random_result <=40){
      quest::say("I really hate ${class}s like you!");
    }
    else{
      quest::say("${class}s like you are an affront to my senses!");
    }
  }
}

sub EVENT_DEATH {
  quest::emote("slams to the ground with a loud THUD!!  The ground around you still trembles.  'Now.. I shall never slay my blasphemous.. brother..  Xyl..'");
}
