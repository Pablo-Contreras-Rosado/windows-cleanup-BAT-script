# windows-cleanup-BAT-script
This BAT script deletes a series of folders in Windows (along with their files) that store cache and other temporary files in order to save disk space.

It is recommended to run it with Administrator priviledges because some files cannot be deleted without them.

The script has a list of paths it will delete, it is made like that so you can add any path you want just by putting it inside the list, the order doesn't matter.
You must put the path between double quotes and with a Circumflex at the end. Example: "NewPath"^

Below the list of paths you will also see a cd command to the Firefox directory followed by a series of delete commands.
Firefox profile folders (where cache is stored) are named like "<random_characters>.default" and "<random_characters>.default-release",
in order to delete them, we have to do some workarounds, we can not just add the paths to the list.

How to execute it?
Just double click (or right click and Execute as Admin), it will prompt you that it will delete files. Press Enter to accept, and wait until its finished.
Any files it cannot delete because it hasn't got the rights or because its in use will remain there, it will not prompt to let you know.

Please double check that you haven't stored any important file on the script paths, it's highly unlikely, but check just in case.

Any recommendations, such as improvements or new paths to delete, are greatly appreciated, just bear in mind that this script is designed to be as unattended as possible.
