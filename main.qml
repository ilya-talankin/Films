// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Dialogs
import QtQuick.Layouts
import ImageModelList

Window {
    title: "Color aproximator"
    width: 800
    height: 480
    visible: true
    id: mainWindow

    ColumnLayout {
        spacing: 20
        anchors.fill: parent
        id: mainColumn
        Text {
            padding: 10
            font.pointSize: 15
            Layout.fillWidth: true
            wrapMode: Text.Wrap
            text: "Для определения концентрации неизвестного образца, загрузите фотографии эталлоных образцов, сделанные при том же освещении"
        }

        Action {
            id: openAction
            text: "&Открыть изображение"
            shortcut: "Ctrl+O"
            onTriggered: {
                fileDialog.open()
            }
        }

        Button {
            Layout.fillWidth: true
            text: "Добавить эталонное изображение"
            action: openAction
        }

        ListView {
            id: lv
            Layout.margins: lvBackground.border.width
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 500
            Rectangle {
                id: lvBackground
                anchors.fill: lv
                anchors.margins: -border.width
                border.color: "black"
                border.width: 3
                z: -1
            }

            model: ImageModelList {}
            orientation: ListView.Horizontal
            delegate: ImageRectangle {
                id: image_area
                width: 300
                height: lv.height
                border.color: "black"
            }

            FileDialog {
                id: fileDialog
                title: "Выберите изображение"
                nameFilters: ["Images (*.png *.xpm *.jpg *.bmp)"]
                onAccepted: {
                    console.log("Выбрано изображение: " + fileDialog.currentFile)
                    lv.model.append(fileDialog.currentFile)
                }
            }


        }
    }
}
