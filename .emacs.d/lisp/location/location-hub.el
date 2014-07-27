(require 'network-library)

;; Set the location data.
(setq calendar-latitude (network-library--get-geoip-property-for-external-ip :latitude))
(setq calendar-longitude (network-library--get-geoip-property-for-external-ip :longitude))
(setq calendar-location-name (format "%s, %s" (network-library--get-geoip-property-for-external-ip :city) (network-library--get-geoip-property-for-external-ip :region_name)))

(provide 'location-hub)
