import XMonad
import XMonad.Config.Gnome

-- Declare config preferences
config_terminal = "terminator"      -- Default terminal to run
-- config_focusFollowsMouse :: Bool    -- Have focus not follow mouse
-- config_focusFollowsMouse = False

myManageHook = composeAll
    [ resource  =? "Do"        --> doIgnore
    , className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]

-- Run xmonad with the specified conifguration
main = xmonad myConfig

-- Use the gnomeConfig, but change a couple things
myConfig = gnomeConfig {
    terminal = config_terminal,
--    focusFollowsMouse = config_focusFollowsMouse,
    manageHook = manageHook gnomeConfig <+> myManageHook
}
