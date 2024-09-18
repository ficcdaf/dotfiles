import time
import map2
import itertools

with open("./script.log", "a") as f:
    f.write(f"Script started at {time.ctime()}\n")


def test():
    print("test")


layout = [
    # top row
    ("e", "f"),
    ("r", "p"),
    ("t", "b"),
    ("y", "j"),
    ("u", "l"),
    ("i", "u"),
    ("o", "y"),
    ("p", ";"),
    ("P", ":"),
    # home row
    ("s", "r"),
    ("d", "s"),
    ("f", "t"),
    ("h", "m"),
    ("j", "n"),
    ("k", "e"),
    ("l", "i"),
    (";", "o"),
    (":", "O"),
    # bottom row
    ("z", "x"),
    ("x", "c"),
    ("c", "d"),
    ("b", "z"),
    ("n", "k"),
    ("m", "h"),
]


# Define all modifier combinations to consider
modifiers = ["^", "!", "+", "#", ""]

# # Helper function to remap all combinations of a given key
# def remap_with_modifiers(mapper, original, mapped):
#     for modifier_combination in itertools.product(modifiers, repeat=2):
#         mods = "+".join([mod for mod in modifier_combination if mod])  # filter empty modifiers
#         if mods:
#             # Remap key with current combination of modifiers
#             mapper.map_key(f"{mods}{original}", f"{mods}{mapped}")
#         else:
#             # Remap without any modifiers
#             mapper.map_key(original, mapped)


# Helper function to remap all combinations of a given key
def remap_with_modifiers(mapper, original, mapped):
    for r in range(0, len(modifiers) + 1):  # From 0 modifiers up to 4 modifiers
        for combination in itertools.combinations(modifiers, r):
            mods = "".join(combination)  # Join modifiers without duplicates
            if mods:
                # Remap key with current combination of modifiers
                mapper.map_key(f"{mods}{original}", f"{mods}{mapped}")
            else:
                # Remap without any modifiers
                mapper.map_key(original, mapped)


# readers intercept all keyboard inputs and forward them
reader = map2.Reader(patterns=["/dev/input/by-path/platform-i8042-serio-0-event-kbd"])

# mappers change inputs, you can also chain multiple mappers!
mapper = map2.Mapper()

# writers create new virtual devices we can write into
writer = map2.Writer(clone_from="/dev/input/by-path/platform-i8042-serio-0-event-kbd")

# finally, link nodes to control the event flow
map2.link([reader, mapper, writer])

# Apply the remapping for all combinations of modifiers
for t in layout:
    if ":" not in t and ";" not in t:
        remap_with_modifiers(mapper, t[0], t[1])
        remap_with_modifiers(mapper, t[0].upper(), t[1].upper())
    else:
        remap_with_modifiers(mapper, t[0], t[1])

mapper.map_key("capslock", "backspace")

map2.wait()
