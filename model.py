# Copyright (C) 2022 The Qt Company Ltd.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause


from PySide6.QtCore import QAbstractListModel, QByteArray, QModelIndex, Qt, Slot
from PySide6.QtQml import QmlElement
import os

# To be used on the @QmlElement decorator
# (QML_IMPORT_MINOR_VERSION is optional)

QML_IMPORT_NAME = "ImageModelList"
QML_IMPORT_MAJOR_VERSION = 1

@QmlElement
class ImageModelList(QAbstractListModel):
    ConcentrationRole = Qt.UserRole + 1
    PathRole = ConcentrationRole + 1

    def __init__(self, parent=None):
        super().__init__(parent=parent)
        self.db = [
            {"path": "file:///home/ilya/qt_projects/cerium/images/2024-02-27-101748.jpg", "concentration": None}
        ]

    def rowCount(self, parent=QModelIndex()):
        return len(self.db)

    def roleNames(self):
        default = super().roleNames()
        default[self.ConcentrationRole] = QByteArray(b"concentration")
        default[self.PathRole] = QByteArray(b"path")
        return default

    def data(self, index, role: int):
        if not self.db:
            ret = None
        elif not index.isValid():
            ret = None
        elif role == Qt.DisplayRole:
            ret = os.path.basename(self.db[index.row()]["path"])
        elif role == self.PathRole:
            ret = self.db[index.row()]["path"]
        elif role == self.ConcentrationRole:
            ret = self.db[index.row()]["concentration"]
        else:
            ret = None
        return ret

    def setData(self, index, value, role):
        if not index.isValid():
            return False
        if role == Qt.EditRole:
            self.db[index.row()]["path"] = value
        elif role == self.ConcentrationRole:
            self.db[index.row()]["concentration"] = value
            self.dataChanged.emit(index, index)
        return True

    @Slot(str, result=bool)
    def append(self, path: str):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.db.append({"path": path, "concentration": None})
        self.endInsertRows()
        return True

    @Slot(int, result=bool)
    def remove(self, row: int):
        self.beginRemoveRows(QModelIndex(), row, row)
        self.db = self.db[:row] + self.db[row + 1:]
        self.endRemoveRows()
        return True



