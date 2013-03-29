(defgroup android-picolisp nil
  "android-picolisp config"
  :prefix "android-picolisp")

(defcustom ap-adb-directory
  "/adb::/data/local"
  "adb tramp path"
  :type 'directory
  :group 'android-picolisp)

(defcustom ap-ssh-directory
  "/ssh:root@192.168.0.105:/"
  "ssh tramp path"
  :type 'directory
  :group 'android-picolisp)

;; TODO: add upload of picolisp to android

;; phone
(defun run-picolisp-adb ()
  (interactive)
  (let ((default-directory ap-adb-directory))
    (run-picolisp "/data/local/tmp/pil")))

;; olinuxino
(defun run-picolisp-ssh ()
  (interactive)
  (let ((default-directory ap-ssh-directory))
    (run-picolisp "pil +")))

(provide 'android-picolisp)
