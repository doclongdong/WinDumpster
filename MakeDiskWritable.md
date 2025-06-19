Sometimes Windows will force a disk to be readonly for some reason after formatting
It can be caused by a hw problem but usually it is just due to windows fuckery and there 
is no reason the disk actually needs to be readonly.
This happens most often when the disk is formatted without "Quick format". 

DO NOT JUST BLINDLY RUN THIS
you need to replace the commands as needed


1. Start cmd as admin.

2. `diskpart`

3. `list volume`

4. Now select the volume you need with `sel volume X`

5. `attributes disk clear readonly`