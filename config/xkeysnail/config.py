import re
from xkeysnail.transform import *
define_modmap({
    Key.SPACE: Key.LEFT_SHIFT,
    Key.LEFT_SHIFT: Key.SPACE,
    Key.ESC: Key.CAPSLOCK,
    Key.CAPSLOCK: Key.ESC,
})
