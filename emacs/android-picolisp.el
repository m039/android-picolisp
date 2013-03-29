(defgroup android-picolisp nil
  "android-picolisp config"
  :prefix "android-picolisp")

(defcustom ap-adb-directory
  "/adb::/data/local/tmp"
  "adb tramp path"
  :type 'directory
  :group 'android-picolisp)

(defcustom ap-ssh-directory
  "/ssh:root@192.168.0.105:/"
  "ssh tramp path"
  :type 'directory
  :group 'android-picolisp)

(defun upload-picolisp-to-android()
  (interactive)
  (let ((name "adb-upload-picolisp")
        (native-picolisp-tar (expand-file-name "data/native-picolisp.tar"
                                               (file-name-directory (locate-library "android-picolisp")))))
    (when (file-exists-p native-picolisp-tar)
      (let ((buffer (get-buffer-create (format "*%s*" name))))
        (start-process name buffer "adb" "push" native-picolisp-tar "/data/local/tmp/np.tar")
        (start-process name buffer "adb" "shell"
                       "cd /data/local/tmp; rm -r pil lib-picolisp; tar xf np.tar; rm -r np.tar;")
        (message "Uploading picolisp - done.")))))

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
