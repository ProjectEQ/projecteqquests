#Zone: Burningwood  NPC: Azdalin (87152)
#by: Qadar

sub EVENT_COMBAT {
  my $random_result = int(rand(60));
  if($combat_state == 1) {
    quest::say("Foolish adventurer!!  You shall die.  You are nothing to Azdalin. ");
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