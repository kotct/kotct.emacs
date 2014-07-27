(require 'json)

(defun network-library--get-external-ip ()
  (let* ((curly-output (shell-command-to-string "wget -qO- http://ipecho.net/plain &"))
         (retval nil))
    (setq retval curly-output)
    retval))

(defun network-library--get-geoip-data-for-ip (ip)
  (let* ((curly-output (shell-command-to-string (format "wget -qO- http://freegeoip.net/json/%s &" ip)))
         (retval nil))
    (setq retval curly-output)
    retval))

(defun network-library--get-geoip-property-for-ip (ip property)
  (condition-case nil
      (let ((json-object-type 'plist))
        (let ((geoip-data-plist (json-read-from-string (network-library--get-geoip-data-for-ip ip))))
          (plist-get geoip-data-plist property)))
    (error nil)))

(defun network-library--get-geoip-property-for-external-ip (property)
  (network-library--get-geoip-property-for-ip (network-library--get-external-ip) property))

(provide 'network-library)
