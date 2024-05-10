import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
Rectangle {
    RowLayout {
        height: parent.height
        width: parent.width
        Rectangle {
            height: parent.height
            width: 0.8 * parent.width
            border.color: "black"
            border.width: 1
            Image {
                source: display
                width: parent.width
                height: parent.height
                // fillMode: Image.PreserveAspectFit
            }
            TextArea {
                text: "Path: " + model.display + "\nconcentration: " + model.concentration
                width: parent.width
                height: parent.height
                readOnly: true
                color: "black"
            }

            Button {
                id: deleteButton
                onClicked: function() {
                    console.log("Deliting, ", index)
                    lv.model.remove(index)
                }
                anchors.fill: parent
                opacity: deleteButton.hovered? 0.6: 0.0
                icon.source: "icons/close.png"
                icon.width: parent.width
                icon.height: parent.height
                background: Rectangle {
                    color: "white"
                }
            }
        }
        Rectangle {
            width: 0.2 * parent.width
            TextField {
                id: textField
                placeholderText: "Введите концентрацию"
                validator: DoubleValidator {
                    bottom: 0.0
                    notation: DoubleValidator.StandardNotation
                }
                height: 30
                focus: false
                onEditingFinished: {
                    model.concentration = textField.text
                    console.log("Коцентрация:", textField.text);
                    textField.clear();
                    textField.focus = false;
                }
            }
        }
    }
}
