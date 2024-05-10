/****************************************************************************
** Generated QML type registration code
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <QtQml/qqml.h>
#include <QtQml/qqmlmoduleregistration.h>

#include </home/ilya/Downloads/editingmodel/model.py>


#if !defined(QT_STATIC)
#define Q_QMLTYPE_EXPORT Q_DECL_EXPORT
#else
#define Q_QMLTYPE_EXPORT
#endif
Q_QMLTYPE_EXPORT void qml_register_types_BaseModel()
{
    qmlRegisterTypesAndRevisions<ImageModelList>("BaseModel", 1);
    QMetaType::fromType<QAbstractItemModel *>().id();
    QMetaType::fromType<QAbstractListModel *>().id();
    QMetaType::fromType<QObject *>().id();
    qmlRegisterModule("BaseModel", 1, 0);
}

static const QQmlModuleRegistration baseModelRegistration("BaseModel", qml_register_types_BaseModel);
