# elm-pages-transition

Exploring page transition animations in [elm-pages](https://github.com/dillonkearns/elm-pages/).
See the [github discussion](https://github.com/dillonkearns/elm-pages/issues/225) for details.

The fade-in transition works well. Fade-out is more complicated because we need to hook into some
elm-pages internals to catch and delay the navigation (See the todo comment in src/Shared.elm).

# Usage

```sh
npm install
npx elm-pages dev
```
