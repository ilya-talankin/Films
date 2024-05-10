/****************************************************************************
** Generated QML type registration code
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <QtQml/qqml.h>
#include <QtQml/qqmlmoduleregistration.h>

#include </home/ilya/qt_projects/cerium/model.py>


#if !defined(QT_STATIC)
#define Q_QMLTYPE_EXPORT Q_DECL_EXPORT
#else
#define Q_QMLTYPE_EXPORT
#endif
Q_QMLTYPE_EXPORT void qml_register_types_ImageModelList()
{
    qmlRegisterTypesAndRevisions<ImageModelList>("ImageModelList", 1);
    QMetaType::fromType<QAbstractItemModel *>().id();
    QMetaType::fromType<QAbstractListModel *>().id();
    QMetaType::fromType<QObject *>().id();
    qmlRegisterModule("ImageModelList", 1, 0);
}

static const QQmlModuleRegistration imageModelListRegistration("ImageModelList", qml_register_types_ImageModelList);
