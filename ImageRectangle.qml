import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

Rectangle {
    ColumnLayout {
        spacing: 0
        height: parent.height
        width: parent.width
        Rectangle {
            id: imageSection
            Layout.fillHeight: true
            width: parent.width
            border.color: "black"
            border.width: 1
            Image {
                source: model.path
                width: parent.width
                height: parent.height
            }

            Button {
                id: deleteButton
                onClicked: function() {
                    console.log("Deliting, ", index)
                    lv.model.remove(index)
                }
                anchors.top: parent.top
                anchors.right: parent.right
                opacity: deleteButton.hovered? 0.9: 0.5
                icon.source: "icons/close.png"
                height: 30
                width: height
                background: Rectangle {
                    color: deleteButton.hovered ? "red" : "white"
                }
            }
        }
        TextField {
            id: textField
            placeholderText: "Введите концентрацию"
            validator: DoubleValidator {
                bottom: 0.0
                notation: DoubleValidator.StandardNotation
            }
            height: 30
            focus: false
            Layout.fillWidth: true
            onEditingFinished: {
                model.concentration = textField.text
                console.log("Коцентрация:", textField.text);
                textField.clear();
                textField.focus = false;
            }
        }
        Text {
            padding: 3
            text: "Имя файла: " + model.display
            Layout.fillWidth: true
            wrapMode: Text.Wrap
        }
        Text {
            padding: 3
            text: "Концентрация:  <b>" + model.concentration + "<\b>"
            Layout.fillWidth: true
            wrapMode: Text.Wrap
        }
    }
}
