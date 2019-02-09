Geocoder.configure(
  # Geocoding options
  timeout: 5,                 # geocoding service timeout (secs)
  lookup: :nominatim,         # name of geocoding service (symbol)
  language: :en,              # ISO-639 language code
  use_https: false,           # use HTTPS for lookup requests? (if supported)

  # Calculation options
  units: :mi,                 # :km for kilometers or :mi for miles
  distances: :linear          # :spherical or :linear
)
