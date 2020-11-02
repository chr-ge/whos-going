const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  future: {
    // removeDeprecatedGapUtilities: true,
    // purgeLayersByDefault: true,
  },
  purge: [],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          'Noto Sans', 
          ...defaultTheme.fontFamily.sans
        ],
      },
    },
  },
  variants: {
    borderWidth: ['responsive', 'last', 'hover', 'focus'],
    backgroundColor: ['responsive', 'hover', 'focus', 'focus-within'],
  },
  plugins: [],
}
