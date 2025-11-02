# convert.yazi

## Requirements

- [yazi](https://github.com/sxyazi/yazi)
- [magick](https://archlinux.org/packages/extra/x86_64/imagemagick/)

## Installation

### Linux

```sh
git clone https://github.com/JohWQ/convert.yazi ~/.config/yazi/plugins/convert.yazi
```

or

```sh
ya pkg add JohWQ/convert
```

## Usage

Add this to your ~/.config/yazi/keymap.toml

```toml

[[mgr.prepend_keymap]]
on = ["n", "p"]
run = "plugin convert -- --extension='png'"
desc = "Convert to PNG"

[[mgr.prepend_keymap]]
on = ["n", "j"]
run = "plugin convert -- --extension='jpg'"
desc = "Convert to JPG"

[[mgr.prepend_keymap]]
on = ["n", "w"]
run = "plugin convert -- --extension='webp'"
desc = "Convert to WebP"

```
