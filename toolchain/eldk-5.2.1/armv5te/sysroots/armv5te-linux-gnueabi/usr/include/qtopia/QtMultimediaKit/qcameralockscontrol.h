/****************************************************************************
**
** Copyright (C) 2009 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the Qt Mobility Components.
**
** $QT_BEGIN_LICENSE:LGPL$
** No Commercial Usage
** This file contains pre-release code and may not be distributed.
** You may use this file in accordance with the terms and conditions
** contained in the Technology Preview License Agreement accompanying
** this package.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights.  These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** If you have questions regarding the use of this file, please contact
** Nokia at qt-info@nokia.com.
**
**
**
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QCAMERALOCKSCONTROL_H
#define QCAMERALOCKSCONTROL_H

#include <qmediacontrol.h>
#include <qmediaobject.h>

#include <qcamera.h>

QT_BEGIN_NAMESPACE

class Q_MULTIMEDIA_EXPORT QCameraLocksControl : public QMediaControl
{
    Q_OBJECT
public:
    ~QCameraLocksControl();
    
    virtual QCamera::LockTypes supportedLocks() const = 0;

    virtual QCamera::LockStatus lockStatus(QCamera::LockType lock) const = 0;

    virtual void searchAndLock(QCamera::LockTypes locks) = 0;
    virtual void unlock(QCamera::LockTypes locks) = 0;

Q_SIGNALS:
    void lockStatusChanged(QCamera::LockType type, QCamera::LockStatus status, QCamera::LockChangeReason reason);

protected:
    QCameraLocksControl(QObject* parent = 0);
};

#define QCameraLocksControl_iid "com.nokia.Qt.QCameraLocksControl/1.0"
Q_MEDIA_DECLARE_CONTROL(QCameraLocksControl, QCameraLocksControl_iid)

QT_END_NAMESPACE

#endif  // QCAMERALOCKSCONTROL_H

