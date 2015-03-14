sub EVENT_TASK_STAGE_COMPLETE {
  if($task_id == 141 && $activity_id == 4) {
    $client->Message(15,"You really didn't know those who you were forced to slay, did you? No matter, they needed to go anyway, and you just happened to be the object of their demise. You did a clean, thorough job and you should be proud of the work you did. Here's a bit of a reward for the nightmares you're bound to have from this. Try to sleep soundly.");
  }
}