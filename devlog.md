19.51  Nov.8
switched to loading levels into the main scene "game".
menu is now also inside "game" with player
made level selection work :DDD
learned how to get nodes of a node cause apperently i didnt know how to do it until now
known issue: crosshair is showing up in menu - to lazy and tired to fix. imma do it tomorrow
note: just now realized that ive been doing git wrong the whole time. apperent i shouldve commit first then push ._.

What happened over the week??
- literally had close to no freetime cause shool was a bit harsh lately.

11.40  Nov.14
finally after a week fixed crosshair in menu
main node now loads levels
moved debug levels to hidden menu 
switched to loading lia path again cause... idk why actually lol i forgor
*theres allways an alternative option to loading levels*
known issue: NO LEVELS YET! imma make levels. in the mean time dont go into levels cause theres no going back... literally
note: i havent eaten anything but yoghurt yet so im very hungry
also *via , not lia

14.43  Nov.14
added a pause menu and a first level :] called it tutorial1 but its just wip at the moment
changed the crosshair colors for speedy and bouncy
known issue: pause menu doesnt pause shi-
note: thinking for a proper name for my game but im not sure. another release comming today on gh prolly

18.51  Nov.16
made pause menu actually work :D finally. it was as easy as 'get_tree().paused = true' so im kinda ebarrassed that it took a whole day and a half
switched from checking 'player.is_playing' to the way simpler and more reliable(hopefully) 'get_tree.paused'
switched the control nodes in Menu to CanvasLayers: had to debug literally every script cause of extends's afterwards
exit button wasnt working in main menu on my linux so added a print statement to debug. apperently that made it work again: keeping it in for random reasons lol
note: started making silly-notes. also aannother release comming later today... maybe, if i got time. if not dev.has_time: dev.do(tomorrow) lol thats some real programming-language
silly-note: why am i putting _ in front of ui group-names?? i have no idea but i like it :]

~  Nov.17
literally only added the current release into the repo

  Nov.18
put main menu into its own control node for organizational purpaces: had to redo most the imports once again...
made the menu node render a generic back button instead of having every single main-menu menu have its own back button. why? idk, why not i guess lol
^ nvm, reverted that cause it caused to much trouble with double-connecting or something. made cube keep velocity after freeze tho.
note: ill maybe not commit daily cause ill focus on making levels over the week.
silly-note: vocaloid songs r rlly good actually! you guys gotta listen to those if you dont already.
