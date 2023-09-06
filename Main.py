import sys
import random
import platform
import re
import os
import os.path
from pathlib import Path
from datetime import datetime
import logging
from PySide6 import QtCore, QtWidgets, QtGui

# Set up the logging directory
LOGS_DIR = Path("./Logs")
LOGFILE_PATH = Path(f"{LOGS_DIR}/logfile.log")
if not LOGS_DIR.exists():
	os.mkdir('./Logs')
	pass
logging.basicConfig(filename=LOGFILE_PATH, encoding='utf-8', level=logging.INFO)
logging.info("==================================================")
logging.info(f"======== Logging start {datetime.now()}")

# Find platform, linux only
try:
	PLATFORM=platform.freedesktop_os_release()
	PLATFORM_NAME=platform.platform()
except:
	PLATFORM_NAME=platform.platform()
	if bool(re.search('Windows', PLATFORM_NAME)):
		logging.critical("Script running under Windows, not compatible")
		os._exit(os.EX_OK)



# Declare main window
class MainWindow(QtWidgets.QWidget):
	def __init__(self):
		super().__init__()

# Run the app
if __name__ == "__main__":
	app = QtWidgets.QApplication([])

	window = MainWindow()
	window.resize(800, 600)
	window.show()

	sys.exit(app.exec())