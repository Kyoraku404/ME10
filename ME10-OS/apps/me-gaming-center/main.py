#!/usr/bin/env python3
from PyQt6.QtWidgets import QApplication, QWidget, QVBoxLayout, QLabel, QPushButton
from PyQt6.QtCore import Qt
import subprocess

class App(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("ME Gaming Center")
        self.resize(960, 640)
        self.setStyleSheet("background:#0e1016;color:#e8ecf8;font-family:Inter;")
        l=QVBoxLayout(self)
        h=QLabel("ME Gaming Center - ME.10 Pro")
        h.setAlignment(Qt.AlignmentFlag.AlignCenter)
        h.setStyleSheet("font-size:28px;font-weight:700;padding:20px;")
        l.addWidget(h)
        for b in [("Launch Steam","steam"),("Launch Lutris","lutris"),("Enable GameMode","gamemoded -t") ]:
            btn=QPushButton(b[0])
            btn.clicked.connect(lambda _,cmd=b[1]: subprocess.Popen(cmd,shell=True))
            l.addWidget(btn)

app=QApplication([])
w=App();w.show();app.exec()
