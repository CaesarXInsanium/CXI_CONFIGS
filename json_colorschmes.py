# TODO: proper argument parsing
# TODO: separate option for xfce-terminal alacritty, base16lua etc
# TODO:
import json
from sys import argv

JSON_SCHEME = """{
  "name": "",
  "author": "",
  "color": [
    "#031428",
    "#2287c3",
    "#2596d5",
    "#459ede",
    "#51ade0",
    "#76b5e6",
    "#90cfeb",
    "#cfe2ea",
    "#909ea3",
    "#2287c3",
    "#2596d5",
    "#459ede",
    "#51ade0",
    "#76b5e6",
    "#90cfeb",
    "#cfe2ea"
  ],
  "foreground": "#cfe2ea",
  "background": "#031428"
}"""


def json_to_dict(json_string):
    json_dict = json.loads(json_string)
    colors = json_dict["color"]
    result_dict = COLORS_DICT_TEMPLATE
    result_dict[0] = colors[0][1:]
    result_dict[1] = colors[1][1:]
    result_dict[2] = colors[2][1:]
    result_dict[3] = colors[3][1:]
    result_dict[4] = colors[4][1:]
    result_dict[5] = colors[5][1:]
    result_dict[6] = colors[6][1:]
    result_dict[7] = colors[7][1:]
    result_dict[8] = colors[8][1:]
    result_dict[9] = colors[9][1:]
    result_dict[10] = colors[10][1:]
    result_dict[11] = colors[11][1:]
    result_dict[12] = colors[12][1:]
    result_dict[13] = colors[13][1:]
    result_dict[14] = colors[14][1:]
    result_dict[15] = colors[15][1:]
    result_dict[-2] = json_dict["background"][1:]
    result_dict[-1] = json_dict["foreground"][1:]
    return result_dict


COLORS_DICT_TEMPLATE = {
        -2: "",
        -1: "",
        0: "031428",
        1: "2287c3",
        2: "2596d5",
        3: "459ede",
        4: "51ade0",
        5: "76b5e6",
        6: "90cfeb",
        7: "cfe2ea",
        8: "909ea3",
        9: "2287c3",
        10: "2596d5",
        11: "459ede",
        12: "51ade0",
        13: "76b5e6",
        14: "90cfeb",
        15: "cfe2ea",
}


def dracula_nvim(name, c_dict):

    txt = f"""
    bg = "#{c_dict[-2]}",
    fg = "#{c_dict[-1]}",
    selection = "#44475A",
    comment = "#6272A4",
    red = "#{c_dict[1]}",
    orange = "#FFB86C",
    yellow = "#{c_dict[3]}",
    green = "#{c_dict[2]}",
    purple = "#{c_dict[5]}",
    cyan = "#{c_dict[6]}",
    pink = "#{c_dict[13]}",
    bright_red = "#{c_dict[9]}",
    bright_green = "#{c_dict[10]}",
    bright_yellow = "#{c_dict[11]}",
    bright_blue = "#{c_dict[12]}",
    bright_magenta = "#{c_dict[13]}",
    bright_cyan = "#{c_dict[14]}",
    bright_white = "#{c_dict[15]}",
    menu = "#21222C",
    visual = "#3E4452",
    gutter_fg = "#4B5263",
    nontext = "#3B4048",
    """
    return txt

def xfce4_term_theme_string(name, c_dict):
    line1 = r"[Scheme]"
    line2 = f"Name={name}\n"
    line3 = f"ColorForeground=#{c_dict[-1]}"
    line4 = f"ColorBackground=#{c_dict[-2]}"
    line5 = f"ColorCursor=#{c_dict[15]}"
    line6 = f"TabActivityColor=#{c_dict[3]}"
    line7 = f"ColorPalette=#{c_dict[0]};#{c_dict[1]};#{c_dict[2]};#{c_dict[3]};#{c_dict[4]};#{c_dict[5]};#{c_dict[6]};#{c_dict[7]};#{c_dict[8]};#{c_dict[9]};#{c_dict[10]};#{c_dict[11]};#{c_dict[12]};#{c_dict[13]};#{c_dict[14]};#{c_dict[15]}"
    line8 = f"ColorBold=#{c_dict[1]}"
    line9 = f"ColorBoldUseDefault=FALSE"
    return "\n".join([line1,line2,line3,line4,line5,line6,line7,line8,line9,])

def test():
    s = xfce4_term_theme_string("test_colors", COLORS_DICT_TEMPLATE)
    print(s)
    d = json_to_dict(JSON_SCHEME)
    print()
    f = xfce4_term_theme_string("name", d)
    print(f)

def kitty(name, c_dict):
    string = f"""
# Kitty Colorscheme {name}
background   #{c_dict[-2]}
foreground   #{c_dict[-1]}
color0       #{c_dict[0]}
color1       #{c_dict[1]}
color2       #{c_dict[2]}
color3       #{c_dict[3]}
color4       #{c_dict[4]}
color5       #{c_dict[5]}
color6       #{c_dict[6]}
color7       #{c_dict[7]}

colorg8      #{c_dict[8]}
colorg9      #{c_dict[9]}
colorg10     #{c_dict[10]}
colorg11     #{c_dict[11]}
colorg12     #{c_dict[12]}
colorg13     #{c_dict[13]}
colorg14     #{c_dict[14]}
colorg15     #{c_dict[15]}
    """
    return string
def base16lua(name, c_dict):
    strings = [
        "base00 = '#{}', base01 = '#{}',".format(c_dict[0], c_dict[1]),
        "base02 = '#{}', base03 = '#{}',".format(c_dict[2], c_dict[3]),
        "base04 = '#{}', base05 = '#{}',".format(c_dict[4], c_dict[5]),
        "base06 = '#{}', base07 = '#{}',".format(c_dict[6], c_dict[7]),
        "base08 = '#{}', base09 = '#{}',".format(c_dict[8], c_dict[9]),
        "base0A = '#{}', base0B = '#{}',".format(c_dict[10], c_dict[11]),
        "base0C = '#{}', base0D = '#{}',".format(c_dict[12], c_dict[13]),
        "base0E = '#{}', base0F = '#{}',".format(c_dict[14], c_dict[15])
            ]
    return "\n".join(strings)
if __name__ =="__main__":
    print(argv)
    if len(argv) > 2:
        print("Two many arguments")
        exit(2)
    elif len(argv) == 1:
        print("No Arguments")
        exit(1)
    else:
        fd = open(argv[1], "r")
        red = fd.read()
        d = json_to_dict(red)
        print(xfce4_term_theme_string(argv[1], d))
        print()
        print(base16lua(argv[1], d))
        print(kitty(argv[1], d))
        print()
        print(dracula_nvim(argv[1], d))
