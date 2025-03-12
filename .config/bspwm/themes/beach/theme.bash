# ------------------------------------------------------------------------------
# Copyright (C) 2020-2024 Aditya Shakya <adi1090x@gmail.com>
#
# Beach Theme
# ------------------------------------------------------------------------------

light_value='0.03'
dark_value='0.30'

# Wal
wal -qnte "$1" "$2"
source "$HOME/.cache/wal/colors.sh"
accent="$color13"

# Polybar
polybar_font='Iosevka Nerd Font:size=10;3'

# Rofi
rofi_font='Iosevka 10'
rofi_icon='Numix-Apps'

# Terminal
terminal_font_name='JetBrainsMono Nerd Font'
terminal_font_size='10'

# Geany
geany_colors='beach.conf'
geany_font='JetBrains Mono 10'

# Appearance
gtk_font='Noto Sans 9'
gtk_theme='Arc'
icon_theme='Arc-Circle'
cursor_theme='Future'

# Dunst
dunst_width='300'
dunst_height='80'
dunst_offset='20x58'
dunst_origin='bottom-right'
dunst_font='Iosevka Custom 9'
dunst_border='2'
dunst_separator='2'

# Picom
picom_backend='glx'
picom_corner='0'
picom_shadow_r='14'
picom_shadow_o='0.30'
picom_shadow_x='-12'
picom_shadow_y='-12'
picom_blur_method='none'
picom_blur_strength='0'

# Bspwm
bspwm_fbc="$accent"
bspwm_nbc="$background"
bspwm_abc="$color5"
bspwm_pfc="$color2"
bspwm_border='2'
bspwm_gap='20'
bspwm_sratio='0.50'
