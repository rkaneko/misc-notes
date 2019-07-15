# How to create a note

For full documentation visit [mkdocs.org](http://mkdocs.org).

## Theme

This document's theme is [squidfunk/mkdocs-material](mkdocs-material/customization://github.com/squidfunk/mkdocs-material).

To customize, see also [mkdocs-material/customization/](http://squidfunk.github.io/mkdocs-material/customization/).

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

## Code highlight

```js
function blah(foo) {
  console.log(`foo: ${foo}`);
}
```

```javascript hl_lines="6 7 8"
const Blah = props => (
  <div>
    Hello world!
  </div>
);
```

## Math

!!! Warning
    This function is not markdown standard, so you should follow the usage and dosage instructions.

Using [MathJax](https://www.mathjax.org/)

$$
P\cdot Q = \|P\|\|Q\|\cos\alpha
$$

## Emoji

See [EMOJI CHEAT SHEET](https://www.webpagefx.com/tools/emoji-cheat-sheet/)

- Release :tada: :tada:

## Icons

Using [Font Awesome](http://fontawesome.io/icons/)'s icons

- bug :fa-bug:

## Admonition

!!! Warning
    This function is not markdown standard, so you should follow the usage and dosage instructions.
