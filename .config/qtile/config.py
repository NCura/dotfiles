import os
import subprocess
from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Match, Screen, Rule, ScratchPad, DropDown, Key
from libqtile.lazy import lazy

# --------------------------------------------------------
# General Setup
# --------------------------------------------------------

mod = "mod4"
wmname = "LG3D"
terminal = "kitty"
#keys = [Key([mod], "o", lazy.spawn(terminal), desc="Launch terminal")]
keys = []
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
floats_kept_above = True
auto_minimize = True # If things like steam games want to auto-minimize themselves when losing focus, should we respect this or not?

# --------------------------------------------------------
# Groups
# --------------------------------------------------------

groups = [
    Group("1", layout='monadtall'),
    Group("2", layout='monadtall'),
    Group("3", layout='columns'),
    Group("4", layout='monadtall'),
    Group("5", layout='monadtall'),
    Group("6", layout='monadtall'),
    Group("7", layout='monadtall'),
    Group("8", layout='monadtall'),
    Group("9", layout='monadtall'),
]

dgroups_key_binder = None

# --------------------------------------------------------
# Scratchpads
# --------------------------------------------------------

groups.append(ScratchPad("0", [
    DropDown("chatgpt", "chromium --app=https://chat.openai.com", x=0.71, y=0, width=0.29, height=1, on_focus_lost_hide=False, opacity=1),
    DropDown("terminal", "kitty", x=0.3, y=0.1, width=0.40, height=0.4, on_focus_lost_hide=False, opacity=1),
    DropDown("ranger", "kitty -e 'ranger'", x=0.3, y=0.1, width=0.50, height=0.6, on_focus_lost_hide=False, opacity=1),
]))

# --------------------------------------------------------
# Setup Layout Theme
# --------------------------------------------------------

layout_theme = { 
    "border_width": 3,
    "margin": 5,
    "border_focus": "deb887",
    "border_normal": "FFFFFF",
    "single_border_width": 1
}

# --------------------------------------------------------
# Layouts
# --------------------------------------------------------

layouts = [
    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.Max(),
    layout.Stack(num_stacks=2),
    layout.Bsp(),
    layout.Matrix(),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Tile(),
    layout.TreeTab(),
    layout.VerticalTile(),
    layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=1,
)
extension_defaults = widget_defaults.copy()

# --------------------------------------------------------
# Widgets
# --------------------------------------------------------

widget_list = [
    widget.CurrentLayout(),
    widget.GroupBox(),
    #widget.Prompt(),
    #widget.WindowName(),
    #widget.Chord(
    #    chords_colors={
    #        "launch": ("#ff0000", "#ffffff"),
    #    },
    #    name_transform=lambda name: name.upper(),
    #),
    widget.Spacer(),
    widget.Systray(),
    widget.Clock(format="%Y-%m-%d %a %I:%M %p")
]

# --------------------------------------------------------
# Screens
# --------------------------------------------------------

screens = [
    Screen(
        top=bar.Bar(
            widget_list,
            30,
            padding=20,
            opacity=0.7,
            border_width=[0, 0, 0, 0],
            margin=[0,0,0,0],
            background="#000000.3"
        ),
    ),
]

# --------------------------------------------------------
# Drag floating layouts
# --------------------------------------------------------

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# --------------------------------------------------------
# Define floating layouts
# --------------------------------------------------------

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

# --------------------------------------------------------
# Hooks
# --------------------------------------------------------

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# @hook.subscribe.current_screen_change
# def toggle_bar(scrren):
#     if screen.group.name == "1":
#         screen.top.show()
#     else:
#         screen.top.hide()
