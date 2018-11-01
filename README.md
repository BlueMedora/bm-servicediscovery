# Blue Medora On Premise Service Discovery

An on-premise service discovery framework.

* nmap-discovery-docker/ : Customize namp docker container to perform actual probes
* web/ : An Open Cloud Shell web framework for providing results
  * GoTTY : Provide a web based console that user can interact with.  Put in tmux job so session is persistent if web is lost
  * goexpose-config/:  The goexpose configuration  for sending specific commands to tmux session agove
